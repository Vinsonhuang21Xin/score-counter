@echo off
chcp 65001 >nul
echo ========================================
echo   Android Studio构建APK完整指南
echo ========================================
echo.

echo 步骤1：打开Android Studio
echo.
echo 1. 启动Android Studio
echo 2. 点击 "Open" 或 "File" → "Open"
echo 3. 选择这个文件夹：
echo    D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter
echo 4. 点击 "OK"
echo.
echo ========================================
echo   等待项目加载
echo ========================================
echo.
echo Android Studio会：
echo - 识别这是一个Flutter项目
echo - 索引代码（底部显示"Indexing..."）
echo - 下载Gradle（如果需要）
echo.
echo 这可能需要5-10分钟，请耐心等待。
echo.
echo ========================================
echo   步骤2：配置Gradle
echo ========================================
echo.
echo 项目加载完成后：
echo.
echo 1. 点击左侧 "Gradle" 标签（右侧工具栏）
echo    如果看不到，点击 View → Tool Windows → Gradle
echo.
echo 2. 展开 project → score_counter → Tasks → android
echo.
echo 3. 找到 "assembleRelease" 任务
echo.
echo ========================================
echo   步骤3：构建APK
echo ========================================
echo.
echo 方法A：双击 assembleRelease
echo - Android Studio会开始构建
echo - 底部"Build"面板显示进度
echo.
echo 方法B：使用菜单
echo - 菜单：Build → Build Bundle(s) / APK(s) → Build APK(s)
echo.
echo ========================================
echo   可能遇到的问题
echo ========================================
echo.
echo 如果提示下载Gradle：
echo - 点击自动下载
echo - 或查看提示的下载链接
echo - 使用浏览器下载后放到指定位置
echo.
echo 如果提示缺少SDK组件：
echo - 打开SDK Manager（Tools → SDK Manager）
echo - 勾选缺失的组件
echo - 点击"Apply"下载安装
echo.
echo 如果提示缺少插件：
echo - 截图错误信息保存到：
echo   D:\Claude Code\IMGcut\as_error.png
echo - 我会提供下载链接
echo.
echo ========================================
echo   步骤4：找到APK
echo ========================================
echo.
echo 构建成功后：
echo 1. 点击顶部菜单：Build → Analyze APK
echo 2. 选择文件：
echo    android\app\build\outputs\apk\release\app-release.apk
echo 3. 或直接在文件管理器中找到这个文件
echo.
echo ========================================
echo.
pause
