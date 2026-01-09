@echo off
chcp 65001 >nul
cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo [1/6] 配置Git用户信息...
git config --global user.name "Vinsonhuang21Xin"
git config --global user.email "vinson@example.com"
echo ✓ Git配置完成

echo.
echo [2/6] 初始化仓库...
git init
echo ✓ 初始化完成

echo.
echo [3/6] 添加文件...
git add .
echo ✓ 文件添加完成

echo.
echo [4/6] 提交代码...
git commit -m "计分器App"
echo ✓ 提交完成

echo.
echo [5/6] 设置远程仓库...
git remote add origin https://github.com/Vinsonhuang21Xin/score-counter.git
echo ✓ 远程仓库设置完成

echo.
echo [6/6] 推送代码到GitHub...
echo.
echo ========================================
echo   接下来需要输入Token
echo ========================================
echo.
echo Username: Vinsonhuang21Xin
echo Password: 粘贴您的Token
echo.

git branch -M main
git push -u origin main

echo.
echo ✓ 上传完成！
echo.
echo 访问：https://github.com/Vinsonhuang21Xin/score-counter/actions
echo.
pause
