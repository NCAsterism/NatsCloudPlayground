#!/usr/bin/env pwsh
# Script to troubleshoot GitHub Pages issues with automatic carriage returns

Write-Host "GitHub Pages Troubleshooting Tool" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan
Write-Host "This script helps diagnose and fix common GitHub Pages deployment issues." -ForegroundColor Yellow

# Check for common GitHub Pages issues
$commonIssuesFound = $false

# 1. Check workflow file versions
$workflowFile = ".\.github\workflows\pages.yml"
if (Test-Path $workflowFile) {
    $workflowContent = Get-Content $workflowFile -Raw
    Write-Host "`nChecking workflow file action versions..." -ForegroundColor Green
    
    $versionIssues = @()
    
    if (-not ($workflowContent -match "actions/checkout@v4")) {
        $versionIssues += "actions/checkout not using v4"
    }
    
    if (-not ($workflowContent -match "actions/configure-pages@v4")) {
        $versionIssues += "actions/configure-pages not using v4"
    }
    
    if (-not ($workflowContent -match "actions/upload-pages-artifact@v3")) {
        $versionIssues += "actions/upload-pages-artifact not using v3"
    }
    
    if (-not ($workflowContent -match "actions/deploy-pages@v4")) {
        $versionIssues += "actions/deploy-pages not using v4"
    }
    
    if ($versionIssues.Count -gt 0) {
        Write-Host "❌ Found outdated GitHub Actions versions:" -ForegroundColor Red
        foreach ($issue in $versionIssues) {
            Write-Host "   - $issue" -ForegroundColor Red
        }
        $commonIssuesFound = $true
        
        Write-Host "`nWould you like to update the workflow file to use the latest versions? (y/n)" -ForegroundColor Yellow
        $updateWorkflow = Read-Host
        
        if ($updateWorkflow -eq "y") {
            $workflowContent = $workflowContent -replace "actions/checkout@v\d+", "actions/checkout@v4"
            $workflowContent = $workflowContent -replace "actions/configure-pages@v\d+", "actions/configure-pages@v4"
            $workflowContent = $workflowContent -replace "actions/upload-pages-artifact@v\d+", "actions/upload-pages-artifact@v3"
            $workflowContent = $workflowContent -replace "actions/deploy-pages@v\d+", "actions/deploy-pages@v4"
            
            Set-Content -Path $workflowFile -Value $workflowContent
            Write-Host "✅ Workflow file updated with latest versions" -ForegroundColor Green
        }
    } else {
        Write-Host "✅ All GitHub Actions are using the recommended versions" -ForegroundColor Green
    }
} else {
    Write-Host "❌ Workflow file not found at $workflowFile" -ForegroundColor Red
    $commonIssuesFound = $true
}

# 2. Check for .nojekyll files
Write-Host "`nChecking for .nojekyll files..." -ForegroundColor Green
$rootNojekyll = Test-Path ".nojekyll"
$docsNojekyll = Test-Path "docs/.nojekyll"

if (-not $rootNojekyll -or -not $docsNojekyll) {
    Write-Host "❌ Missing .nojekyll files:" -ForegroundColor Red
    if (-not $rootNojekyll) {
        Write-Host "   - Root .nojekyll file is missing" -ForegroundColor Red
    }
    if (-not $docsNojekyll) {
        Write-Host "   - docs/.nojekyll file is missing" -ForegroundColor Red
    }
    $commonIssuesFound = $true
    
    Write-Host "`nWould you like to create the missing .nojekyll files? (y/n)" -ForegroundColor Yellow
    $createNojekyll = Read-Host
    
    if ($createNojekyll -eq "y") {
        if (-not $rootNojekyll) {
            New-Item -Path ".nojekyll" -ItemType File -Force | Out-Null
            Write-Host "✅ Created root .nojekyll file" -ForegroundColor Green
        }
        if (-not $docsNojekyll) {
            New-Item -Path "docs/.nojekyll" -ItemType File -Force | Out-Null
            Write-Host "✅ Created docs/.nojekyll file" -ForegroundColor Green
        }
    }
} else {
    Write-Host "✅ Both .nojekyll files are present" -ForegroundColor Green
}

# 3. Check for index files
Write-Host "`nChecking for index files..." -ForegroundColor Green
$rootIndex = Test-Path "index.html"
$docsIndex = Test-Path "docs/index.html"

if (-not $rootIndex -or -not $docsIndex) {
    Write-Host "❌ Missing index files:" -ForegroundColor Red
    if (-not $rootIndex) {
        Write-Host "   - Root index.html file is missing" -ForegroundColor Red
    }
    if (-not $docsIndex) {
        Write-Host "   - docs/index.html file is missing" -ForegroundColor Red
    }
    $commonIssuesFound = $true
} else {
    Write-Host "✅ Both index.html files are present" -ForegroundColor Green
}

# 4. Check for config.yml
Write-Host "`nChecking for _config.yml..." -ForegroundColor Green
if (Test-Path "docs/_config.yml") {
    Write-Host "✅ _config.yml file is present" -ForegroundColor Green
    
    # Check content
    $configContent = Get-Content "docs/_config.yml" -Raw
    $configIssues = @()
    
    if (-not ($configContent -match "baseurl:")) {
        $configIssues += "baseurl setting is missing"
    }
    
    if (-not ($configContent -match "remote_theme:")) {
        $configIssues += "remote_theme setting is missing"
    }
    
    if ($configIssues.Count -gt 0) {
        Write-Host "❌ Issues found in _config.yml:" -ForegroundColor Red
        foreach ($issue in $configIssues) {
            Write-Host "   - $issue" -ForegroundColor Red
        }
        $commonIssuesFound = $true
    } else {
        Write-Host "✅ _config.yml contains required settings" -ForegroundColor Green
    }
} else {
    Write-Host "❌ _config.yml file is missing in docs folder" -ForegroundColor Red
    $commonIssuesFound = $true
}

# Summary
Write-Host "`n=== Troubleshooting Summary ===" -ForegroundColor Cyan
if ($commonIssuesFound) {
    Write-Host "❌ Issues were found that might affect your GitHub Pages deployment" -ForegroundColor Red
    Write-Host "`nRecommended actions:" -ForegroundColor Yellow
    Write-Host "1. Run ./scripts/deploy_github_pages.ps1 to apply the fixes and push changes" -ForegroundColor Yellow
    Write-Host "2. Check your GitHub repository settings to ensure GitHub Pages is enabled" -ForegroundColor Yellow
    Write-Host "3. Set the GitHub Pages source to GitHub Actions in repository settings" -ForegroundColor Yellow
} else {
    Write-Host "✅ No common issues found! Your GitHub Pages setup looks good." -ForegroundColor Green
    Write-Host "`nIf you're still experiencing problems, check:" -ForegroundColor Yellow
    Write-Host "1. GitHub repository settings (Settings > Pages)" -ForegroundColor Yellow
    Write-Host "2. GitHub Actions logs for specific error messages" -ForegroundColor Yellow
    Write-Host "3. GitHub's status page for any ongoing service issues: https://www.githubstatus.com/" -ForegroundColor Yellow
}

Write-Host "`nDon't forget that all commands in this script include carriage returns automatically." -ForegroundColor Yellow
