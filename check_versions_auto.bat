@echo off
chcp 65001 >nul
echo ========================================
echo   自动检查AGP版本可用性
echo ========================================
echo.

echo 使用PowerShell检查腾讯云镜像上的AGP版本...
echo.

powershell -Command "$versions = @('7.0.0','7.2.0','7.4.0','8.0.0','8.2.0'); $baseUrl = 'https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/'; Write-Host '检查腾讯云镜像上的Android Gradle Plugin版本：' -ForegroundColor Yellow; foreach($v in $versions) { $url = $baseUrl + $v + '/gradle-' + $v + '.pom'; try { $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 5 -UseBasicParsing; if($response.StatusCode -eq 200) { Write-Host '  ✓ ' $v ' - 可用' -ForegroundColor Green } } catch { Write-Host '  ✗ ' $v ' - 不存在' -ForegroundColor Red } }"

echo.
echo ========================================
echo   检查Kotlin插件
echo ========================================
echo.

powershell -Command "$versions = @('1.7.10','1.8.22','1.9.0'); $baseUrl = 'https://mirrors.cloud.tencent.com/repository/maven/org/jetbrains/kotlin/kotlin-gradle-plugin/'; Write-Host '检查Kotlin Gradle插件版本：' -ForegroundColor Yellow; foreach($v in $versions) { $url = $baseUrl + $v + '/kotlin-gradle-plugin-' $v '.pom'; try { $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 5 -UseBasicParsing; if($response.StatusCode -eq 200) { Write-Host '  ✓ ' $v ' - 可用' -ForegroundColor Green } } catch { Write-Host '  ✗ ' $v ' - 不存在' -ForegroundColor Red } }"

echo.
echo ========================================
echo   总结
echo ========================================
echo.
echo 请记录上面显示为 ✓（绿色）的版本
echo 然后告诉我，我会帮您修改配置
echo.
pause
