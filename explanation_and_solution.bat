@echo off
chcp 65001 >nul
echo ========================================
echo   为什么缺少pom和jar文件
echo ========================================
echo.

echo 1. Gradle（构建工具）
echo    ✓ 已安装：Gradle 8.3
echo    ✓ 位置：项目自带的gradle wrapper
echo.
echo 2. Android Gradle Plugin（插件）
echo    ✗ 缺失：需要从网络下载
echo    ✗ 位置：Google Maven仓库（被墙了）
echo.
echo ========================================
echo   问题根源
echo ========================================
echo.
echo Android Gradle Plugin托管在Google服务器上
echo 国内网络无法访问，所以Gradle无法下载
echo.
echo ========================================
echo   解决方案
echo ========================================
echo.
echo [方案A] 从Google Maven下载（推荐）
echo.
echo 请尝试访问：
echo https://dl.google.com/dl/android/maven2/com/android/tools/build/gradle/7.4.2/
echo.
echo 如果打不开，说明网络确实无法访问Google
echo.
echo ========================================
echo.
echo [方案B] 使用VPN/代理
echo.
echo 如果您的VPN支持代理，可以配置Gradle使用代理：
echo.
echo 1. 找到gradle.properties文件
echo    位置：C:\Users\Vinson\.gradle\gradle.properties
echo.
echo 2. 添加代理配置：
echo    systemProp.http.proxyHost=127.0.0.1
echo    systemProp.http.proxyPort=您的代理端口
echo    systemProp.https.proxyHost=127.0.0.1
echo    systemProp.https.proxyPort=您的代理端口
echo.
echo ========================================
echo.
echo [方案C] 降级Flutter版本
echo.
echo 如果上述方案都不可行：
echo 1. 下载Flutter 3.13.x（更旧但稳定）
echo 2. 它的依赖可能更容易下载
echo.
echo ========================================
echo.
echo [方案D] 找朋友帮忙
echo.
echo 请有外网的朋友：
echo 1. 下载gradle-7.4.2.pom
echo 2. 下载gradle-7.4.2.jar
echo 3. 通过网盘发给您
echo.
echo ========================================
echo.
echo 您想尝试哪个方案？
echo.
pause
