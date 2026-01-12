@echo off
chcp 65001 >nul
echo ========================================
echo   使用本地Gradle构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

set GRADLE_HOME=C:\Users\Vinson\.gradle\wrapper\dists\gradle-8.8-bin\gradle-8.8
set GRADLE_EXE=%GRADLE_HOME%\bin\gradle.bat

echo 使用本地Gradle: %GRADLE_EXE%
echo.
echo ========================================
echo   步骤1：清理并构建
echo ========================================
echo.

cd android
"%GRADLE_EXE%" clean --no-daemon --refresh-dependencies

if %ERRORLEVEL% NEQ 0 (
    echo ✗ Gradle清理失败
    pause
    exit /b 1
)

echo.
echo ✓ 清理成功
echo.
echo ========================================
echo   步骤2：构建APK
echo ========================================
echo.

"%GRADLE_EXE%" assembleRelease --no-daemon

if %ERRORLEVEL% NEQ 0 (
    echo ✗ APK构建失败
    pause
    exit /b 1
)

echo.
echo ========================================
echo   步骤3：Flutter打包
echo ========================================
echo.

cd ..
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
    echo ✗ 最终打包失败
)
echo.
pause
