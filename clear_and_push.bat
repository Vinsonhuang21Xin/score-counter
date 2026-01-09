@echo off
chcp 65001 >nul
echo ========================================
echo   清除旧凭据并重新推送
echo ========================================
echo.

echo [1/3] 清除旧的Git凭据...
cmdkey /delete:git:https://github.com
echo ✓ 旧凭据已清除

echo.
echo [2/3] 准备推送代码...
echo.
echo ========================================
echo   接下来需要输入Token
echo ========================================
echo.
echo 1. Username: Vinsonhuang21Xin
echo 2. Password: 粘贴您新创建的Token（带workflow权限）
echo.
echo ⚠️  注意：必须使用包含workflow权限的新Token！
echo.
pause

cd /d "D:\Claude Code\002_ScoreCounterApp\001_project_files\score_counter"
git push -u origin main --force

echo.
echo [3/3] 推送完成！
echo.
echo ========================================
echo   访问查看Actions：
echo   https://github.com/Vinsonhuang21Xin/score-counter/actions
echo ========================================
echo.
pause
