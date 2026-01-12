@echo off
chcp 65001 >nul
echo ========================================
echo   更新Gitee Go工作流配置
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo [1/5] 检查当前Git状态...
git status
echo.

echo [2/5] 添加工作流配置文件...
git add .gitee/workflows/build.yml
echo ✓ 工作流文件已添加
echo.

echo [3/5] 提交配置...
git commit -m "更新Gitee Go工作流配置"
echo ✓ 提交完成
echo.

echo [4/5] 推送到Gitee...
echo ========================================
echo   推送说明
echo ========================================
echo.
echo 如果需要认证：
echo   Username: vinsonxin
echo   Password: 您的Gitee私人令牌
echo.
echo ========================================
echo.

git push origin master

echo.
echo ========================================
echo   检查推送结果
echo ========================================
echo.
if %ERRORLEVEL% EQU 0 (
    echo ✓ 推送成功！
    echo.
    echo 下一步操作：
    echo 1. 访问：https://gitee.com/vinsonxin/score-counter
    echo 2. 点击顶部菜单的"构建"或"Gitee Go"
    echo 3. 选择"从YAML创建流水线"
    echo 4. 选择分支：master
    echo 5. 选择文件：.gitee/workflows/build.yml
    echo 6. 点击"创建并运行"
    echo.
) else (
    echo ✗ 推送失败
    echo.
    echo 请检查网络连接和认证信息
)
echo.
pause
