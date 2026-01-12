@echo off
chcp 65001 >nul
echo ========================================
echo   下载Android Gradle Plugin 8.11.1
echo ========================================
echo.

set GRADLE_CACHE=%USERPROFILE%\.gradle\caches\modules-2\files-2.1

echo 您需要下载的是Android Gradle Plugin（不是Gradle本身！）
echo.
echo 需要下载的文件：
echo 1. gradle-8.11.1.pom
echo 2. gradle-8.11.1.jar
echo.
echo ========================================
echo   下载地址（选择一个可用的）
echo ========================================
echo.
echo [推荐] 腾讯云Maven镜像：
echo https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/8.11.1/
echo.
echo 点击上面的链接，会看到文件列表
echo 逐个点击下载：
echo   - gradle-8.11.1.pom
echo   - gradle-8.11.1.jar
echo.
echo [备选] 阿里云Maven镜像：
echo https://maven.aliyun.com/repository/public/com/android/tools/build/gradle/8.11.1/
echo.
echo [备选] 华为云Maven镜像：
echo https://mirrors.huaweicloud.com/repository/maven/com/android/tools/build/gradle/8.11.1/
echo.
echo ========================================
echo   安装步骤
echo ========================================
echo.
echo 步骤1：创建目录
mkdir "%GRADLE_CACHE%\com.android.tools.build\gradle\8.11.1" 2>nul
echo ✓ 已创建：%GRADLE_CACHE%\com.android.tools.build\gradle\8.11.1\
echo.
echo 步骤2：访问上面的下载链接
echo 步骤3：下载 .pom 和 .jar 文件
echo 步骤4：把下载的2个文件复制到：
echo %GRADLE_CACHE%\com.android.tools.build\gradle\8.11.1\
echo.
echo ========================================
echo   完成后验证
echo ========================================
echo.
pause

echo.
echo 检查文件：
if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\8.11.1\gradle-8.11.1.pom" (
    echo ✓ gradle-8.11.1.pom 已安装
) else (
    echo ✗ gradle-8.11.1.pom 未找到
)

if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\8.11.1\gradle-8.11.1.jar" (
    echo ✓ gradle-8.11.1.jar 已安装
) else (
    echo ✗ gradle-8.11.1.jar 未找到
)
echo.

if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\8.11.1\gradle-8.11.1.pom" (
    if exist "%GRADLE_CACHE%\com.android.tools.build\gradle\8.11.1\gradle-8.11.1.jar" (
        echo ========================================
        echo   ✓✓✓ 安装成功！✓✓✓
        echo ========================================
        echo.
        echo 现在可以运行构建脚本了：
        echo build_apk_final.bat
        echo.
    )
)
pause
