@echo off
chcp 65001 >nul
echo ========================================
echo   手动下载Gradle插件
echo ========================================
echo.

echo 需要下载的文件：
echo 1. kotlin-dsl插件 JAR文件
echo.

set GRADLE_CACHE=%USERPROFILE%\.gradle\caches\modules-2\files-2.1\org.gradle.kotlin\kotlin-dsl

echo 目标位置：
echo %GRADLE_CACHE%
echo.

echo ========================================
echo   下载说明
echo ========================================
echo.
echo 方案A：使用国内镜像下载（推荐）
echo.
echo 1. 访问腾讯云Gradle镜像：
echo    https://mirrors.cloud.tencent.com/gradle/
echo.
echo 2. 或者直接下载插件JAR：
echo    需要的文件：
echo    org.gradle.kotlin.kotlin-dsl.gradle.plugin-4.1.0.pom
echo    kotlin-dsl-4.1.0.jar
echo.
echo ========================================
echo   方案B：我已经为您生成下载链接
echo ========================================
echo.
echo 请告诉我：
echo 1. 您能否访问这些链接？
echo 2. 如果不能，我可以尝试其他方法
echo.
pause
