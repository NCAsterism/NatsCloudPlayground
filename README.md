# Nat's Cloud Portfolio

> Professional portfolio showcasing cloud architecture expertise, infrastructure as code implementations, and technical content.

## About This Repository
This repository serves as a professional portfolio website built with GitHub Pages, showcasing my cloud engineering expertise, project examples, and technical content.

## View Live Site
The live site is published at: [https://[username].github.io/NatsCloudPlayground/](https://[username].github.io/NatsCloudPlayground/)

## Repository Structure
```
NatsCloudPlayground/
├── docs/                    # GitHub Pages content (main website)
│   ├── blog/                # Technical articles and insights
│   ├── certifications/      # Professional certifications
│   ├── presentations/       # Conference talks and materials
│   ├── timeline/            # Professional development timeline
│   └── index.md             # Main landing page
├── projects/                # Featured cloud projects with code
│   └── alz_bicep/           # Azure Landing Zone Bicep examples
├── scripts/                 # Utility scripts
│   ├── github_pages_commands.ps1   # GitHub Pages helper script with auto-carriage returns
│   └── validate_github_pages.ps1   # GitHub Pages validation script
└── .cursor/                 # Cursor IDE configurations
```

## Local Development
To run this site locally:

```bash
# Clone the repository
git clone https://github.com/[username]/NatsCloudPlayground.git
```

## Development Best Practices

### PowerShell Scripts
All PowerShell scripts in this repository follow these best practices:

1. **Automatic Carriage Returns**: Scripts include automatic carriage returns to prevent the need for manual Enter key presses
2. **Helper Scripts**: Use the provided utility scripts for common tasks:
   - `scripts/validate_github_pages.ps1` - Validates GitHub Pages configuration
   - `scripts/github_pages_commands.ps1` - Provides common GitHub Pages management commands
3. **Documentation**: Each script includes descriptive comments and help text

### GitHub Pages Configuration
For GitHub Pages configuration details, see the [GitHub Pages Setup Guide](docs/github_pages_setup.md).

## Implementation Status
See [task_list.md](task_list.md) for current implementation status.

## License
This repository is licensed under [LICENSE](LICENSE).