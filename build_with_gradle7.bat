@echo off
chcp 65001 >nul
echo ========================================
echo   使用Gradle 7.0构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 版本配置：
echo - Gradle: 7.0
echo - Android Gradle Plugin: 7.0.0
echo - Kotlin: 1.5.32
echo.
echo ========================================
echo   清理旧Gradle缓存
echo ========================================
echo.

cd android
if exist .gradle rmdir /s /q .gradle
echo ✓ 已清理 .gradle 目录
cd ..
echo.

echo ========================================
echo   开始构建APK
echo ========================================
echo.
echo 说明：首次运行Gradle 7.0需要下载（约200MB）
echo 预计需要10-20分钟，请耐心等待...
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
) else (
    echo ✗ 构建失败
    echo.
    echo 如果还是提示找不到7.0.0插件，
    echo 说明镜像源确实没有这个版本
    echo.
    echo 建议方案：
    echo 1. 编译成Web应用（推荐）
    echo 2. 使用GitHub Codespaces
    echo 3. 找朋友帮忙
)
echo.
pause
