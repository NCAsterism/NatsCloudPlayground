#!/usr/bin/env pwsh
# Script to commit and push GitHub Pages changes with automatic carriage returns

Write-Host "GitHub Pages Deployment Helper" -ForegroundColor Cyan
Write-Host "============================" -ForegroundColor Cyan

# Check that we have the workflow file
$workflowFile = ".\.github\workflows\pages.yml"
$workflowExists = Test-Path $workflowFile

if ($workflowExists) {
    Write-Host "✅ GitHub Pages workflow file exists" -ForegroundColor Green
} else {
    Write-Host "❌ GitHub Pages workflow file is missing. Please run this script from the repository root." -ForegroundColor Red
    exit 1
}

# Ensure .nojekyll files exist
Write-Host "`nEnsuring .nojekyll files exist..." -ForegroundColor Yellow
New-Item -Path '.nojekyll' -ItemType File -Force | Out-Null
New-Item -Path 'docs/.nojekyll' -ItemType File -Force | Out-Null
Write-Host "✅ .nojekyll files created or verified" -ForegroundColor Green

# Validate GitHub Pages configuration
Write-Host "`nValidating GitHub Pages configuration..." -ForegroundColor Yellow
if (Test-Path "./scripts/validate_github_pages.ps1") {
    & "./scripts/validate_github_pages.ps1"
} else {
    Write-Host "❌ Validation script not found." -ForegroundColor Red
}

# Add all the files to git
Write-Host "`nAdding files to git..." -ForegroundColor Yellow
git add .github/workflows/pages.yml docs/.nojekyll .nojekyll docs/_config.yml docs/Gemfile docs/index.html

# Commit the changes
Write-Host "`nCommitting changes..." -ForegroundColor Yellow
git commit -m "Update GitHub Pages with latest configuration and action versions"

# Push to main branch
Write-Host "`nPushing to main branch..." -ForegroundColor Yellow
git push origin main

Write-Host "`n✅ All done! Your GitHub Pages site should be building now." -ForegroundColor Green
Write-Host "Check your site in a few minutes at: https://ncasterism.github.io/NatsCloudPlayground/" -ForegroundColor Cyan
Write-Host "Check the Actions tab in your GitHub repository to monitor the build progress." -ForegroundColor Cyan
Write-Host "`nIf you encounter issues, try the following troubleshooting steps:" -ForegroundColor Yellow
Write-Host "1. Verify GitHub Pages is enabled in your repository settings (Settings > Pages)" -ForegroundColor Yellow
Write-Host "2. Make sure to select 'GitHub Actions' as the source" -ForegroundColor Yellow
Write-Host "3. Check Action logs for any specific error messages" -ForegroundColor Yellow
