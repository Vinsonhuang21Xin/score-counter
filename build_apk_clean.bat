@echo off
chcp 65001 >nul
echo ========================================
echo   清理缓存并构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo [1/4] 清理Flutter缓存...
flutter clean
echo.

echo [2/4] 清理Gradle缓存...
cd android
gradlew clean
cd ..
echo.

echo [3/4] 获取依赖...
flutter pub get
echo.

echo [4/4] 构建APK（可能需要10-15分钟）...
echo.
flutter build apk --release

echo.
echo ========================================
echo   构建结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo ✓ 构建成功！
    echo.
    echo APK文件位置：
    echo build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo 完整路径：
    echo D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter\build\app\outputs\flutter-apk\app-release.apk
    echo.
) else (
    echo ✗ 构建失败
    echo.
    echo 如果还是提示kotlin-dsl插件下载失败，
    echo 请把完整的错误信息发给我！
)
echo.
pause
