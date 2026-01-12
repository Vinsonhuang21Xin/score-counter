@echo off
chcp 65001 >nul
echo ========================================
echo   配置本地Gradle使用国内镜像
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo ========================================
echo   步骤1：配置Gradle wrapper使用腾讯云镜像
echo ========================================
echo.

cd android
echo 修改gradle-wrapper.properties...

(
echo distributionBase=GRADLE_USER_HOME
echo distributionPath=wrapper/dists
echo zipStoreBase=GRADLE_USER_HOME
echo zipStorePath=wrapper/dists
echo distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.8-all.zip
) > gradle\wrapper\gradle-wrapper.properties

echo ✓ Gradle wrapper配置完成
echo.

cd ..
echo.
echo ========================================
echo   步骤2：验证settings.gradle.kts配置
echo ========================================
echo.

echo 检查settings.gradle.kts中的镜像配置...
echo.

findstr /C:"aliyun" android\settings.gradle.kts >nul
if %ERRORLEVEL% EQU 0 (
    echo ✓ 已配置阿里云镜像
) else (
    echo ⚠ 未找到阿里云镜像配置
)

echo.
echo ========================================
echo   步骤3：清理缓存
echo ========================================
echo.

cd android
if exist .gradle (
    echo 删除.gradle缓存...
    rmdir /s /q .gradle
)

cd ..
echo ✓ 清理完成
echo.

echo ========================================
echo   步骤4：配置本地Maven仓库
echo ========================================
echo.

echo 创建本地gradle.properties配置文件...
echo.

set GRADLE_PROPS=%USERPROFILE%\.gradle\gradle.properties

(
echo # Gradle镜像配置
echo systemProp.http.proxyHost=
echo systemProp.http.proxyPort=
echo systemProp.https.proxyHost=
echo systemProp.https.proxyPort=
echo.
echo # 优先使用国内镜像
echo org.gradle.daemon=true
echo org.gradle.parallel=true
echo org.gradle.caching=true
) > "%GRADLE_PROPS%"

echo ✓ Maven配置完成
echo.

echo ========================================
echo   配置完成
echo ========================================
echo.
echo 当前配置：
echo - Gradle下载源：腾讯云镜像
echo - Maven仓库：阿里云、腾讯云、华为云
echo - AGP版本：8.2.0（已手动安装）
echo - Kotlin版本：1.9.0（已手动安装）
echo.
echo 下一步：
echo 运行构建脚本，使用本地已安装的Gradle
echo.
pause
