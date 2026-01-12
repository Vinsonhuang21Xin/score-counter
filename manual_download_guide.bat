@echo off
chcp 65001 >nul
echo ========================================
echo   手动下载Gradle插件指南
echo ========================================
echo.

echo 需要下载的插件：
echo.
echo [1] Android Gradle Plugin 8.1.0
echo.
echo 下载地址（选择一个）：
echo.
echo 方案A：腾讯云镜像（推荐）
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/8.1.0/
echo.
echo 需要下载的文件：
echo 1. gradle-8.1.0.pom
echo 2. gradle-8.1.0.jar
echo.
echo ========================================
echo.
echo 方案B：阿里云镜像
echo https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/
echo 找到 8.1.0 文件夹，下载：
echo - gradle-8.1.0.pom
echo - gradle-8.1.0.jar
echo.
echo ========================================
echo.
echo 方案C：Maven中央仓库
echo https://repo1.maven.org/maven2/com/android/tools/build/gradle/8.1.0/
echo.
echo ========================================
echo   安装位置
echo ========================================
echo.
echo 下载完成后，把文件放到：
echo.
echo %%USERPROFILE%%\.gradle\caches\modules-2\files-2.1\com.android.tools.build\gradle\8.1.0\
echo.
echo 完整路径示例：
echo C:\Users\Vinson\.gradle\caches\modules-2\files-2.1\com.android.tools.build\gradle\8.1.0\
echo.
echo ========================================
echo   或者使用Maven命令安装
echo ========================================
echo.
echo 如果您有Maven，可以运行：
echo.
echo mvn install:install-file ^
echo   -Dfile=gradle-8.1.0.jar ^
echo   -DgroupId=com.android.tools.build ^
echo   -DartifactId=gradle ^
echo   -Dversion=8.1.0 ^
echo   -Dpackaging=jar
echo.
echo ========================================
echo.
pause
