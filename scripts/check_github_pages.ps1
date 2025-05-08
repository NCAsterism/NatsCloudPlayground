#!/usr/bin/env pwsh
# Script to check if the GitHub Pages site is accessible

Write-Host "GitHub Pages Site Checker" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan
Write-Host "This script checks if your GitHub Pages site is accessible." -ForegroundColor Yellow

# Site URLs to check
$rootUrl = "https://ncasterism.github.io/"
$projectUrl = "https://ncasterism.github.io/NatsCloudPlayground/"

# Function to check URL
function Test-Website {
    param (
        [string]$Url,
        [string]$Description
    )
    
    Write-Host "`nChecking $Description ($Url)..." -ForegroundColor Yellow
    
    try {
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -ErrorAction Stop
        $statusCode = $response.StatusCode
        
        if ($statusCode -eq 200) {
            Write-Host "✅ Site is accessible! (Status code: $statusCode)" -ForegroundColor Green
            Write-Host "Content length: $($response.Content.Length) bytes" -ForegroundColor Green
            
            # Extract title if HTML
            if ($response.Content -match "<title>(.*?)</title>") {
                $title = $matches[1]
                Write-Host "Page title: $title" -ForegroundColor Green
            }
            
            return $true
        } else {
            Write-Host "❌ Site returned status code: $statusCode" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "❌ Error accessing site: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Check both URLs
$rootSuccess = Test-Website -Url $rootUrl -Description "Root GitHub Pages site"
$projectSuccess = Test-Website -Url $projectUrl -Description "Project GitHub Pages site"

# Overall status
Write-Host "`n----- Overall Status -----" -ForegroundColor Cyan
if ($rootSuccess -and $projectSuccess) {
    Write-Host "✅ Both sites are accessible!" -ForegroundColor Green
    Write-Host "Your GitHub Pages configuration is working correctly." -ForegroundColor Green
} elseif ($rootSuccess) {
    Write-Host "⚠️ Only the root site is accessible." -ForegroundColor Yellow
    Write-Host "Please check your baseurl configuration in _config.yml" -ForegroundColor Yellow
    Write-Host "Make sure it's set to: baseurl: /NatsCloudPlayground" -ForegroundColor Yellow
} elseif ($projectSuccess) {
    Write-Host "⚠️ Only the project site is accessible." -ForegroundColor Yellow
    Write-Host "This is unusual but still functional for your project site." -ForegroundColor Yellow
} else {
    Write-Host "❌ Neither site is accessible." -ForegroundColor Red
    Write-Host "Please check your GitHub Pages configuration and workflow status." -ForegroundColor Red
    Write-Host "See docs/troubleshooting_github_pages.md for help." -ForegroundColor Red
}

# Reminder about cache and deployment time
Write-Host "`nReminder:" -ForegroundColor Yellow
Write-Host "1. GitHub Pages deployments can take a few minutes to propagate." -ForegroundColor Yellow
Write-Host "2. Try clearing your browser cache if you still see old content." -ForegroundColor Yellow
Write-Host "3. Check the Actions tab in your GitHub repository for workflow status." -ForegroundColor Yellow
