@echo off
chcp 65001 >nul
echo 检查腾讯云镜像上的AGP版本...
echo.

set BASE_URL=https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/

echo 检查7.0.0...
curl -s -I "%BASE_URL%7.0.0/" | findstr "HTTP/1.1 200" >nul && echo   ✓ 7.0.0 存在 || echo   ✗ 7.0.0 不存在

echo 检查7.2.0...
curl -s -I "%BASE_URL%7.2.0/" | findstr "HTTP/1.1 200" >nul && echo   ✓ 7.2.0 存在 || echo   ✗ 7.2.0 不存在

echo 检查7.4.0...
curl -s -I "%BASE_URL%7.4.0/" | findstr "HTTP/1.1 200" >nul && echo   ✓ 7.4.0 存在 || echo   ✗ 7.4.0 不存在

echo 检查8.0.0...
curl -s -I "%BASE_URL%8.0.0/" | findstr "HTTP/1.1 200" >nul && echo   ✓ 8.0.0 存在 || echo   ✗ 8.0.0 不存在

echo 检查8.2.0...
curl -s -I "%BASE_URL%8.2.0/" | findstr "HTTP/1.1 200" >nul && echo   ✓ 8.2.0 存在 || echo   ✗ 8.2.0 不存在

echo.
pause
