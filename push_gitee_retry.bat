@echo off
chcp 65001 >nul
echo ========================================
echo   重新推送到Gitee
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo [1/7] 检查Git状态...
git status
echo.

echo [2/7] 添加所有文件...
git add .
echo.

echo [3/7] 查看待提交的文件...
echo 将要提交的文件：
git status
echo.

echo [4/7] 提交代码...
git commit -m "Flutter计分器App完整代码"
echo.

echo [5/7] 设置远程仓库...
git remote remove origin 2>nul
git remote add origin https://gitee.com/vinsonxin/score-counter.git
echo.

echo [6/7] 设置分支为master...
git branch -M master
echo.

echo [7/7] 推送到Gitee...
echo.
echo ========================================
echo   推送说明
echo ========================================
echo.
echo 可能需要认证：
echo.
echo 方式1：输入用户名和密码
echo   Username: vinsonxin
echo   Password: 您的Gitee密码
echo.
echo 方式2：使用私人令牌（推荐）
echo   1. 访问：https://gitee.com/profile/personal_access_tokens
echo   2. 生成新令牌（勾选 projects 权限）
echo   3. 复制令牌
echo   4. 推送时用户名输入 vinsonxin
echo   5. 密码粘贴令牌
echo.
echo ========================================
echo.

pause

git push -u origin master --force

echo.
echo ========================================
echo   检查推送结果
echo ========================================
echo.
if %ERRORLEVEL% EQU 0 (
    echo ✓ 推送成功！
    echo.
    echo 访问查看：https://gitee.com/vinsonxin/score-counter
) else (
    echo ✗ 推送失败
    echo.
    echo 请检查：
    echo 1. 网络连接是否正常
    echo 2. 用户名和密码是否正确
    echo 3. 是否需要使用私人令牌
)
echo.
pause
