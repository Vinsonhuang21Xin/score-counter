@echo off
chcp 65001 >nul
echo ========================================
echo   安装Android Gradle Plugin 7.0.0
echo ========================================
echo.

set GRADLE_CACHE=%USERPROFILE%\.gradle\caches\modules-2\files-2.1

echo 步骤1：创建目录
mkdir "%GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0" 2>nul
echo ✓ 已创建目录：%GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0\
echo.

echo ========================================
echo   步骤2：下载文件
echo ========================================
echo.
echo 请访问阿里云Maven下载：
echo.
echo https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/7.0.0/
echo.
echo 需要下载的文件：
echo 1. gradle-7.0.0.pom
echo 2. gradle-7.0.0.jar
echo.
echo ========================================
echo   步骤3：复制文件
echo ========================================
echo.
echo 下载完成后，将2个文件复制到：
echo.
echo %GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0\
echo.
echo ========================================
echo   步骤4：验证安装
echo ========================================
echo.
pause

echo.
echo 检查文件：
if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0\gradle-7.0.0.pom" (
    echo ✓ gradle-7.0.0.pom 已安装
) else (
    echo ✗ gradle-7.0.0.pom 未找到
)

if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0\gradle-7.0.0.jar" (
    echo ✓ gradle-7.0.0.jar 已安装
) else (
    echo ✗ gradle-7.0.0.jar 未找到
)
echo.

if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0\gradle-7.0.0.pom" (
    if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0\gradle-7.0.0.jar" (
        echo ========================================
        echo   ✓✓✓ 安装成功！✓✓✓
        echo ========================================
        echo.
        echo 现在可以构建APK了：
        echo cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
        echo flutter build apk --release
        echo.
    )
)
pause
