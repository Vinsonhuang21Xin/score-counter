@echo off
chcp 65001 >nul
echo ========================================
echo   最终APK构建
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 当前配置：
echo - Gradle: 8.8 ✓ (已手动安装)
echo - Android Gradle Plugin: 8.2.0 ✓ (已手动安装)
echo - Kotlin: 1.9.0 ✓ (已手动安装)
echo - Gradle wrapper: 已配置.ok文件 ✓
echo.

echo ========================================
echo   开始构建APK
echo ========================================
echo.
echo 说明：
echo - 预计需要10-15分钟
echo - 请保持VPN开启
echo - 请保持网络连接
echo.

flutter build apk --release

echo.
echo ========================================
echo   构建结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓✓✓✓ APK构建成功！✓✓✓
    echo ========================================
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
    echo 1. 找到APK文件（上方路径）
    echo 2. 通过QQ/微信/数据线传到手机
    echo 3. 在手机上打开文件管理器
    echo 4. 找到app-release.apk文件
    echo 5. 点击安装
    echo 6. 如果提示"允许安装未知应用"，点击"允许"或"设置"
    echo 7. 返回重新安装
    echo 8. 安装完成后，在桌面找到"Score Counter"图标
    echo 9. 打开App，开始使用！
    echo.
    echo ========================================
    echo   恭喜！
    echo ========================================
    echo.
) else (
    echo.
    echo ========================================
    echo   ✗ 构建失败
    echo ========================================
    echo.
    echo 如果还是Connection refused：
    echo 1. 确认VPN正在运行
    echo 2. 检查VPN是否支持HTTP代理
    echo 3. 或者考虑其他方案：
    echo    - 编译成Web应用（推荐）
    echo    - 使用GitHub Codespaces
    echo.
)
echo.
pause
