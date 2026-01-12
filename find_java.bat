@echo off
chcp 65001 >nul
echo ========================================
echo   查找Java安装位置
echo ========================================
echo.

echo [方法1] 查找Android Studio自带的JDK...
echo.

set ANDROID_STUDIO_JDK="C:\Program Files\Android\Android Studio\jbr"
if exist %ANDROID_STUDIO_JDK% (
    echo ✓ 找到Android Studio JDK:
    echo %ANDROID_STUDIO_JDK%
    echo.
    echo 请将此路径设置为JAVA_HOME
    goto :found
)

echo [方法2] 搜索常见JDK安装位置...
echo.

dir "C:\Program Files\Java" /b 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✓ 找到Java安装:
    dir "C:\Program Files\Java" /b
    echo.
    echo 通常选择最新的版本
    goto :found
)

dir "C:\Program Files (x86)\Java" /b 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✓ 找到Java安装:
    dir "C:\Program Files (x86)\Java" /b
    echo.
    echo 通常选择最新的版本
    goto :found
)

echo ✗ 未找到Java安装
echo.
echo 请确认：
echo 1. Android Studio是否已安装
echo 2. 或是否单独安装了JDK
echo.
pause
exit

:found
echo.
echo ========================================
echo   设置环境变量方法
echo ========================================
echo.
echo 方式A（临时设置，仅当前窗口有效）：
echo set JAVA_HOME=找到的路径
echo set PATH=%JAVA_HOME%\bin;%PATH%
echo.
echo 方式B（永久设置，推荐）：
echo 1. 按 Win+R，输入：sysdm.cpl
echo 2. 点击"高级"标签
echo 3. 点击"环境变量"
echo 4. 在"系统变量"区域点击"新建"
echo 5. 变量名：JAVA_HOME
echo 6. 变量值：找到的路径（例如：C:\Program Files\Android\Android Studio\jbr）
echo 7. 点击"确定"保存
echo 8. 找到Path变量，点击"编辑"
echo 9. 添加：%JAVA_HOME%\bin
echo 10. 点击"确定"保存所有设置
echo.
pause
