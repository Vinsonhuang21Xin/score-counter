@echo off
chcp 65001 >nul
echo ========================================
echo   测试构建APK（移除kotlin-dsl后）
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo [1/3] 清理缓存...
flutter clean
echo.

echo [2/3] 获取依赖...
flutter pub get
echo.

echo [3/3] 构建APK...
echo.
echo ========================================
echo   开始构建，请耐心等待...
echo ========================================
echo.

flutter build apk --release

echo.
echo ========================================
echo   构建结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo ✓ 构建成功！
    echo.
    echo APK文件位置：
    echo build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo 完整路径：
    cd
    echo build\app\outputs\flutter-apk\app-release.apk
) else (
    echo ✗ 构建失败
    echo.
    echo 请把完整错误信息发给我！
)
echo.
pause
