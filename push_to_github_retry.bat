@echo off
chcp 65001 >nul
echo ========================================
echo   推送代码到GitHub
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 重要提示：请确保您的VPN已开启！
echo.
pause

echo.
echo 正在推送代码到GitHub...
echo.

git remote remove github 2>nul
git remote add github https://github.com/Vinsonhuang21Xin/score-counter.git
git branch -M main
git push github main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓ 推送成功！
    echo ========================================
    echo.
    echo 下一步操作：
    echo.
    echo 1. 访问您的GitHub仓库：
    echo    https://github.com/Vinsonhuang21Xin/score-counter
    echo.
    echo 2. 点击顶部的 "Actions" 标签
    echo.
    echo 3. 选择 "Build Android APK" 工作流
    echo.
    echo 4. 点击 "Run workflow" 按钮
    echo.
    echo 5. 选择 main 分支，点击绿色的运行按钮
    echo.
    echo 6. 等待10-15分钟自动构建
    echo.
    echo 7. 构建完成后，点击进入构建记录
    echo.
    echo 8. 在 "Artifacts" 区域下载 APK 文件
    echo.
    echo ========================================
    echo.
    start https://github.com/Vinsonhuang21Xin/score-counter/actions
) else (
    echo.
    echo ✗ 推送失败！
    echo.
    echo 请检查：
    echo 1. VPN是否已开启
    echo 2. 网络连接是否正常
    echo 3. GitHub仓库是否已创建
    echo.
    echo 如果持续失败，请联系我获取替代方案
    echo.
)
pause
