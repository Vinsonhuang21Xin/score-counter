@echo off
chcp 65001 >nul
echo ========================================
echo   手动安装Gradle插件
echo ========================================
echo.

set GRADLE_CACHE=%USERPROFILE%\.gradle\caches\modules-2\files-2.1

echo 步骤1：创建目录结构
echo.

echo 创建插件目录：
mkdir "%GRADLE_CACHE%\com.android.tools.build\gradle\8.1.0" 2>nul
echo ✓ %GRADLE_CACHE%\com.android.tools.build\gradle\8.1.0
echo.

echo ========================================
echo   步骤2：下载文件
echo ========================================
echo.
echo 请手动下载以下文件：
echo.
echo 文件1：gradle-8.1.0.pom
echo 文件2：gradle-8.1.0.jar
echo.
echo 下载地址（选择一个可用的）：
echo.
echo [推荐] 腾讯云Maven镜像：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/8.1.0/gradle-8.1.0.pom
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/8.1.0/gradle-8.1.0.jar
echo.
echo [备选] 阿里云Maven镜像：
echo https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/8.1.0/gradle-8.1.0.pom
echo https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/8.1.0/gradle-8.1.0.jar
echo.
echo ========================================
echo   步骤3：复制文件
echo ========================================
echo.
echo 下载完成后：
echo 1. 找到下载的两个文件（.pom 和 .jar）
echo 2. 复制到这个目录：
echo.
echo %GRADLE_CACHE%\com.android.tools.build\gradle\8.1.0\
echo.
echo ========================================
echo   检查安装
echo ========================================
echo.
echo 安装完成后，运行此脚本检查：
echo.
pause

echo.
echo 检查文件是否存在：
if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\8.1.0\gradle-8.1.0.pom" (
    echo ✓ gradle-8.1.0.pom 存在
) else (
    echo ✗ gradle-8.1.0.pom 不存在
)

if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\8.1.0\gradle-8.1.0.jar" (
    echo ✓ gradle-8.1.0.jar 存在
) else (
    echo ✗ gradle-8.1.0.jar 不存在
)

echo.
echo 如果两个文件都存在，请运行构建脚本：
echo build_apk_final.bat
echo.
pause
