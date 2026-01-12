@echo off
chcp 65001 >nul
echo ========================================
echo   修复Gradle目录结构
echo ========================================
echo.

set GRADLE_DIST=C:\Users\Vinson\.gradle\wrapper\dists\gradle-8.8-bin
set GRADLE_TEMP=%TEMP%\gradle-8.8-temp

echo 当前Gradle文件位置：
echo %GRADLE_DIST%
echo.

echo 步骤1：移动文件到临时位置...
move "%GRADLE_DIST%\bin" "%GRADLE_TEMP%\"
move "%GRADLE_DIST%\lib" "%GRADLE_TEMP%\"
move "%GRADLE_DIST%\init.d" "%GRADLE_TEMP%\"
move "%GRADLE_DIST%\LICENSE" "%GRADLE_TEMP%\"
move "%GRADLE_DIST%\NOTICE" "%GRADLE_TEMP%\"
move "%GRADLE_DIST%\README" "%GRADLE_TEMP%\"
echo ✓ 移动完成
echo.

echo 步骤2：创建正确的目录结构...
mkdir "%GRADLE_DIST%\gradle-8.8"
echo ✓ 创建完成
echo.

echo 步骤3：移动文件到正确位置...
move "%GRADLE_TEMP%\*" "%GRADLE_DIST%\gradle-8.8\"
echo ✓ 移动完成
echo.

echo 验证修复...
dir "%GRADLE_DIST%\gradle-8.8\bin\gradle.bat" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ========================================
    echo   ✓✓✓ 修复成功！✓✓✓
    echo ========================================
    echo.
    echo 现在可以构建APK了：
    echo cd "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
    echo flutter build apk --release
    echo.
) else (
    echo ✗ 修复失败
    echo.
    echo 请手动操作：
    echo 1. 删除这个目录：C:\Users\Vinson\.gradle\wrapper\dists\gradle-8.8-bin
    echo 2. 重新解压gradle-8.8-bin.zip
    echo 3. 确保解压后的文件夹是：
    echo    gradle-8.8-bin\gradle-8.8\bin\
    echo.
)
pause
