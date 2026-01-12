@echo off
chcp 65001 >nul
echo ========================================
echo   运行Flutter计分器（Windows版本）
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 当前目录：%CD%
echo.
echo 正在启动应用...
echo.

flutter run -d windows

echo.
echo 如果应用成功启动，说明代码文件完好！
echo.
pause
