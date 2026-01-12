@echo off
chcp 65001 >nul
echo ========================================
echo   查看阿里云Maven上的AGP版本
echo ========================================
echo.

echo 请在浏览器中访问以下链接，查看阿里云Maven仓库上
echo 实际可用的Android Gradle Plugin版本：
echo.
echo ========================================
echo   阿里云Maven镜像 - AGP版本列表
echo ========================================
echo.
echo [方法1] 直接访问目录页面（推荐）
echo.
echo 复制这个链接到浏览器：
echo https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/
echo.
echo 您会看到所有版本号文件夹（如 7.3.0/, 7.4.2/, 8.0.2/ 等）
echo.
echo ========================================
echo   推荐的稳定版本
echo ========================================
echo.
echo 根据MVNRepository和Flutter兼容性，推荐选择：
echo.
echo [选项A] 7.4.2（稳定，Flutter 3.24支持）
echo   https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/7.4.2/
echo.
echo [选项B] 8.0.2（较新）
echo   https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/8.0.2/
echo.
echo [选项C] 7.3.0（更保守）
echo   https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/7.3.0/
echo.
echo ========================================
echo   操作步骤
echo ========================================
echo.
echo 1. 访问上面的链接（选择7.4.2或其他版本）
echo 2. 进入版本文件夹（如 7.4.2/）
echo 3. 下载两个文件：
echo    - gradle-7.4.2.pom
echo    - gradle-7.4.2.jar
echo 4. 告诉我您选择的版本
echo 5. 我会帮您修改配置并安装
echo.
echo ========================================
echo   参考：MVNRepository版本列表
echo ========================================
echo.
echo 完整版本列表：
echo https://mvnrepository.com/artifact/com.android.tools.build/gradle
echo.
echo ========================================
echo.
pause
