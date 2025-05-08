#!/usr/bin/env pwsh

# Script to validate GitHub Pages Jekyll configuration
Write-Host "Validating GitHub Pages configuration..." -ForegroundColor Green
Write-Host "Note: This script includes proper line endings (carriage returns) to prevent the need to press Enter manually." -ForegroundColor Cyan

# Check key files
$docsFolder = ".\docs"
$configFile = Join-Path $docsFolder "_config.yml"
$noJekyllDocs = Join-Path $docsFolder ".nojekyll"
$noJekyllRoot = ".\.nojekyll"
$indexHtmlRoot = ".\index.html"
$indexHtmlDocs = Join-Path $docsFolder "index.html"
$indexMdDocs = Join-Path $docsFolder "index.md"

$validationPassed = $true

# Check if files exist
if (Test-Path $configFile) {
    Write-Host "✅ _config.yml exists in docs folder" -ForegroundColor Green
    # Check content of _config.yml
    $configContent = Get-Content $configFile -Raw
    if ($configContent -match "baseurl:") {
        Write-Host "  ✅ baseurl is configured in _config.yml" -ForegroundColor Green
    } else {
        Write-Host "  ❌ baseurl is missing in _config.yml" -ForegroundColor Red
        $validationPassed = $false
    }
    
    if ($configContent -match "remote_theme:") {
        Write-Host "  ✅ remote_theme is configured in _config.yml" -ForegroundColor Green
    } else {
        Write-Host "  ❌ remote_theme is missing in _config.yml" -ForegroundColor Red
        $validationPassed = $false
    }

    if ($configContent -match "plugins:") {
        Write-Host "  ✅ plugins section exists in _config.yml" -ForegroundColor Green
        if ($configContent -match "jekyll-remote-theme") {
            Write-Host "    ✅ jekyll-remote-theme plugin is configured" -ForegroundColor Green
        } else {
            Write-Host "    ❌ jekyll-remote-theme plugin is missing" -ForegroundColor Red
            $validationPassed = $false
        }
    } else {
        Write-Host "  ❌ plugins section is missing in _config.yml" -ForegroundColor Red
        $validationPassed = $false
    }
} else {
    Write-Host "❌ _config.yml is missing in docs folder" -ForegroundColor Red
    $validationPassed = $false
}

# Check .nojekyll files
if (Test-Path $noJekyllDocs) {
    Write-Host "✅ .nojekyll exists in docs folder" -ForegroundColor Green
} else {
    Write-Host "❌ .nojekyll is missing in docs folder" -ForegroundColor Red
    $validationPassed = $false
}

if (Test-Path $noJekyllRoot) {
    Write-Host "✅ .nojekyll exists in root folder" -ForegroundColor Green
} else {
    Write-Host "❌ .nojekyll is missing in root folder" -ForegroundColor Red
    $validationPassed = $false
}

# Check index files
if (Test-Path $indexHtmlRoot) {
    Write-Host "✅ index.html exists in root folder" -ForegroundColor Green
} else {
    Write-Host "❌ index.html is missing in root folder" -ForegroundColor Red
    $validationPassed = $false
}

if (Test-Path $indexHtmlDocs) {
    Write-Host "✅ index.html exists in docs folder" -ForegroundColor Green
} else {
    Write-Host "❌ index.html is missing in docs folder" -ForegroundColor Red
    $validationPassed = $false
}

if (Test-Path $indexMdDocs) {
    Write-Host "✅ index.md exists in docs folder" -ForegroundColor Green
} else {
    Write-Host "❌ index.md is missing in docs folder" -ForegroundColor Red
    $validationPassed = $false
}

# Check GitHub Pages workflow file
$workflowFile = ".\.github\workflows\pages.yml"
if (Test-Path $workflowFile) {
    Write-Host "✅ GitHub Pages workflow file exists" -ForegroundColor Green
    $workflowContent = Get-Content $workflowFile -Raw
    if ($workflowContent -match "actions/deploy-pages") {
        Write-Host "  ✅ deploy-pages action is configured in workflow" -ForegroundColor Green
        
        # Check for latest versions
        if ($workflowContent -match "actions/upload-pages-artifact@v3" -and $workflowContent -match "actions/deploy-pages@v4") {
            Write-Host "  ✅ Using latest recommended GitHub Pages action versions" -ForegroundColor Green
        } else {
            Write-Host "  ❌ Not using the latest recommended GitHub Pages action versions" -ForegroundColor Red
            $validationPassed = $false
        }
    } else {
        Write-Host "  ❌ deploy-pages action is missing in workflow" -ForegroundColor Red
        $validationPassed = $false
    }
} else {
    Write-Host "❌ GitHub Pages workflow file is missing" -ForegroundColor Red
    $validationPassed = $false
}

# Overall status
if ($validationPassed) {
    Write-Host "`nOverall validation: ✅ PASSED" -ForegroundColor Green
    Write-Host "Your GitHub Pages configuration looks good!" -ForegroundColor Green
    Write-Host "Please ensure you have the following settings in your GitHub repository:"
    Write-Host "1. In repository settings > Pages:"
    Write-Host "   - Source: GitHub Actions"
    Write-Host "   - Branch: main (if applicable)"
    Write-Host "2. GitHub Pages deployment workflow is correctly set up and running."
} else {
    Write-Host "`nOverall validation: ❌ FAILED" -ForegroundColor Red
    Write-Host "Please fix the issues highlighted above to properly configure GitHub Pages." -ForegroundColor Red
}
