@echo off
chcp 65001 >nul
echo ========================================
echo   完整重新配置Gradle并下载依赖
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 已配置的镜像源：
echo - 阿里云 Maven（多个仓库）
echo - 腾讯云 Maven
echo - 华为云 Maven
echo - Google Maven（官方）
echo - Maven Central
echo.

echo ========================================
echo   步骤1：清除所有缓存
echo ========================================
echo.

echo [1/4] 清除Flutter缓存...
flutter clean
echo.

echo [2/4] 清除Gradle缓存...
cd android
if exist .gradle (
    rmdir /s /q .gradle
    echo ✓ 已清除 .gradle 目录
)
if exist build (
    rmdir /s /q build
    echo ✓ 已清除 build 目录
)
cd ..
echo.

echo [3/4] 清除用户Gradle缓存中的项目相关文件...
set GRADLE_CACHE=%USERPROFILE%\.gradle\caches
if exist "%GRADLE_CACHE%" (
    echo 正在清除Gradle缓存...
    del /s /q "%GRADLE_CACHE%\*.lock" >nul 2>&1
    echo ✓ 已清除锁文件
)
echo.

echo ========================================
echo   步骤2：重新初始化Gradle
echo ========================================
echo.

echo [4/4] 重新下载所有依赖并初始化...
echo 这可能需要5-15分钟，请耐心等待...
echo.

cd android
gradlew clean --refresh-dependencies --no-daemon

echo.
echo ========================================
echo   初始化结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo ✓✓✓ Gradle初始化成功！✓✓✓
    echo.
    echo 现在构建APK...
    echo.
    cd ..
    flutter build apk --release

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
        echo.
        echo ✗ APK构建失败
        echo.
        echo 请检查错误信息
    )
) else (
    echo ✗ Gradle初始化失败
    echo.
    echo 可能的原因：
    echo 1. 网络问题，无法访问镜像源
    echo 2. 版本7.0.0在镜像源中不存在
    echo.
    echo 建议：
    echo 1. 查看上面的错误信息
    echo 2. 如果提示找不到7.0.0版本，我们可以尝试其他版本
    echo.
)

echo.
pause
