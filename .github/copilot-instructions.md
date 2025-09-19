- @azure Rule - Use Azure Best Practices: When generating code for Azure, running terminal commands for Azure, or performing operations related to Azure, invoke your `azure_development-get_best_practices` tool if available.
- @powershell Rule 
        - Follow Microsoft Graph SDK Patterns: When generating PowerShell code for Microsoft Graph API interactions, use the Microsoft Graph PowerShell SDK cmdlets (Mg* cmdlets) rather than raw REST API calls.
        - Use PowerShell Best Practices: Follow PowerShell best practices for naming conventions, error handling, and code structure.
        - Use Verb-Noun Naming Conventions: Use standard PowerShell verb-noun naming conventions for functions and scripts.
        - Use CmdletBinding: Use CmdletBinding for advanced functions to enable common parameters and support pipeline input.
        - Use Write-Verbose and Write-Error: Use Write-Verbose for detailed output and Write-Error for error messages to a central log file
        - Use Parameter Validation: Use parameter validation attributes (e.g., ValidateSet, ValidateNotNullOrEmpty) to enforce input constraints.
        - Use Functions for Reusable Code: Encapsulate reusable code in functions to promote modularity and reusability.
        - Use Comments and Documentation: Include comments and documentation for functions, parameters, and complex logic to improve code readability.
        - Use Consistent Formatting: Follow consistent formatting and indentation for readability.
        - Use Progress Reporting: For longer-running operations, implement Write-Progress to show operation status.
        - Use Module Structure: For complex scripts, organize code into modules with proper exports.
- @authentication Rule - Proper Authentication: Always include guidance for proper authentication using Connect-MgGraph with appropriate scopes for the operations being performed.
- @permissions Rule - Use Minimum Required Permissions: When recommending Microsoft Graph API operations, suggest using the minimum required permissions needed for the specific operation.
- @documentation Rule - Include Documentation Links: When providing code examples, include links to relevant Microsoft documentation for the APIs being used.
- @error-handling Rule - Include Error Handling: Always include proper error handling in PowerShell scripts with try/catch blocks and appropriate error messages.
- @tenant-safety Rule - Warn About Production Impact: For scripts that modify Intune resources, include warnings about testing in non-production environments first.
- @intune-policy Rule - Intune Policy Management:
  - Organize policies by tenant and category
  - Use consistent naming conventions for policies (follow existing patterns in exports folder)
  - Implement role-based access using Microsoft Entra ID PIM
  - Include clear documentation for policy implementation requirements
  - For policy exports, maintain structure with JSON files and README documentation
  - Consider Conditional Access implications when modifying device policies
  - Always validate policy assignments before applying to production
- @adhd-friendly Rule - ADHD-Friendly Documentation & UI:
  - Use visual indicators (emojis) for priorities, energy levels (🥄), and time estimates (⏱️)
  - Break down complex tasks into smaller, manageable steps
  - Use collapsible sections for lengthy content
  - Implement consistent formatting for improved scannability
  - Include context and next steps with each task or instruction
  - Provide explicit energy and time estimates for tasks
  - Use color and visual hierarchies for important information
- @repo-structure Rule - Repository Organization:
  - Follow the established directory structure in file_tree.md
  - Use snake_case for all files and folders
  - Maintain README.md files in each directory
  - Place documentation in the appropriate docs/ subdirectory
  - Organize automation scripts by purpose in the automation/ directory
  - Follow naming conventions for files based on their directory context
  - Add appropriate status indicators (✅,🚧,📅) to documentation files
- @devops Rule - Follow Git Best Practices: When suggesting changes to the codebase, recommend proper Git workflows such as:
  - Create feature branches with descriptive names
  - Write meaningful commit messages that describe the change
  - Include relevant issue numbers in commit messages when applicable
  - Create pull requests with detailed descriptions of changes
  - Ensure code changes include appropriate documentation updates
  - Run tests before submitting pull requests
  - Follow the repository's established code style and conventions
  - Always follow the detailed microstep workflow guidelines in `.github/CONTRIBUTING.md`
  - Use conventional commit format (type(scope): description)
  - Always add carriage returns at the end of terminal commands to prevent the need for manual Enter key presses

// MCP Server Rules
- @mcp-security Rule - API Security: When implementing MCP servers, always use proper authentication mechanisms (API keys, OAuth2), implement HTTPS, and follow principle of least privilege for API endpoints.
- @mcp-config Rule - Configuration Management: Store sensitive configuration values (API keys, tokens, passwords) in environment variables or secure storage, not in config files that might be committed to the repository.
- @mcp-architecture Rule - Server Architecture: Follow RESTful API design principles for MCP servers with clear endpoint naming, proper HTTP methods, and consistent response formats.
- @mcp-adhd Rule - ADHD-Friendly Development: Break down MCP server implementation tasks into smaller, manageable chunks with clear starting points and next steps.
- @mcp-testing Rule - API Testing: Include comprehensive API tests for all MCP server endpoints using appropriate testing frameworks.
- @mcp-documentation Rule - API Documentation: Provide clear, concise documentation for all MCP server endpoints, including request/response examples, authentication requirements, and error handling.
- @mcp-integration Rule - Second Brain Integration: When developing MCP server features, consider how they integrate with the broader Second Brain architecture and other MCP servers.
- @obsidian-integration Rule - Obsidian Vault Integration: When working with the Obsidian MCP server, respect Obsidian's file structure and metadata format to ensure compatibility.

// Task and Issue Management
- @task-sync Rule - GitHub Issue-TaskList Synchronization:
  - Always reference GitHub issues in TaskList.md using the format: `Task description (#XX)` 
  - When adding new tasks to TaskList.md, check if a corresponding GitHub issue exists and reference it
  - When creating a new GitHub issue, ensure it's added to the appropriate section in TaskList.md
  - Maintain consistent priority levels between GitHub issues and TaskList.md entries
  - Use the Visual Task Board section in TaskList.md to display high-priority GitHub issues
  - Group related issues logically in TaskList.md (e.g., MCP server implementations)
  - When completing a task in TaskList.md, update the corresponding GitHub issue status
  - Consider creating GitHub workflows to automate synchronization between issues and TaskList.md
  - For complex tasks with multiple subtasks, link to a parent issue in the task description

## Developer Workflows

### 📄 Add a New Page
**How to add a new page under docs/_pages/ and update navigation:**

1. **Create the page file:**
```powershell
# Create new page in docs/_pages/
New-Item -Path "docs/_pages/your_page_name.md" -ItemType File 
```

2. **Add front matter to the page:**
```markdown
---
layout: single
title: "Your Page Title"
permalink: /your_page_name/
author_profile: true
---

# Your Page Content

Your content here with links like [example]({{ site.baseurl }}/other-page/).
```

3. **Update navigation in docs/_data/navigation.yml:**
```yaml
# Add to main navigation
main:
  - title: "Your Page"
    url: /your_page_name/
```

4. **Validate and commit:**
```powershell
./scripts/validate_github_pages.ps1 
git add docs/_pages/your_page_name.md docs/_data/navigation.yml 
git commit -m "Add new page: Your Page Title" 
git push 
```

### 📝 Add a Blog Post
**How to add a blog post under docs/_posts/ with correct front matter:**

1. **Create the blog post file (use YYYY-MM-DD-title.md format):**
```powershell
# Create new blog post
$date = Get-Date -Format "yyyy-MM-dd"
New-Item -Path "docs/_posts/$date-your-post-title.md" -ItemType File 
```

2. **Add required front matter:**
```markdown
---
layout: single
title: "Your Post Title"
date: 2025-01-15
categories: 
  - Azure
  - Infrastructure
tags:
  - your-tag
  - another-tag
toc: true
header:
  teaser: /assets/images/your-image-thumb.jpg
---

# Your Post Content

Your blog post content with site links like [Projects]({{ site.baseurl }}/projects/).
```

3. **Validate and deploy:**
```powershell
./scripts/validate_github_pages.ps1 
git add docs/_posts/ 
git commit -m "Add blog post: Your Post Title" 
git push 
```

### ✅ Validate and Deploy
**How to validate and deploy using the validation script:**

1. **Run the GitHub Pages validation script:**
```powershell
./scripts/validate_github_pages.ps1 
```

2. **If validation passes, commit and push changes:**
```powershell
git add . 
git commit -m "Update GitHub Pages configuration" 
git push 
```

3. **For comprehensive deployment with validation:**
```powershell
./scripts/deploy_github_pages.ps1 
```

4. **Check deployment status:**
- Monitor GitHub Actions at: `https://github.com/NCAsterism/NatsCloudPlayground/actions`
- View site at: `https://ncasterism.github.io/NatsCloudPlayground/`

### 🏗️ Use AVM Bicep Module
**How to use Azure Verified Modules (AVM) with reference to projects structure:**

1. **Reference the AVM implementation guide:**
```powershell
# View existing AVM examples
Get-Content "projects/avm_implementations.md" 
```

2. **Create a new Bicep file using AVM modules:**
```bicep
// Example: Deploy Virtual Network using AVM
module vnet 'br/public:avm/res/network/virtual-network:1.0.1' = {
  name: 'vnetDeployment'
  params: {
    name: 'hub-vnet'
    addressPrefixes: [
      '10.0.0.0/16'
    ]
    subnets: [
      {
        name: 'GatewaySubnet'
        addressPrefix: '10.0.0.0/24'
      }
    ]
    location: location
    tags: tags
  }
}
```

3. **Document the implementation:**
```powershell
# Update the AVM implementations documentation
# Reference: docs/projects/avm_implementations.md
# Reference: projects/alz_bicep/ (when added as submodule)
```

4. **Deploy and validate:**
```powershell
az deployment group create --resource-group myRG --template-file main.bicep 
git add . 
git commit -m "Add AVM Bicep implementation" 
git push 
```

### 📦 Add Git Submodule
**How to add a Git submodule into projects/ directory:**

1. **Add the submodule:**
```powershell
# Example: Add Azure Landing Zone Bicep as submodule
git submodule add https://github.com/Azure/ALZ-Bicep.git projects/alz_bicep 
```

2. **Initialize and update submodules:**
```powershell
git submodule init 
git submodule update 
```

3. **Commit the submodule addition:**
```powershell
git add .gitmodules projects/alz_bicep 
git commit -m "Add ALZ-Bicep as submodule in projects/alz_bicep" 
git push 
```

4. **Update submodule to latest version:**
```powershell
cd projects/alz_bicep 
git pull origin main 
cd ../.. 
git add projects/alz_bicep 
git commit -m "Update alz_bicep submodule to latest" 
git push 
```

5. **Clone repository with submodules (for team members):**
```powershell
git clone --recurse-submodules https://github.com/NCAsterism/NatsCloudPlayground.git 
# Or if already cloned:
git submodule update --init --recursive 
```