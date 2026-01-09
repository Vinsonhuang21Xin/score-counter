@echo off
chcp 65001 >nul
echo ========================================
echo   上传代码到Gitee
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo [1/6] 初始化Git仓库...
if exist .git (
    echo ✓ Git仓库已存在
) else (
    git init
    echo ✓ Git仓库初始化完成
)

echo.
echo [2/6] 配置Git用户信息...
git config user.name "vinsonxin"
git config user.email "vinson@example.com"
echo ✓ Git配置完成

echo.
echo [3/6] 添加所有文件...
git add .
echo ✓ 文件添加完成

echo.
echo [4/6] 提交代码...
git commit -m "Flutter计分器App"
echo ✓ 提交完成

echo.
echo [5/6] 连接到Gitee仓库...
git remote remove origin 2>nul
git remote add origin https://gitee.com/vinsonxin/score-counter.git
echo ✓ 远程仓库连接完成

echo.
echo [6/6] 推送代码到Gitee...
echo.
echo ========================================
echo   Gitee登录提示
echo ========================================
echo.
echo Username: vinsonxin
echo Password: 输入您的Gitee密码
echo.
echo 如果提示权限错误，需要使用Gitee的私人令牌：
echo 1. 访问：https://gitee.com/profile/personal_access_tokens
echo 2. 生成新令牌
echo 3. 用令牌代替密码
echo.
pause

git branch -M master
git push -u origin master

echo.
echo ========================================
echo   ✓ 上传成功！
echo ========================================
echo.
echo 访问查看Gitee Go：
echo   https://gitee.com/vinsonxin/score-counter
echo.
echo 点击"构建"菜单，查看自动构建状态
echo 等待10-15分钟后下载APK
echo.
pause
