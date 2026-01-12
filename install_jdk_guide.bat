@echo off
chcp 65001 >nul
echo ========================================
echo   JDK 17 安装和配置指南
echo ========================================
echo.

echo 步骤1：下载JDK 17
echo.
echo 正在打开清华镜像下载页面...
echo.
echo 请下载：Windows x64 JDK 17
echo 文件名类似：OpenJDK17U-jdk_x64_windows_hotspot_17.0.x_xxx.msi
echo.
pause

start https://mirrors.tuna.tsinghua.edu.cn/Adoptium/17/jdk/x64/windows/

echo.
echo ========================================
echo   安装说明
echo ========================================
echo.
echo 1. 运行下载的MSI安装程序
echo 2. 默认安装路径：C:\Program Files\Eclipse Adoptium\JDK-17
echo 3. 安装完成后，按任意键继续配置环境变量...
echo.
pause

echo.
echo ========================================
echo   步骤2：配置环境变量
echo ========================================
echo.

REM 设置JAVA_HOME
setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\JDK-17" /M

REM 添加到PATH
setx PATH "%PATH%;C:\Program Files\Eclipse Adoptium\JDK-17\bin" /M

echo.
echo ✓ 环境变量已设置
echo.
echo JAVA_HOME = C:\Program Files\Eclipse Adoptium\JDK-17
echo.
echo 注意：需要重新打开命令行窗口才能生效
echo.
pause

echo.
echo ========================================
echo   步骤3：验证安装
echo ========================================
echo.

"C:\Program Files\Eclipse Adoptium\JDK-17\bin\java.exe" -version

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓ JDK安装成功！
    echo ========================================
    echo.
    echo 下一步：
    echo 1. 关闭当前命令行窗口
    echo 2. 重新打开新的命令行窗口
    echo 3. 运行 build_apk_with_jdk.bat 开始构建APK
    echo.
) else (
    echo.
    echo ⚠ JDK可能未正确安装，请检查安装路径
    echo.
)
pause
