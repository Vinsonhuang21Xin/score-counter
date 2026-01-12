@echo off
chcp 65001 >nul
echo ========================================
echo   Android Studio国内镜像配置
echo ========================================
echo.

echo 方法A：通过Android Studio设置代理
echo.
echo 1. 打开Android Studio
echo 2. File → Settings (或Ctrl+Alt+S)
echo 3. Appearance & Behavior → System Settings → HTTP Proxy
echo 4. 选择 "Auto-detect proxy settings"
echo 5. 点击 "Check connection" 测试
echo 6. 如果成功，点击 Apply
echo.
echo ========================================
echo.
echo 方法B：配置Gradle使用镜像（推荐）
echo.
echo 在Android Studio中：
echo 1. File → Settings → Build, Execution, Deployment → Gradle
echo 2. Gradle user home: 设置为：
echo    C:\Users\Vinson\.gradle
echo 3. 取消勾选 "Offline work"
echo 4. 点击 Apply
echo.
echo ========================================
echo.
echo 方法C：修改gradle.properties（最有效）
echo.
echo 找到或创建文件：
echo C:\Users\Vinson\.gradle\gradle.properties
echo.
echo 添加以下内容：
echo -----复制下面的内容-----
echo systemProp.http.proxyHost=127.0.0.1
echo systemProp.http.proxyPort=您的代理端口
echo systemProp.https.proxyHost=127.0.0.1
echo systemProp.https.proxyPort=您的代理端口
echo -----结束复制-----
echo.
echo 注意：需要您的VPN提供的代理端口
echo.
echo ========================================
echo.
echo 方法D：使用VPN的TUN模式（如果支持）
echo.
echo 某些VPN的TUN模式会自动代理所有流量
echo 确保VPN正在运行，然后重试
echo.
echo ========================================
echo.
pause
