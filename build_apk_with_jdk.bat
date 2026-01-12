@echo off
chcp 65001 >nul
echo ========================================
echo   使用代理网络构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 检查Java安装...
java -version

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ✗ Java未安装或未配置环境变量
    echo.
    echo 请先运行 install_jdk_guide.bat 安装JDK
    echo.
    pause
    exit /b 1
)

echo.
echo ✓ Java已安装
echo.
echo ========================================
echo   重要提示
echo ========================================
echo.
echo 构建过程需要从国际网络下载以下依赖：
echo - Android Gradle Plugin 8.2.0
echo - Kotlin插件和相关库
echo - Android SDK组件
echo - 其他Maven依赖
echo.
echo 总下载大小：约3-5GB
echo 预计时间：15-30分钟（取决于网络速度）
echo.
echo 请确保：
echo 1. 您的VPN/代理已启动
echo 2. 代理模式为TUN或系统代理
echo 3. 磁盘有至少5GB可用空间
echo.
echo 如果构建失败，请检查：
echo - 网络连接是否正常
echo - 代理是否正确配置
echo - 防火墙是否阻止连接
echo.
echo ========================================
echo.
echo 按任意键开始构建...
echo.
pause

echo.
echo ========================================
echo   开始构建APK（可能需要15-30分钟）
echo ========================================
echo.

echo 清理旧构建...
cd android
gradlew clean --no-daemon

echo.
echo 开始构建...
gradlew assembleRelease --no-daemon

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓✓✓ APK构建成功！✓✓✓
    echo ========================================
    echo.
    cd ..
    echo APK文件位置：
    echo build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo 完整路径：
    echo %CD%\build\app\outputs\flutter-apk\app-release.apk
    echo.
) else (
    echo.
    echo ✗ Gradle构建失败
    echo.
    echo 可能的原因：
    echo 1. 网络连接问题，无法下载依赖
    echo 2. 代理配置不正确
    echo 3. 防火墙阻止了连接
    echo.
    echo 建议：
    echo 1. 检查VPN/代理是否正常运行
    echo 2. 尝试在浏览器访问：
    echo    https://services.gradle.org/distributions/
    echo 3. 如果上述页面无法访问，说明网络未正常代理
    echo.
    cd ..
)
echo.
pause
