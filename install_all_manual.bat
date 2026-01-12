@echo off
chcp 65001 >nul
echo ========================================
echo   手动下载文件安装指南
echo ========================================
echo.

echo 需要下载的文件（共5个）：
echo.
echo [1/5] Gradle 8.8
echo   文件名：gradle-8.8-bin.zip
echo   大小：约120MB
echo   推荐下载地址：
echo   https://services.gradle.org/distributions/gradle-8.8-bin.zip
echo.
echo [2/5] AGP 8.2.0 POM
echo   https://dl.google.com/dl/android/maven2/com/android/tools/build/gradle/8.2.0/gradle-8.2.0.pom
echo.
echo [3/5] AGP 8.2.0 JAR
echo   https://dl.google.com/dl/android/maven2/com/android/tools/build/gradle/8.2.0/gradle-8.2.0.jar
echo.
echo [4/5] Kotlin 1.9.0 POM
echo   https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-gradle-plugin/1.9.0/kotlin-gradle-plugin-1.9.0.pom
echo.
echo [5/5] Kotlin 1.9.0 JAR
echo   https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-gradle-plugin/1.9.0/kotlin-gradle-plugin-1.9.0.jar
echo.
echo ========================================
echo   下载后的安装步骤
echo ========================================
echo.
echo 1. 下载gradle-8.8-bin.zip后，解压到临时位置（如桌面）
echo 2. 其他4个文件直接保存（不需要解压）
echo.
echo 下载完成后，运行安装脚本...
echo.
pause

echo.
echo ========================================
echo   安装Gradle 8.8
echo ========================================
echo.
set /p GRADLE_SOURCE="请输入gradle-8.8解压后的文件夹路径："

if not exist "%GRADLE_SOURCE%" (
    echo 路径不存在，请检查
    pause
    exit /b 1
)

set GRADLE_CACHE=%USERPROFILE%\.gradle\wrapper\dists\gradle-8.8-bin
mkdir "%GRADLE_CACHE%" 2>nul
xcopy /s /e /i /y "%GRADLE_SOURCE%" "%GRADLE_CACHE%\gradle-8.8-bin\"

echo ✓ Gradle 8.8 安装完成
echo.
echo ========================================
echo   安装AGP和Kotlin插件
echo ========================================
echo.
echo 请将下载的4个文件复制到以下目录：
echo.
echo AGP POM → %USERPROFILE%\.gradle\caches\modules-2\files-2.1\com.android.tools.build\gradle\8.2.0\
echo AGP JAR → 同上
echo Kotlin POM → %USERPROFILE%\.gradle\caches\modules-2\files-2.1\org.jetbrains.kotlin.kotlin-gradle-plugin\1.9.0\
echo Kotlin JAR → 同上
echo.
pause
