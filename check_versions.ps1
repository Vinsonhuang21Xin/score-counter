# 检查腾讯云镜像上的AGP版本
$versions = @('7.0.0','7.2.0','7.4.0','8.0.0','8.2.0')
$baseUrl = 'https://mirrors.cloud.tencent.com/repository/maven/com/android/tools/build/gradle/'

Write-Host '检查腾讯云镜像上的Android Gradle Plugin版本：'
Write-Host ''

foreach($v in $versions) {
    $url = $baseUrl + $v + '/'
    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 10 -UseBasicParsing
        if($response.StatusCode -eq 200) {
            Write-Host "  ✓ $v - 文件夹存在" -ForegroundColor Green
        }
    } catch {
        Write-Host "  ✗ $v - 不存在或无法访问" -ForegroundColor Red
    }
}

Write-Host ''
Write-Host '检查Kotlin插件版本：'
Write-Host ''

$kotlinVersions = @('1.7.10','1.8.22','1.9.0')
$kotlinBaseUrl = 'https://mirrors.cloud.tencent.com/repository/maven/org/jetbrains/kotlin/kotlin-gradle-plugin/'

foreach($v in $kotlinVersions) {
    $url = $kotlinBaseUrl + $v + '/'
    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 10 -UseBasicParsing
        if($response.StatusCode -eq 200) {
            Write-Host "  ✓ $v - 文件夹存在" -ForegroundColor Green
        }
    } catch {
        Write-Host "  ✗ $v - 不存在或无法访问" -ForegroundColor Red
    }
}
