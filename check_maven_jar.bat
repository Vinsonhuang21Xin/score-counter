@echo off
chcp 65001 >nul
echo ========================================
echo   查找完整的Android Gradle Plugin
echo ========================================
echo.

echo 由于某些镜像没有jar文件，我们需要：
echo 1. 从多个镜像尝试下载
echo 2. 或者使用Gradle让系统自动下载
echo.

echo ========================================
echo   尝试方案A：配置从官方源自动下载
echo ========================================
echo.

echo 修改Gradle配置，让它能从官方源下载插件。
echo 即使官方源慢，只要能下载就行。
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter\android"

echo 检查当前settings.gradle.kts配置...
type settings.gradle.kts | findstr "repositories"
echo.

echo ========================================
echo   尝试方案B：手动从多个源下载
echo ========================================
echo.

echo 8.11.1版本的下载地址（按优先级）：
echo.
echo [1] Google官方Maven（最可靠）：
echo    https://dl.google.com/dl/android/maven2/com/android/tools/build/gradle/8.11.1/
echo.
echo [2] Maven Central：
echo    https://repo1.maven.org/maven2/com/android/tools/build/gradle/8.11.1/
echo.
echo [3] 腾讯云（检查是否有jar）：
echo    https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/8.11.1/
echo.

echo ========================================
echo   推荐步骤
echo ========================================
echo.
echo 1. 先访问Google官方链接，确认有jar文件
echo 2. 如果打不开，访问Maven Central
echo 3. 下载 gradle-8.11.1.pom 和 gradle-8.11.1.jar
echo 4. 复制到：
echo    C:\Users\Vinson\.gradle\caches\modules-2\files-2.1\com.android.tools.build\gradle\8.11.1\
echo.
echo ========================================
echo   或者让我帮您修改Gradle配置
echo ========================================
echo.
echo 如果上面的链接都打不开，我可以：
echo 1. 修改Gradle配置，添加更多仓库
echo 2. 让Gradle自动尝试从所有仓库下载
echo.
echo 您想让我修改配置吗？（Y/N）
pause
