@echo off
chcp 65001 >nul
echo ========================================
echo   推送到GitHub并自动构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 步骤1：确保开启了VPN
echo.
echo 请先开启您的VPN，然后按任意键继续...
pause >nul

echo.
echo ========================================
echo   步骤2：添加GitHub远程仓库
echo ========================================
echo.

echo 请输入您的GitHub用户名：
set /p GITHUB_USERNAME=

git remote remove github 2>nul
git remote add github https://github.com/%GITHUB_USERNAME%/score-counter.git

echo.
echo ========================================
echo   步骤3：推送到GitHub
echo ========================================
echo.

echo 正在推送代码到GitHub（需要VPN）...
echo.
git push github main

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo 推送失败！
    echo.
    echo 可能的原因：
    echo 1. VPN未开启或连接不稳定
    echo 2. GitHub仓库未创建
    echo 3. GitHub用户名或密码错误
    echo.
    echo 请先在 https://github.com/new 创建仓库
    echo 仓库名：score-counter
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✓ 推送成功！
echo ========================================
echo.
echo 下一步操作：
echo.
echo 1. 访问您的GitHub仓库：
echo    https://github.com/%GITHUB_USERNAME%/score-counter
echo.
echo 2. 点击顶部的 "Actions" 标签
echo.
echo 3. 选择 "Build Android APK" 工作流
echo.
echo 4. 点击 "Run workflow" 按钮
echo.
echo 5. 选择 main 分支，点击绿色的 "Run workflow"
echo.
echo 6. 等待10-15分钟自动构建
echo.
echo 7. 构建完成后，在Actions页面下载APK
echo.
echo ========================================
echo.
pause
