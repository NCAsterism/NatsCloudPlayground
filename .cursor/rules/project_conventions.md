# Project Conventions for NatsCloudPlayground

These are guidelines to maintain consistency within this repository.

## Naming Conventions

*   **Files and Folders:** Use `snake_case` for all new files and folders (e.g., `my_module.bicep`, `helper_scripts/`).

## GitHub Pages

*   **Source:** The website is served from the `/docs` directory on the `main` branch.
*   **Content:** All website content (Markdown files, images, etc.) should reside within the `/docs` directory or its subdirectories.
*   **Index:** The main landing page is `docs/index.md`.

## Project Structure

*   **Website Content:** `/docs`
*   **Portfolio Projects:** `/projects` (Code samples, project-specific documentation)
*   **Utility Scripts:** `/scripts` (PS1, Python, etc. - not part of the website)

## Submodules

*   Repositories included within this project (like `/projects/alz_bicep`) should be added as Git submodules using `git submodule add <repo-url> <path>`.

## Scripting and Commands

*   **Terminal Commands:** Use Windows CMD or PowerShell syntax when providing commands to run directly in the terminal.
*   **Automation Scripts:** Prefer Python for cross-platform compatibility where possible, but PowerShell (`.ps1`) is acceptable for Windows-specific tasks.

## README and Tasklist Updates

*   Remember to update the main `README.md` (or `docs/index.md` for the website) and any relevant task lists as changes are made. 