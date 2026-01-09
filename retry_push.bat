@echo off
chcp 65001 >nul
echo ========================================
echo   重试推送代码
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 正在推送代码...
echo.

git push

echo.
echo ========================================
echo   ✓ 推送成功！
echo ========================================
echo.
echo 访问查看Actions：
echo   https://github.com/Vinsonhuang21Xin/score-counter/actions
echo.
pause

:retry
echo.
echo 推送失败，正在重试...
timeout /t 3 >nul
git push
goto :retry
