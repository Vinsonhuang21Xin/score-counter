@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   Gradle完整重新初始化
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
if errorlevel 1 (
    echo ✗ 无法进入项目目录
    goto :end
)

echo 当前目录：%CD%
echo.

echo ========================================
echo   步骤1：清理缓存
echo ========================================
echo.

echo 清理Flutter缓存...
flutter clean >nul 2>&1
if errorlevel 1 (
    echo ⚠ Flutter clean警告（可忽略）
) else (
    echo ✓ Flutter缓存已清理
)
echo.

echo 清理Android build目录...
cd android
if exist build (
    rmdir /s /q build >nul 2>&1
    echo ✓ build目录已清理
)
if exist .gradle (
    rmdir /s /q .gradle >nul 2>&1
    echo ✓ .gradle目录已清理
)
cd ..
echo.

echo ========================================
echo   步骤2：获取Flutter依赖
echo ========================================
echo.

flutter pub get
if errorlevel 1 (
    echo ✗ Flutter依赖获取失败
    goto :end
)
echo ✓ Flutter依赖获取完成
echo.

echo ========================================
echo   步骤3：Gradle初始化
echo ========================================
echo.
echo 这一步会从镜像源下载所有Gradle插件
echo 可能需要5-10分钟，请耐心等待...
echo.

cd android
gradlew clean --no-daemon --refresh-dependencies
set GRADLE_RESULT=%errorlevel%
cd ..

echo.
if %GRADLE_RESULT% EQU 0 (
    echo ✓ Gradle初始化成功
) else (
    echo ✗ Gradle初始化失败（错误代码：%GRADLE_RESULT%）
    echo.
    echo 请查看上方错误信息，常见问题：
    echo 1. 网络无法访问镜像源
    echo 2. 插件版本不存在
    echo 3. JAVA_HOME未配置
    goto :end
)
echo.

echo ========================================
echo   步骤4：构建APK
echo ========================================
echo.
echo 开始构建APK（需要10-15分钟）...
echo.

flutter build apk --release
set BUILD_RESULT=%errorlevel%

echo.
echo ========================================
echo   结果
echo ========================================
echo.

if %BUILD_RESULT% EQU 0 (
    echo ✓✓✓ APK构建成功！✓✓✓
    echo.
    echo APK文件位置：
    echo %CD%\build\app\outputs\flutter-apk\app-release.apk
    echo.
) else (
    echo ✗ APK构建失败（错误代码：%BUILD_RESULT%）
    echo.
    echo 请查看上方错误信息
)

:end
echo.
echo 按任意键退出...
pause >nul
endlocal
