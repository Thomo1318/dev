# Git Repository Structure Setup Workflow

This document describes the standardized workflow for creating a well-organized Git repository structure.

## Overview

This workflow creates a consistent directory structure for different types of repositories with appropriate README files and documentation.

## Supported Repository Types

### 1. **Development Setup** (`devsetup`)
Perfect for repositories that contain development environment configurations, tools, and setup scripts.

**Structure Created:**
- `configs/` - Configuration files and dotfiles
- `scripts/` - Automation and setup scripts
- `docs/` - Documentation and guides
- `tools/` - Custom utilities and tools
- `templates/` - Reusable templates
- `assets/` - Static resources and media
- `.github/` - GitHub workflows and templates

### 2. **General Project** (`project`)
Suitable for application and library projects.

**Structure Created:**
- `src/` - Source code
- `tests/` - Test files
- `docs/` - Project documentation
- `config/` - Configuration files
- `.github/` - GitHub workflows

### 3. **Documentation/Tools** (`docs`/`tools`)
Uses the development setup structure as a base, suitable for documentation-focused or tool repositories.

## Usage Methods

### Method 1: Using the Setup Script (Recommended)

```bash
# Navigate to your repository
cd /path/to/your/repository

# Run the setup script
./path/to/setup-git-structure.sh [repository_type] [repository_name]

# Examples:
./setup-git-structure.sh devsetup "My Development Setup"
./setup-git-structure.sh project "My Awesome Project"
./setup-git-structure.sh docs "Documentation Hub"
```

### Method 2: Manual Warp Drive Workflow

You can also save this as a Warp Drive workflow for quick access:

```bash
# Warp Drive Workflow Template
# Name: Setup Git Repository Structure
# Description: Creates a standard directory structure for Git repositories
# Tags: git, setup, structure, workflow

# Usage: Run in any Git repository directory
curl -sSL https://raw.githubusercontent.com/yourusername/devsetup/main/scripts/setup-git-structure.sh | bash -s {{repository_type}} "{{repository_name}}"
```

**Workflow Arguments:**
- `repository_type`: Enum (devsetup, project, docs, tools)
- `repository_name`: String (default: "Development Repository")

### Method 3: Direct Integration

For integration into existing workflows or CI/CD pipelines:

```yaml
# GitHub Actions Example
- name: Setup Repository Structure
  run: |
    curl -sSL https://raw.githubusercontent.com/yourusername/devsetup/main/scripts/setup-git-structure.sh | bash -s devsetup "Automated Setup"
```

## What the Workflow Does

1. **🔍 Analyzes** the repository type and requirements
2. **📁 Creates** the appropriate directory structure
3. **📝 Generates** README files for each directory with:
   - Purpose and description
   - Expected file types
   - Contributing guidelines
4. **🔄 Updates** the main README.md with repository structure overview
5. **💾 Commits** all changes with a descriptive commit message
6. **📋 Displays** the final directory structure

## Directory Structure Benefits

### For Development Setup Repositories:
- **Organized Configurations**: Keep all config files in one place
- **Automated Scripts**: Centralize setup and maintenance scripts
- **Comprehensive Documentation**: Maintain guides and troubleshooting docs
- **Custom Tools**: Store and manage custom development utilities
- **Reusable Templates**: Share configuration templates across projects

### For Project Repositories:
- **Clean Separation**: Source code, tests, and docs are clearly separated
- **Scalable Structure**: Easy to expand as the project grows
- **Standard Layout**: Familiar structure for contributors
- **CI/CD Ready**: Prepared for automated workflows

## Best Practices

### Before Running the Workflow:
1. Ensure you're in the correct Git repository
2. Commit any existing changes
3. Consider the repository's primary purpose when choosing the type

### After Running the Workflow:
1. Review the generated README files
2. Customize the descriptions to match your specific use case
3. Move existing files to appropriate directories
4. Update the main README with project-specific information
5. Push changes to remote repository

## Customization

The workflow script is designed to be easily customizable:

### Adding New Repository Types:
1. Create a new function like `setup_custom_structure()`
2. Add the new type to the case statement in main execution
3. Define the directory structure and README content

### Modifying Directory Content:
1. Edit the `create_dir_with_readme()` function calls
2. Update the README template content
3. Adjust the directory names and purposes

### Integration Examples:

#### Makefile Integration:
```makefile
setup-repo:
	@./scripts/setup-git-structure.sh $(TYPE) "$(NAME)"

.PHONY: setup-repo
```

#### Package.json Script:
```json
{
  "scripts": {
    "setup:repo": "./scripts/setup-git-structure.sh devsetup"
  }
}
```

## Troubleshooting

### Common Issues:

1. **Script not executable**: Run `chmod +x setup-git-structure.sh`
2. **Git not initialized**: Run `git init` first
3. **Existing directories**: The script will not overwrite existing directories
4. **Permission issues**: Ensure you have write permissions in the directory

### Validation:

After running the workflow, verify the structure:
```bash
# Check directory structure
tree -a -I '.git'

# Verify all READMEs were created
find . -name "README.md" -type f

# Check Git status
git status
```

## Future Enhancements

- Support for additional repository types (monorepo, microservices, etc.)
- Interactive mode for custom directory selection
- Integration with popular project generators
- Template customization through configuration files
- Support for different documentation formats (RST, AsciiDoc)

## Contributing

To improve this workflow:
1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Test with different repository types
5. Submit a pull request with documentation updates

---

*This workflow is part of the standardized development setup process. For questions or improvements, please see the contributing guidelines.*