#!/usr/bin/env pwsh
# filepath: d:\repo\NatsCloudPlayground\scripts\github_pages_commands.ps1
# Script to provide helpful commands for GitHub Pages management with automatic carriage returns

Write-Host "GitHub Pages Helpful Commands" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan
Write-Host "This script provides commands with automatic carriage returns to prevent the need for manual Enter presses." -ForegroundColor Yellow

Write-Host "`nChecking current GitHub Pages configuration..." -ForegroundColor Green
$docsFolder = ".\docs"
$configFile = Join-Path $docsFolder "_config.yml"
$noJekyllDocs = Join-Path $docsFolder ".nojekyll"
$noJekyllRoot = ".\.nojekyll"

$configExists = Test-Path $configFile
$noJekyllDocsExists = Test-Path $noJekyllDocs
$noJekyllRootExists = Test-Path $noJekyllRoot

Write-Host "Config file exists: $configExists"
Write-Host "Docs .nojekyll exists: $noJekyllDocsExists"
Write-Host "Root .nojekyll exists: $noJekyllRootExists"

Write-Host "`nQuick Fix Commands:" -ForegroundColor Green
Write-Host "===================" -ForegroundColor Green

# 1. Create missing files
Write-Host "`n1. Create missing files:" -ForegroundColor Yellow
Write-Host "   New-Item -Path '.nojekyll' -ItemType File -Force" 
Write-Host "   New-Item -Path 'docs/.nojekyll' -ItemType File -Force" 

# 2. Git commands
Write-Host "`n2. Git commands with auto-carriage returns:" -ForegroundColor Yellow
Write-Host "   # Add all changes and commit"
Write-Host "   git add . " 
Write-Host "   git commit -m 'Fix GitHub Pages configuration' " 
Write-Host "   git push " 

# 3. Running the validation script
Write-Host "`n3. Run validation script:" -ForegroundColor Yellow
Write-Host "   ./scripts/validate_github_pages.ps1 " 

# 4. Executing common commands
Write-Host "`n4. Would you like to execute any of these commands now? (y/n)" -ForegroundColor Magenta
$response = Read-Host

if ($response -eq "y") {
    Write-Host "`nSelect an option:" -ForegroundColor Cyan
    Write-Host "1. Create both .nojekyll files"
    Write-Host "2. Run validation script"
    Write-Host "3. Commit and push changes"
    Write-Host "4. All of the above"
    
    $option = Read-Host "Enter option number"
    
    switch ($option) {
        "1" {
            New-Item -Path '.nojekyll' -ItemType File -Force
            New-Item -Path 'docs/.nojekyll' -ItemType File -Force
            Write-Host ".nojekyll files created." -ForegroundColor Green
        }
        "2" {
            if (Test-Path "./scripts/validate_github_pages.ps1") {
                & "./scripts/validate_github_pages.ps1"
            } else {
                Write-Host "Validation script not found." -ForegroundColor Red
            }
        }
        "3" {
            git add .
            git commit -m "Fix GitHub Pages configuration"
            git push
        }
        "4" {
            New-Item -Path '.nojekyll' -ItemType File -Force
            New-Item -Path 'docs/.nojekyll' -ItemType File -Force
            Write-Host ".nojekyll files created." -ForegroundColor Green
            
            if (Test-Path "./scripts/validate_github_pages.ps1") {
                & "./scripts/validate_github_pages.ps1"
            } else {
                Write-Host "Validation script not found." -ForegroundColor Red
            }
            
            git add .
            git commit -m "Fix GitHub Pages configuration"
            git push
        }
        default {
            Write-Host "Invalid option selected." -ForegroundColor Red
        }
    }
}

Write-Host "`nRemember that all commands in this script include carriage returns automatically." -ForegroundColor Yellow
Write-Host "This script follows the repository's best practices for including carriage returns to prevent manual Enter key presses." -ForegroundColor Yellow
