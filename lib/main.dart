import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ScoreCounterApp());
}

class ScoreCounterApp extends StatelessWidget {
  const ScoreCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '计分器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// 主页面
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _recentGames = [];

  @override
  void initState() {
    super.initState();
    _loadRecentGames();
  }

  Future<void> _loadRecentGames() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? historyData = prefs.getStringList('game_history');

    setState(() {
      if (historyData != null && historyData.isNotEmpty) {
        // 取最近3场比赛
        _recentGames = historyData
            .map((json) => jsonDecode(json) as Map<String, dynamic>)
            .toList()
            .reversed
            .take(3)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('计分器'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.scoreboard, size: 100, color: Colors.blue),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetupPlayersPage()),
                ).then((_) => _loadRecentGames());
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('开始新游戏', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                ).then((_) => _loadRecentGames());
              },
              icon: const Icon(Icons.history),
              label: const Text('全部历史记录', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
            const SizedBox(height: 40),
            if (_recentGames.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '最近比赛',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ...List.generate(_recentGames.length, (index) {
                final game = _recentGames[index];
                final date = DateTime.parse(game['date']);
                final players = List<String>.from(game['players']);
                final scores = List<int>.from(game['scores']);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.blue),
                    title: Text(
                      '${date.month}月${date.day}日 ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${players.length}人 · ${game['roundScores'].length}轮'),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryPage(),
                        ),
                      ).then((_) => _loadRecentGames());
                    },
                  ),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }
}

// 设置玩家页面
class SetupPlayersPage extends StatefulWidget {
  const SetupPlayersPage({super.key});

  @override
  State<SetupPlayersPage> createState() => _SetupPlayersPageState();
}

class _SetupPlayersPageState extends State<SetupPlayersPage> {
  final List<TextEditingController> _nameControllers = [];
  int _playerCount = 2;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _playerCount; i++) {
      _nameControllers.add(TextEditingController(text: '玩家${i + 1}'));
    }
  }

  @override
  void dispose() {
    for (var controller in _nameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _updatePlayerCount(int count) {
    setState(() {
      if (count > _nameControllers.length) {
        while (_nameControllers.length < count) {
          _nameControllers.add(TextEditingController(text: '玩家${_nameControllers.length + 1}'));
        }
      } else if (count < _nameControllers.length) {
        while (_nameControllers.length > count) {
          _nameControllers.removeLast().dispose();
        }
      }
      _playerCount = count;
    });
  }

  void _startGame() {
    final players = _nameControllers.map((controller) => controller.text).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(players: players),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置玩家'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('玩家人数：', style: TextStyle(fontSize: 18)),
                Row(
                  children: [
                    IconButton(
                      onPressed: _playerCount > 2 ? () => _updatePlayerCount(_playerCount - 1) : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_playerCount', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed: _playerCount < 8 ? () => _updatePlayerCount(_playerCount + 1) : null,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _playerCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: _nameControllers[index],
                      decoration: InputDecoration(
                        labelText: '玩家${index + 1}姓名',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _startGame,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('开始游戏', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 游戏页面
class GamePage extends StatefulWidget {
  final List<String> players;

  const GamePage({super.key, required this.players});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<int> _scores;
  late List<List<int>> _roundScores;
  int _currentRound = 1;

  @override
  void initState() {
    super.initState();
    _scores = List.filled(widget.players.length, 0);
    _roundScores = [];
  }

  void _addRoundScore(List<int> roundScore) {
    setState(() {
      _roundScores.add(roundScore);
      for (int i = 0; i < widget.players.length; i++) {
        _scores[i] += roundScore[i];
      }
      _currentRound++;
    });
  }

  void _editLastRound() {
    if (_roundScores.isEmpty) return;

    // 先减去最后一轮的分数
    setState(() {
      final lastRound = _roundScores.last;
      for (int i = 0; i < widget.players.length; i++) {
        _scores[i] -= lastRound[i];
      }
      _roundScores.removeLast();
      _currentRound--;
    });

    // 打开输入框让用户重新输入
    _showRoundScoreDialog(isEditing: true);
  }

  void _showRoundScoreDialog({bool isEditing = false}) {
    final addControllers = List.generate(
      widget.players.length,
      (index) => TextEditingController(text: '0'),
    );
    final minusControllers = List.generate(
      widget.players.length,
      (index) => TextEditingController(text: '0'),
    );

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            // 计算总分
            int calculateTotal() {
              int total = 0;
              for (int i = 0; i < widget.players.length; i++) {
                total += (int.tryParse(addControllers[i].text) ?? 0);
                total -= (int.tryParse(minusControllers[i].text) ?? 0);
              }
              return total;
            }

            return AlertDialog(
              title: Text(isEditing ? '修改第$_currentRound轮' : '第$_currentRound轮计分'),
              content: SizedBox(
                width: 400,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(widget.players.length, (index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.players[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: addControllers[index],
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: '加分',
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.add_circle, color: Colors.green),
                                        ),
                                        onChanged: (value) => setDialogState(() {}),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: TextField(
                                        controller: minusControllers[index],
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: '扣分',
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.remove_circle, color: Colors.red),
                                        ),
                                        onChanged: (value) => setDialogState(() {}),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 16),
                      // 显示总分
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: calculateTotal() == 0 ? Colors.green.shade50 : Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: calculateTotal() == 0 ? Colors.green : Colors.orange,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              calculateTotal() == 0 ? Icons.check_circle : Icons.warning,
                              color: calculateTotal() == 0 ? Colors.green : Colors.orange,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '本轮合计：${calculateTotal()}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: calculateTotal() == 0 ? Colors.green : Colors.orange,
                              ),
                            ),
                            if (calculateTotal() != 0) ...[
                              const SizedBox(width: 8),
                              const Text(
                                '(应为0)',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('取消'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final scores = <int>[];
                    for (int i = 0; i < widget.players.length; i++) {
                      int add = int.tryParse(addControllers[i].text) ?? 0;
                      int minus = int.tryParse(minusControllers[i].text) ?? 0;
                      scores.add(add - minus);
                    }

                    // 检查总分
                    if (scores.reduce((a, b) => a + b) != 0) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('总分校验失败'),
                          content: Text('本轮总分为${scores.reduce((a, b) => a + b)}，应该为0。\n\n可能录入有误，是否继续？'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('重录'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _addRoundScore(scores);
                                Navigator.pop(context); // 关闭确认对话框
                                Navigator.pop(context); // 关闭计分对话框
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              child: const Text('继续使用'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      _addRoundScore(scores);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('确定'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showHistoryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('详细历史'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _roundScores.length,
            itemBuilder: (context, roundIndex) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('第${roundIndex + 1}轮', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      ...List.generate(widget.players.length, (playerIndex) {
                        return Text(
                          '${widget.players[playerIndex]}: ${_roundScores[roundIndex][playerIndex]}',
                          style: const TextStyle(fontSize: 12),
                        );
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveGame() async {
    final prefs = await SharedPreferences.getInstance();
    final gameData = {
      'date': DateTime.now().toIso8601String(),
      'players': widget.players,
      'scores': _scores,
      'roundScores': _roundScores,
    };

    List<String> history = prefs.getStringList('game_history') ?? [];
    history.add(jsonEncode(gameData));
    await prefs.setStringList('game_history', history);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('游戏已保存')),
    );
  }

  Future<void> _endGame() async {
    // 先保存游戏
    await _saveGame();

    // 确认结束游戏
    if (!mounted) return;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('结束游戏'),
        content: Text('游戏已保存并结束！\n\n最高分：${widget.players[_scores.indexOf(_scores.reduce((a, b) => a > b ? a : b))]}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      Navigator.pop(context); // 返回首页
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第$_currentRound轮'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _showHistoryDialog,
            icon: const Icon(Icons.history),
            tooltip: '详细历史',
          ),
        ],
      ),
      body: Column(
        children: [
          // 分数卡片
          Expanded(
            child: ListView.builder(
              itemCount: widget.players.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.players[index],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${_scores[index]}',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: _scores[index] >= 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // 操作按钮
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _showRoundScoreDialog(),
                    icon: const Icon(Icons.add),
                    label: const Text('记录本轮分数', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _roundScores.isNotEmpty ? _editLastRound : null,
                        icon: const Icon(Icons.edit),
                        label: const Text('修改上轮'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _saveGame,
                        icon: const Icon(Icons.save),
                        label: const Text('保存游戏'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _endGame,
                    icon: const Icon(Icons.stop_circle),
                    label: const Text('结束游戏', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 历史记录页面
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? historyData = prefs.getStringList('game_history');

    setState(() {
      if (historyData != null) {
        _history = historyData.map((json) => jsonDecode(json) as Map<String, dynamic>).toList().reversed.toList();
      }
    });
  }

  Future<void> _clearHistory() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除所有历史记录吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('game_history');
      _loadHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('历史记录'),
        centerTitle: true,
        actions: [
          if (_history.isNotEmpty)
            IconButton(
              onPressed: _clearHistory,
              icon: const Icon(Icons.delete_outline),
              tooltip: '清空历史',
            ),
        ],
      ),
      body: _history.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('暂无历史记录', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                final game = _history[index];
                final date = DateTime.parse(game['date']);
                final players = List<String>.from(game['players']);
                final scores = List<int>.from(game['scores']);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ExpansionTile(
                    title: Text(
                      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${players.length}人参与 · ${game['roundScores'].length}轮'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: List.generate(players.length, (i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(players[i]),
                                  Text(
                                    '${scores[i]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: scores[i] >= 0 ? Colors.green : Colors.red,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
