@echo off
chcp 65001 >nul
echo ========================================
echo   构建Flutter Web应用
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 说明：
echo - 不需要Gradle
echo - 不需要Android SDK
echo - 不需要网络下载任何插件
echo - 3-5分钟搞定
echo.

echo ========================================
echo   开始构建
echo ========================================
echo.

flutter build web

echo.
echo ========================================
echo   构建结果
echo ========================================
echo.

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✓✓✓ Web应用构建成功！✓✓✓
    echo ========================================
    echo.
    echo Web应用文件位置：
    echo build\web\
    echo.
    echo 完整路径：
    echo %CD%\build\web
    echo.
    echo ========================================
    echo   如何在手机上使用
    echo ========================================
    echo.
    echo 方法A：本地预览（推荐，快速）
    echo.
    echo 1. 运行以下命令启动本地服务器：
    echo    cd "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
    echo    flutter run -d chrome
    echo.
    echo 2. 浏览器会自动打开，显示应用
    echo.
    echo 3. 在同一局域网内的手机访问：
    echo    - 查看电脑的IP地址（运行 ipconfig）
    echo    - 手机浏览器访问：http://电脑IP:8080
    echo.
    echo ========================================
    echo.
    echo 方法B：部署到网上（推荐，随时随地访问）
    echo.
    echo 1. Vercel部署（推荐，国际访问快）
    echo    - 访问：https://vercel.com
    echo    - 用GitHub账号登录
    echo    - 点击 "New Project"
    echo    - 选择 "Import Git Repository"
    echo    - 导入项目文件夹
    echo    - 自动构建，获得网址如：https://your-app.vercel.app
    echo.
    echo 2. GitHub Pages（免费）
    echo    - 推送代码到GitHub
    echo    - 在仓库设置中开启GitHub Pages
    echo    - 访问：https://用户名.github.io/仓库名
    echo.
    echo 3. Netlify（免费）
    echo    - 访问：https://netlify.com
    echo    - 拖拽 build\web 文件夹到网站
    echo    - 自动部署
    echo.
    echo ========================================
    echo   后续步骤
    echo ========================================
    echo.
    echo 1. 部署到网上（推荐Vercel）
    echo 2. 手机浏览器访问网址
    echo 3. 在浏览器菜单中选择"添加到主屏幕"
    echo 4. 创建桌面快捷方式，像App一样使用
    echo.
    echo ========================================
    echo.
) else (
    echo.
    echo ✗ 构建失败
    echo.
    echo 请查看上方的错误信息
)
echo.
pause
