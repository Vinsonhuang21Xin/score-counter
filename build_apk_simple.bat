@echo off
chcp 65001 >nul
echo ========================================
echo   直接构建APK（简化版）
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 当前目录：%CD%
echo.
echo 配置信息：
echo - Android Gradle Plugin: 7.0.0
echo - Kotlin: 1.7.10
echo - 镜像源：阿里云、腾讯云、华为云
echo.

echo ========================================
echo   开始构建APK
echo ========================================
echo.
echo 说明：跳过清理步骤，直接构建
echo 预计需要15-20分钟，请耐心等待...
echo.

flutter build apk --release

echo.
echo ========================================
echo   结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo ✓✓✓ APK构建成功！✓✓✓
    echo.
    echo APK文件位置：
    echo build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo 完整路径：
    echo %CD%\build\app\outputs\flutter-apk\app-release.apk
    echo.
) else (
    echo ✗ 构建失败
    echo.
    echo 错误代码：%ERRORLEVEL%
    echo.
    echo 请查看上方的错误信息
)
echo.
pause
