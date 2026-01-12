@echo off
chcp 65001 >nul
echo ========================================
echo   GitHub连接诊断和推送工具
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 步骤1：检查Git代理配置
echo.
git config --global --get http.proxy
git config --global --get https.proxy

echo.
echo 步骤2：测试GitHub连接
echo.

curl -I https://github.com --connect-timeout 5

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ⚠ 无法直接连接GitHub
    echo.
    echo 请检查：
    echo 1. VPN是否已开启
    echo 2. VPN模式是否为系统代理或TUN模式
    echo 3. 尝试在浏览器访问 https://github.com
    echo.
    pause
    exit /b 1
)

echo.
echo ✓ 可以连接到GitHub！
echo.
echo 步骤3：配置Git使用系统代理
echo.

echo 正在检测系统代理...
for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable 2^>nul') do set ProxyEnable=%%b
for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer 2^>nul') do set ProxyServer=%%b

if "%ProxyEnable%"=="0x1" (
    echo 检测到系统代理：%ProxyServer%
    echo.
    set PROXY_HOST=%ProxyServer:~0,-5%
    set PROXY_PORT=%ProxyServer:~-4%
    echo 正在配置Git使用代理...
    git config --global http.proxy http://%PROXY_HOST%:%PROXY_PORT%
    git config --global https.proxy http://%PROXY_HOST%:%PROXY_PORT%
    echo ✓ Git代理已配置
) else (
    echo 未检测到系统代理
    echo.
    echo 如果您使用的是TUN模式的VPN，Git应该可以直连
    echo.
)

echo.
echo 步骤4：推送到GitHub
echo.

git remote remove github 2>nul
git remote add github https://github.com/Vinsonhuang21Xin/score-counter.git
git branch -M main

echo 正在推送...
echo.

git push github main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓✓✓ 推送成功！✓✓✓
    echo ========================================
    echo.
    echo 正在打开GitHub Actions页面...
    start https://github.com/Vinsonhuang21Xin/score-counter/actions
    echo.
    echo 请按照以下步骤构建APK：
    echo.
    echo 1. 等待页面加载
    echo.
    echo 2. 点击 "Build Android APK" 工作流
    echo.
    echo 3. 点击右侧的 "Run workflow" 按钮
    echo.
    echo 4. 选择 main 分支
    echo.
    echo 5. 点击绿色的 "Run workflow" 按钮
    echo.
    echo 6. 等待10-15分钟构建完成
    echo.
    echo 7. 构建完成后，下载APK文件
    echo.
    echo ========================================
    echo.
) else (
    echo.
    echo ✗ 推送失败
    echo.
    echo 可能的原因：
    echo 1. GitHub token未配置或已过期
    echo 2. VPN连接不稳定
    echo 3. 网络防火墙阻止
    echo.
    echo 建议：
    echo 使用GitHub Desktop或其他Git客户端工具
    echo.
)

pause
