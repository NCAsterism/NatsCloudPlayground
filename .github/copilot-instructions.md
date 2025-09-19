# NatsCloudPlayground Copilot Instructions

## Repository Architecture
- **Website**: `/docs` directory serves GitHub Pages content (Jekyll)
- **Projects**: `/projects` contains cloud architecture demonstrations and code samples
- **Scripts**: `/scripts` contains PowerShell utilities for GitHub Pages and repository management

## Developer Workflows
- **GitHub Pages**: Use `.github/workflows/pages.yml` with actions v4 (checkout@v4, configure-pages@v4, upload-pages-artifact@v3, deploy-pages@v4)
- **PowerShell**: All scripts include automatic carriage returns to prevent manual Enter key presses
- **Git**: Use conventional commit format and reference issue numbers in commits

## Conventions
- **Files/Folders**: Use `snake_case` naming for consistency
- **GitHub Pages**: Configure `baseurl: /NatsCloudPlayground` in `docs/_config.yml`
- **Documentation**: Main landing page at `docs/index.md`, setup guides in `docs/`

## Integrations
- **Jekyll**: Uses minimal-mistakes theme with proper baseurl configuration
- **GitHub Actions**: Automated deployment from `docs/` directory on main branch
- **Azure**: Follow Azure best practices for cloud architecture examples

## Examples
- **Validation**: Use `scripts/validate_github_pages.ps1` to check configuration
- **Deployment**: Reference `scripts/deploy_github_pages.ps1` for deployment workflows
- **Setup**: See `docs/github_pages_setup.md` and `docs/troubleshooting_github_pages.md`

## Preserved Rules
- **Azure**: Follow Azure development best practices for cloud examples
- **PowerShell**: Use proper error handling, parameter validation, and verb-noun naming
- **Git**: Create meaningful commits, use feature branches, and include proper documentation