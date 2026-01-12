@echo off
chcp 65001 >nul
echo ========================================
echo   降级Flutter到3.13.x版本
echo ========================================
echo.

echo 说明：
echo Flutter 3.24需要的依赖太新，国内镜像无法支持。
echo 建议降级到3.13.x版本，这个版本更稳定。
echo.
echo 步骤：
echo 1. 下载Flutter 3.13.x
echo    https://docs.flutter.dev/development/tools/sdk/releases
echo    选择：flutter_windows_3.13.9-stable.zip
echo.
echo 2. 解压到新位置：D:\flutter-3.13
echo.
echo 3. 修改环境变量PATH，把D:\flutter改成D:\flutter-3.13
echo.
echo 4. 重启cmd，验证：flutter --version
echo.
echo ========================================
echo   或者继续使用当前版本尝试其他方案
echo ========================================
echo.
pause
