# GitHub Pages Setup Guide

## Current Configuration Status
- ✅ Root `index.html` with redirect to `docs/` folder exists
- ✅ `docs/_config.yml` with proper Jekyll configuration exists
- ✅ `.nojekyll` files in both root and docs folders exist
- ✅ GitHub Actions workflow for Pages deployment is configured

## Required GitHub Repository Settings

To ensure GitHub Pages works correctly, follow these steps in your GitHub repository:

1. Go to your repository settings (Settings tab)

2. Navigate to "Pages" in the left sidebar

3. Under "Build and deployment":
   - Source: Select "GitHub Actions"
   - (The previously used "Deploy from a branch" method is now deprecated in favor of GitHub Actions)

4. Make sure the GitHub Actions workflow is running properly:
   - Go to the "Actions" tab in your repository
   - Check that the "Deploy GitHub Pages" workflow is running without errors
   - If there are errors, review the logs and fix any issues

5. Once successfully deployed, you should see a message in the Pages settings with:
   - "Your site is live at https://ncasterism.github.io/NatsCloudPlayground/"

## Troubleshooting

If GitHub Pages is still not working:

1. Check GitHub Actions logs for detailed error messages

2. Ensure your repository has proper permissions enabled:
   - In Settings > Actions > General, ensure workflow permissions include "Read and write permissions"
   - In Settings > Pages, ensure GitHub Actions has proper permissions

3. Verify that all necessary files have the correct content:
   - `_config.yml` has proper baseurl and theme settings
   - Root `index.html` properly redirects to the docs folder
   - No conflicting Jekyll settings that could cause build failures

4. Try triggering a new build by making a small change to a file and pushing it

## Working with Repository Scripts

When running PowerShell scripts related to this repository:

1. All repository scripts should include automatic carriage returns to prevent the need to manually press Enter after commands
2. If creating new scripts, always end command lines with newlines
3. When manually typing commands in the terminal, you can use the following pattern:

```powershell
# Example of a script with carriage returns
git add . 
git commit -m "Update GitHub Pages configuration" 
git push origin main 
```

4. Use the provided helper scripts:
   - `scripts/validate_github_pages.ps1` - Validates your GitHub Pages configuration
   - `scripts/github_pages_commands.ps1` - Provides helpful commands with automatic carriage returns
   
5. For bash scripts on Linux/Mac environments, ensure they have proper line endings with `dos2unix` if needed

## Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Configuring a publishing source for your GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
- [Testing your GitHub Pages site locally with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)
