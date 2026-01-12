@echo off
chcp 65001 >nul
echo ========================================
echo   Gradle完整重新初始化（详细版）
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
echo 当前目录：%CD%
echo.

echo ========================================
echo   步骤1：清理Flutter缓存
echo ========================================
echo.
call flutter clean
echo.

echo ========================================
echo   步骤2：获取依赖
echo ========================================
echo.
call flutter pub get
echo.

echo ========================================
echo   步骤3：清理Android缓存
echo ========================================
echo.
cd android
if exist build rmdir /s /q build
if exist .gradle rmdir /s /q .gradle
cd ..
echo.
echo ✓ 清理完成
echo.

echo ========================================
echo   步骤4：Gradle初始化（5-10分钟）
echo ========================================
echo.
cd android
call gradlew clean --no-daemon --refresh-dependencies
cd ..
echo.

if errorlevel 1 (
    echo ✗ Gradle初始化失败
    echo.
    echo 请查看上方错误信息
    pause
    exit /b 1
)

echo ========================================
echo   步骤5：构建APK（10-15分钟）
echo ========================================
echo.
call flutter build apk --release
echo.

if errorlevel 1 (
    echo ✗ APK构建失败
    pause
    exit /b 1
)

echo ========================================
echo   ✓✓✓ 构建成功！✓✓✓
echo ========================================
echo.
echo APK文件：
echo build\app\outputs\flutter-apk\app-release.apk
echo.
pause
