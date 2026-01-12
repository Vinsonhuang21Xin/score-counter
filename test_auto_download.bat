@echo off
chcp 65001 >nul
echo ========================================
echo   测试自动下载Gradle插件
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter\android"

echo 我已经修改了settings.gradle.kts，添加了Google Maven作为后备源。
echo 现在测试Gradle是否能自动下载插件。
echo.
echo 这可能需要几分钟，请耐心等待...
echo.

echo 清理之前的尝试...
gradlew clean --no-daemon

echo.
echo ========================================
echo   测试结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo ✓✓✓ 成功！插件已经下载或找到了！✓✓✓
    echo.
    echo 现在可以构建APK了：
    echo cd ..
    echo flutter build apk --release
    echo.
) else (
    echo ✗ 还是失败了
    echo.
    echo 如果还是提示找不到插件，请尝试：
    echo 1. 手动从Google Maven下载
    echo 2. 或者使用其他镜像
)
echo.
pause
