# GitHub Pages Troubleshooting Guide

## Latest Configuration Status

- ✅ Repository Settings: Using "GitHub Actions" as the Source
- ✅ Workflow File: Using correct action versions (v3/v4)
- ✅ File Structure: Using the `docs` folder as the source
- ✅ Configuration: `_config.yml` with proper baseurl setting

## Typical Issues and Solutions

### 1. Access URL Issues

- **Root Site vs Subpath**
  - Root site: `https://ncasterism.github.io/` 
  - Project site: `https://ncasterism.github.io/NatsCloudPlayground/`
  - If only the root works but not the project site, check the `baseurl` in `_config.yml`

### 2. GitHub Actions Recommended Versions

- **Correct Versions for GitHub Pages Actions:**
  - `actions/checkout@v4`
  - `actions/configure-pages@v4`
  - `actions/upload-pages-artifact@v3`
  - `actions/deploy-pages@v4`

### 3. Repository Settings

- **In GitHub Repository Settings > Pages:**
  - Source: Must be set to "GitHub Actions"
  - Ensure branch settings are correct
  - HTTPS enforcement should be enabled

### 4. File Structure Requirements

- **For the `docs` folder approach:**
  - Place all site content in the `docs` folder
  - Make sure there's an `index.html` or `index.md` at the root of the `docs` folder
  - Ensure `.nojekyll` file exists if you don't want Jekyll processing

## Verifying GitHub Pages Deployment

1. **Check Actions tab** in your GitHub repository for the latest workflow run
2. **Look for green checkmark** indicating a successful deployment
3. **Visit your site URL** several minutes after a successful deployment
4. **Clear browser cache** if old content is still showing

## Quick Fixes

### If Actions Workflow Fails:

```yaml
# Updated working GitHub Pages workflow with latest versions
name: Deploy Pages
on:
  push:
    branches: [ main ]
permissions:
  pages: write
  id-token: write
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v4
      - uses: actions/upload-pages-artifact@v3
        with:
          path: docs
      - uses: actions/deploy-pages@v4
```

### If Project Site URL Returns 404:

1. Check `baseurl` setting in `_config.yml`:
   ```yaml
   baseurl: /NatsCloudPlayground
   ```

2. Make sure paths in HTML files use `{{ site.baseurl }}` prefix:
   ```html
   <a href="{{ site.baseurl }}/blog">Blog</a>
   ```

## Next Steps for a Successful Blog

Once your GitHub Pages site is up and running:
1. **Check links** throughout your site to ensure they work
2. **Add content** to your blog folders
3. **Set up custom domain** if desired (in GitHub Pages settings)
4. **Enable HTTPS** for your site (automatically enabled for GitHub domains)
