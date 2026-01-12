@echo off
chcp 65001 >nul
echo ========================================
echo   使用本地Gradle + 国内镜像构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

set GRADLE_HOME=C:\Users\Vinson\.gradle\wrapper\dists\gradle-8.8-bin\gradle-8.8
set GRADLE_EXE=%GRADLE_HOME%\bin\gradle.bat

echo 当前配置：
echo - Gradle: 8.8（本地已安装）
echo - Maven镜像：阿里云、腾讯云、华为云
echo - AGP 8.2.0：本地已安装
echo - Kotlin 1.9.0：本地已安装
echo.

echo ========================================
echo   步骤1：清理
echo ========================================
echo.

cd android
"%GRADLE_EXE%" clean --no-daemon --init-script init.gradle --refresh-dependencies

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ⚠ 清理失败（可能是首次构建）
    echo 继续尝试构建...
    echo.
)

echo.
echo ========================================
echo   步骤2：构建APK
echo ========================================
echo.

"%GRADLE_EXE%" assembleRelease --no-daemon --init-script init.gradle

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ✗ Gradle构建失败
    echo.
    echo 可能的原因：
    echo 1. 手动安装的AGP 8.2.0不兼容
    echo 2. 手动安装的Kotlin 1.9.0不兼容
    echo 3. 其他依赖问题
    echo.
    echo 建议降级到更稳定的版本组合：
    echo - Gradle 7.0 + AGP 7.0.0 + Kotlin 1.7.10
    echo.
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
echo   构建结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓✓✓ APK构建成功！✓✓✓
    echo ========================================
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
