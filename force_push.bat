@echo off
chcp 65001 >nul
cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 强制推送到GitHub（覆盖远程仓库）...
echo.

git push -u origin main --force

echo.
echo ========================================
echo   ✓ 上传完成！
echo ========================================
echo.
echo 访问查看Actions：
echo   https://github.com/Vinsonhuang21Xin/score-counter/actions
echo.
echo 等待10分钟后下载APK
echo.
pause
