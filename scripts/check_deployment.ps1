#!/usr/bin/env pwsh
# Script to check if the GitHub Pages site has been successfully deployed

Write-Host "Checking GitHub Pages deployment status..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

$siteUrl = "https://ncasterism.github.io/NatsCloudPlayground/"
Write-Host "Checking URL: $siteUrl" -ForegroundColor Yellow

try {
    $response = Invoke-WebRequest -Uri $siteUrl -UseBasicParsing -ErrorAction Stop
    $statusCode = $response.StatusCode
    
    if ($statusCode -eq 200) {
        Write-Host "`n✅ SUCCESS! Site is now accessible (Status code: $statusCode)" -ForegroundColor Green
        Write-Host "Content length: $($response.Content.Length) bytes" -ForegroundColor Green
        
        # Try to extract the page title
        if ($response.Content -match "<title>(.*?)</title>") {
            $title = $matches[1]
            Write-Host "Page title: $title" -ForegroundColor Green
        }
        
        Write-Host "`nYour GitHub Pages site is now successfully deployed and accessible." -ForegroundColor Green
    } else {
        Write-Host "`n⚠️ Site returned status code: $statusCode" -ForegroundColor Yellow
        Write-Host "This is unusual. The site may still be in the process of deploying." -ForegroundColor Yellow
    }
} catch {
    Write-Host "`n❌ Error accessing site: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Status code: $($_.Exception.Response.StatusCode.Value__)" -ForegroundColor Red
    
    Write-Host "`nThe site might still be deploying. GitHub Pages deployments can take a few minutes." -ForegroundColor Yellow
    Write-Host "Check the Actions tab in your GitHub repository to see if the workflow is still running." -ForegroundColor Yellow
}

Write-Host "`nIf the site is still not accessible, try these steps:" -ForegroundColor Yellow
Write-Host "1. Wait a few more minutes - GitHub Pages deployments can sometimes take up to 10 minutes" -ForegroundColor Yellow
Write-Host "2. Check your GitHub Actions workflows for any errors" -ForegroundColor Yellow
Write-Host "3. Verify your repository settings at Settings > Pages" -ForegroundColor Yellow
Write-Host "4. Clear your browser cache and try again" -ForegroundColor Yellow
