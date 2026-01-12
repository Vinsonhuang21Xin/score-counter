@echo off
chcp 65001 >nul
echo ========================================
echo   构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 开始构建APK...
echo 预计需要10-15分钟，请耐心等待...
echo.

flutter build apk --release

echo.
echo ========================================
echo   结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo ✓✓✓ APK构建成功！✓✓✓
    echo.
    echo APK文件位置：
    echo build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo 完整路径：
    echo %CD%\build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo ========================================
    echo   后续步骤
    echo ========================================
    echo.
    echo 1. 将APK文件传到您的手机
    echo 2. 在手机上打开文件管理器
    echo 3. 找到app-release.apk文件
    echo 4. 点击安装（如果提示"允许安装未知应用"，请同意）
    echo 5. 安装完成后即可使用计分器App
    echo.
) else (
    echo ✗ 构建失败
    echo.
    echo 请查看上方的错误信息
)
echo.
pause
