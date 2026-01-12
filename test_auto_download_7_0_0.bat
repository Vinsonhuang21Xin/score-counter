@echo off
chcp 65001 >nul
echo ========================================
echo   测试Gradle自动下载AGP 7.0.0
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter\android"

echo 我已经配置：
echo - Android Gradle Plugin版本：7.0.0
echo - Kotlin插件版本：1.7.10
echo - 仓库：阿里云Maven镜像
echo.
echo 现在测试Gradle是否能自动下载...
echo.
echo 这可能需要几分钟，请耐心等待...
echo.

echo 清理并重新下载...
gradlew clean --refresh-dependencies

echo.
echo ========================================
echo   结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo ✓✓✓ 成功！插件已经下载！✓✓✓
    echo.
    echo 现在可以构建APK了：
    echo cd ..
    echo flutter build apk --release
    echo.
) else (
    echo ✗ 还是失败了
    echo.
    echo 如果失败，我们需要手动下载文件
    echo 请看下面的手动下载说明
)
echo.
pause
