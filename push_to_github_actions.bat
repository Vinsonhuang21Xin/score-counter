@echo off
chcp 65001 >nul
echo ========================================
echo   推送到GitHub并自动构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo ========================================
echo   步骤1：初始化Git仓库
echo ========================================
echo.

git init
git add .

echo ========================================
echo   步骤2：提交代码
echo ========================================
echo.

git commit -m "Flutter计分器App"

echo ========================================
echo   步骤3：推送到GitHub
echo ========================================
echo.
echo 说明：
echo - 需要先在GitHub上创建仓库
echo - 仓库名：score-counter
echo - 创建后按任意键继续...
echo.
pause

echo.
echo 请输入您的GitHub用户名：
set /p USERNAME=

git remote remove origin 2>nul
git branch -M main
git remote add origin https://github.com/%USERNAME%/score-counter.git

echo.
echo 正在推送到GitHub...
echo.
git push -u origin main

echo.
echo ========================================
echo   推送完成！
echo ========================================
echo.
echo 下一步操作：
echo.
echo 1. 访问您的GitHub仓库
echo    https://github.com/%USERNAME%/score-counter
echo.
echo 2. 点击顶部的 "Actions" 标签
echo.
echo 3. 选择 "Build APK" 工作流
echo.
echo 4. 点击 "Run workflow" 按钮
echo.
echo 5. 等待10-15分钟自动构建
echo.
echo 6. 构建完成后，在Actions页面下载APK
echo.
echo ========================================
echo.
pause
