@echo off
chcp 65001 >nul
echo ========================================
echo   上传代码到GitHub
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
echo [2/6] 添加所有文件...
git add .
echo ✓ 文件添加完成

echo.
echo [3/6] 提交代码...
git commit -m "计分器App完整代码"
echo ✓ 提交完成

echo.
echo [4/6] 设置远程仓库...
echo 请输入您的GitHub用户名：
set /p USERNAME=

echo.
echo 请输入您在GitHub创建的仓库名称（通常是score-counter）：
set /p REPO=

git remote remove origin 2>nul
git remote add origin https://github.com/%USERNAME%/%REPO%.git
echo ✓ 远程仓库设置完成

echo.
echo [5/6] 推送代码到GitHub...
echo.
echo ========================================
echo   重要提示
echo ========================================
echo.
echo 接下来可能需要您登录GitHub：
echo 1. 用户名：输入您的GitHub用户名
echo 2. 密码：输入您的Personal Access Token（不是GitHub密码）
echo.
echo 如果没有Token，请先创建：
echo https://github.com/settings/tokens
echo （勾选 repo 权限）
echo.
echo ========================================
echo.

pause

git branch -M main
git push -u origin main

echo.
echo [6/6] 上传完成！
echo.
echo ========================================
echo   ✓ 代码已上传到GitHub
echo ========================================
echo.
echo 下一步：
echo 1. 访问：https://github.com/%USERNAME%/%REPO%/actions
echo 2. 等待10分钟
echo 3. 下载APK
echo.
pause
