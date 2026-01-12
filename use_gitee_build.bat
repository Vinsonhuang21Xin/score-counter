@echo off
chcp 65001 >nul
echo ========================================
echo   使用Gitee免费在线构建APK
echo ========================================
echo.

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"

echo 步骤1：初始化Git仓库
git init

echo.
echo 步骤2：添加所有文件到Git
git add .

echo.
echo 步骤3：提交代码
git commit -m "Flutter计分器App"

echo.
echo ========================================
echo   步骤4：推送到Gitee
echo ========================================
echo.

echo 请打开浏览器访问以下链接创建Gitee仓库：
echo.
echo https://gitee.com/projects/new
echo.
echo 仓库名称建议：score-counter
echo.
echo 创建完成后，请输入您的Gitee用户名：
set /p USERNAME=

echo.
echo 正在推送到Gitee...
git remote remove origin 2>nul
git branch -M main
git remote add origin https://gitee.com/%USERNAME%/score-counter.git
git push -u origin main

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo 推送失败！请检查：
    echo 1. Gitee仓库是否已创建
    echo 2. 用户名是否正确
    echo 3. 网络连接是否正常
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✓ 代码推送成功！
echo ========================================
echo.
echo 下一步操作：
echo.
echo 1. 访问您的Gitee仓库：
echo    https://gitee.com/%USERNAME%/score-counter
echo.
echo 2. 点击仓库页面顶部的 "下载 APK" 按钮
echo.
echo 3. 点击 "新建构建"
echo.
echo 4. 选择构建配置：
echo    - 构建版本：默认即可
echo    - Java版本：选择 JDK 17
echo    - 构建类型：Release
echo.
echo 5. 点击 "开始构建"，等待5-10分钟
echo.
echo 6. 构建完成后，下载生成的APK文件
echo.
echo ========================================
echo.
pause
