@echo off
chcp 65001 >nul
echo ========================================
echo   配置Java环境变量
echo ========================================
echo.

echo 正在搜索Java安装...
echo.

REM 搜索常见位置
set JAVA_PATH=

if exist "C:\Program Files\Eclipse Adoptium\jdk-17.*\bin\java.exe" (
    for /d %%i in ("C:\Program Files\Eclipse Adoptium\jdk-*") do set JAVA_PATH=%%i
    goto :found
)

if exist "C:\Program Files\Java\jdk-17.*\bin\java.exe" (
    for /d %%i in ("C:\Program Files\Java\jdk-*") do set JAVA_PATH=%%i
    goto :found
)

if exist "C:\Program Files\Adoptium\jdk-*\bin\java.exe" (
    for /d %%i in ("C:\Program Files\Adoptium\jdk-*") do set JAVA_PATH=%%i
    goto :found
)

if exist "C:\Program Files\Semeru\jdk-*\bin\java.exe" (
    for /d %%i in ("C:\Program Files\Semeru\jdk-*") do set JAVA_PATH=%%i
    goto :found
)

echo 未找到Java安装！
echo.
echo 请手动输入Java安装路径（例如：C:\Program Files\Eclipse Adoptium\jdk-17.0.12.7-hotspot）
echo.
set /p JAVA_PATH="请输入Java安装路径: "

if not exist "%JAVA_PATH%\bin\java.exe" (
    echo.
    echo 错误：在指定路径找不到java.exe
    echo 请检查路径是否正确
    pause
    exit /b 1
)

:found
echo.
echo 找到Java安装：%JAVA_PATH%
echo.

echo ========================================
echo   设置环境变量
echo ========================================
echo.

setx JAVA_HOME "%JAVA_PATH%" /M
setx PATH "%PATH%;%JAVA_PATH%\bin" /M

echo.
echo ========================================
echo   ✓ 环境变量设置完成
echo ========================================
echo.
echo JAVA_HOME = %JAVA_PATH%
echo.
echo 重要：需要重新打开命令行窗口才能生效
echo.

echo 测试Java安装...
"%JAVA_PATH%\bin\java.exe" -version

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓ Java配置成功！
    echo ========================================
    echo.
    echo 下一步：
    echo 1. 关闭当前命令行窗口
    echo 2. 重新打开新的命令行
    echo 3. 运行 build_apk_with_jdk.bat
    echo.
) else (
    echo.
    echo ⚠ Java测试失败
    echo.
)
pause
