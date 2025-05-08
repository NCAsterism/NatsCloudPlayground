#!/usr/bin/env pwsh
# Script to check if GitHub Pages site is live

Write-Host "GitHub Pages Status Check" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan

$username = "ncasterism"
$repo = "NatsCloudPlayground"
$siteUrls = @(
    "https://$username.github.io/$repo/",
    "https://$username.github.io/"
)

foreach ($url in $siteUrls) {
    Write-Host "`nChecking $url..." -ForegroundColor Yellow
    
    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing -ErrorAction Stop
        $statusCode = $response.StatusCode
        
        if ($statusCode -eq 200) {
            Write-Host "✅ Site is LIVE! (Status Code: $statusCode)" -ForegroundColor Green
            Write-Host "You can visit your site at: $url" -ForegroundColor Green
        } else {
            Write-Host "⚠️ Site returned status code: $statusCode" -ForegroundColor Yellow
        }
    } catch {
        $errorMsg = $_.Exception.Message
        Write-Host "❌ Site check failed: $errorMsg" -ForegroundColor Red
    }
}

Write-Host "`nGitHub Actions Workflow Status" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan
Write-Host "Check your GitHub Actions workflow status at:"
Write-Host "https://github.com/$username/$repo/actions" -ForegroundColor Blue

Write-Host "`nNext Steps:" -ForegroundColor Magenta
Write-Host "1. Verify your site is published at https://$username.github.io/$repo/"
Write-Host "2. Check your GitHub repository Settings > Pages to confirm deployment"
Write-Host "3. Review GitHub Actions logs if there are any issues"
Write-Host "4. If site is not live, you might need to wait a few minutes for deployment to complete"

Write-Host "`nIf the check fails, but you can access the site in a browser, this is normal." -ForegroundColor Yellow
Write-Host "Some network settings prevent the PowerShell web request from working properly." -ForegroundColor Yellow
