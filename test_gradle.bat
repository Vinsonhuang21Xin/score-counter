@echo off
chcp 65001 >nul
echo ========================================
echo   测试Gradle环境
echo ========================================
echo.

echo [测试1] 进入项目目录...
cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
echo 当前目录：%CD%
echo.

echo [测试2] 检查gradlew是否存在...
if exist android\gradlew.bat (
    echo ✓ gradlew.bat存在
) else (
    echo ✗ gradlew.bat不存在
)
echo.

echo [测试3] 运行gradlew clean...
echo.
cd android
gradlew clean
echo.

echo [测试4] 检查返回码：%ERRORLEVEL%
echo.

echo ========================================
echo   测试完成
echo ========================================
echo.
pause
