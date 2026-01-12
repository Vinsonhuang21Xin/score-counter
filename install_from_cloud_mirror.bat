@echo off
chcp 65001 >nul
echo ========================================
echo   从腾讯云镜像下载并安装AGP 7.0.0
echo ========================================
echo.

set GRADLE_CACHE=%USERPROFILE%\.gradle\caches\modules-2\files-2.1

echo 步骤1：创建目录
mkdir "%GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0" 2>nul
echo ✓ 已创建目录
echo.

echo ========================================
echo   步骤2：下载文件
echo ========================================
echo.
echo 请在浏览器中打开以下链接下载文件：
echo.
echo [腾讯云镜像] 推荐使用
echo.
echo POM文件：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/7.0.0/gradle-7.0.0.pom
echo.
echo JAR文件：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/7.0.0/gradle-7.0.0.jar
echo.
echo ========================================
echo   [华为云镜像] 备选
echo ========================================
echo.
echo POM文件：
echo https://mirrors.huaweicloud.com/repository/maven/com/android/tools/build/gradle/7.0.0/gradle-7.0.0.pom
echo.
echo JAR文件：
echo https://mirrors.huaweicloud.com/repository/maven/com/android/tools/build/gradle/7.0.0/gradle-7.0.0.jar
echo.
echo ========================================
echo   步骤3：安装文件
echo ========================================
echo.
echo 下载完成后，将2个文件复制到：
echo.
echo %GRADLE_CACHE%\com.android.tools.build\gradle\7.0.0\
echo.
echo ========================================
echo   步骤4：验证并构建
echo ========================================
echo.
pause

echo.
echo 检查文件...
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
        echo   ✓✓✓ 安装成功！准备构建APK ✓✓✓
        echo ========================================
        echo.
        echo 正在构建APK，请耐心等待...
        echo.
        cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
        flutter build apk --release
        echo.
        if %ERRORLEVEL% EQU 0 (
            echo ========================================
            echo   ✓✓✓ APK构建成功！✓✓✓
            echo ========================================
            echo.
            echo APK文件位置：
            echo build\app\outputs\flutter-apk\app-release.apk
            echo.
        )
    ) else (
        echo 文件不完整，请检查下载
    )
) else (
    echo 文件不存在，请先下载
)
echo.
pause
