@echo off
chcp 65001 >nul
echo ========================================
echo   检查镜像源上的AGP版本
echo ========================================
echo.

echo 请在浏览器中打开以下链接，检查哪些版本真实存在：
echo.

echo ========================================
echo   腾讯云Maven - Android Gradle Plugin
echo ========================================
echo.
echo 主目录（查看所有版本）：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/
echo.
echo 常用版本直接链接：
echo.
echo 7.0.0：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/7.0.0/
echo.
echo 7.2.0：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/7.2.0/
echo.
echo 7.4.0：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/7.4.0/
echo.
echo 8.0.0：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/8.0.0/
echo.
echo 8.2.0：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/8.2.0/
echo.
echo ========================================
echo   检查方法
echo ========================================
echo.
echo 1. 访问主目录链接，查看所有可用版本
echo 2. 点击进入某个版本文件夹（如 8.2.0/）
echo 3. 查看是否有以下文件：
echo    - gradle-X.X.X.pom
echo    - gradle-X.X.X.jar
echo.
echo 如果两个文件都存在，说明该版本可用！
echo.
echo ========================================
echo   可用的版本记录
echo ========================================
echo.
echo 请记录您找到的可用版本：
echo.
echo 找到的可用版本：____________________
echo.
echo ========================================
pause
