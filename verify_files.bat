@echo off
chcp 65001 >nul
echo ========================================
echo   验证文件安装
echo ========================================
echo.

echo [1/3] 检查Gradle 8.8...
dir "C:\Users\Vinson\.gradle\wrapper\dists\gradle-8.8-bin" /b >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✓ Gradle 8.8 目录存在
    dir "C:\Users\Vinson\.gradle\wrapper\dists\gradle-8.8-bin" /s /b | findstr /i "bin\gradle.bat" >nul
    if %ERRORLEVEL% EQU 0 (
        echo ✓ Gradle 8.8 已安装
    ) else (
        echo ⚠ Gradle 8.8 目录为空或未完全解压
    )
) else (
    echo ✗ Gradle 8.8 目录不存在
)
echo.

echo [2/3] 检查AGP 8.2.0...
dir "C:\Users\Vinson\.gradle\caches\modules-2\files-2.1\com.android.tools.build\gradle\8.2.0\*.pom" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✓ gradle-8.2.0.pom 存在
) else (
    echo ✗ gradle-8.2.0.pom 不存在
)

dir "C:\Users\Vinson\.gradle\caches\modules-2\files-2.1\com.android.tools.build\gradle\8.2.0\*.jar" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✓ gradle-8.2.0.jar 存在
) else (
    echo ✗ gradle-8.2.0.jar 不存在
)
echo.

echo [3/3] 检查Kotlin 1.9.0...
dir "C:\Users\Vinson\.gradle\caches\modules-2\files-2.1\org.jetbrains.kotlin.kotlin-gradle-plugin\1.9.0\*.pom" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✓ kotlin-gradle-plugin-1.9.0.pom 存在
) else (
    echo ✗ kotlin-gradle-plugin-1.9.0.pom 不存在
)

dir "C:\Users\Vinson\.gradle\caches\modules-2\files-2.1\org.jetbrains.kotlin.kotlin-gradle-plugin\1.9.0\*.jar" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✓ kotlin-gradle-plugin-1.9.0.jar 存在
) else (
    echo ✗ kotlin-gradle-plugin-1.9.0.jar 不存在
)
echo.

echo ========================================
echo   构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 开始构建...
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
    echo 请查看上方的错误信息
)
echo.
pause
