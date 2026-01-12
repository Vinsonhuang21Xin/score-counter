@echo off
chcp 65001 >nul
echo ========================================
echo   手动下载并安装Gradle 7.0
echo ========================================
echo.

echo 问题：Android Studio无法从网络下载Gradle 7.0
echo 解决：手动下载并放到指定位置
echo.

echo ========================================
echo   步骤1：下载Gradle 7.0
echo ========================================
echo.
echo 请使用浏览器下载Gradle 7.0（约200MB）
echo.
echo 推荐下载地址（选择一个可用的）：
echo.
echo [腾讯云镜像]
echo https://mirrors.cloud.tencent.com/gradle/gradle-7.0-bin.zip
echo 或
echo https://mirrors.cloud.tencent.com/gradle/gradle-7.0-all.zip
echo.
echo [阿里云镜像]
echo https://mirrors.aliyun.com/dist/gradle/gradle-7.0-bin.zip
echo.
echo [华为云镜像]
echo https://mirrors.huaweicloud.com/gradle/gradle-7.0-bin.zip
echo.
echo [官方源（可能慢）]
echo https://services.gradle.org/distributions/gradle-7.0-bin.zip
echo.
echo 注意：选择 bin 或 all 都可以
echo       - bin: 约100MB（推荐）
echo       - all: 约200MB（包含源码和文档）
echo.
echo ========================================
echo   步骤2：解压到指定位置
echo ========================================
echo.
echo Gradle缓存位置：
echo %USERPROFILE%\.gradle\wrapper\dists\gradle-7.0-bin\
echo 或
echo %USERPROFILE%\.gradle\wrapper\dists\gradle-7.0-all\
echo.
echo 简化方法：
echo 1. 下载后解压到一个临时位置（如桌面）
echo 2. 运行此脚本，我会帮您复制
echo.
pause

echo.
echo ========================================
echo   自动安装
echo ========================================
echo.

echo 请告诉我您下载的文件解压到了哪个文件夹？
echo 例如：C:\Users\Vinson\Desktop\gradle-7.0
echo.
set /p GRADLE_SOURCE="请输入解压后的Gradle文件夹路径："

if not exist "%GRADLE_SOURCE%" (
    echo ✗ 路径不存在：%GRADLE_SOURCE%
    pause
    exit /b 1
)

echo.
echo 找到Gradle目录：%GRADLE_SOURCE%
echo.

set GRADLE_CACHE=%USERPROFILE%\.gradle\wrapper\dists\gradle-7.0-bin

echo 创建目标目录...
mkdir "%GRADLE_CACHE%" 2>nul

echo 复制文件...
xcopy /s /e /i /y "%GRADLE_SOURCE%" "%GRADLE_CACHE%\gradle-7.0-bin\"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓✓✓ Gradle 7.0安装成功！✓✓✓
    echo ========================================
    echo.
    echo 现在可以在Android Studio中构建APK了
    echo.
) else (
    echo.
    echo ✗ 复制失败，请手动复制
    echo.
    echo 从：%GRADLE_SOURCE%
    echo 到：%GRADLE_CACHE%\gradle-7.0-bin\
    echo.
)

pause
