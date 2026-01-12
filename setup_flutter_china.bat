@echo off
chcp 65001 >nul
echo ========================================
echo   配置Flutter中国镜像
echo ========================================
echo.

echo 设置Flutter中国镜像环境变量...
echo.

setx PUB_HOSTED_URL "https://pub.flutter-io.cn" /M
setx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn" /M

echo.
echo ✓ Flutter中国镜像配置完成
echo.
echo PUB_HOSTED_URL = https://pub.flutter-io.cn
echo FLUTTER_STORAGE_BASE_URL = https://storage.flutter-io.cn
echo.
echo 注意：需要重新打开命令行窗口才能生效
echo.
pause
