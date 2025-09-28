#!/bin/bash

# Git Repository Structure Setup Script
# Creates a standard directory structure for development repositories
# Usage: ./setup-git-structure.sh [repository_type] [repository_name]
#
# Repository Types:
#   - devsetup: Development setup and configuration repository
#   - project: General project repository
#   - docs: Documentation-focused repository
#   - tools: Tools and utilities repository
#
# Example: ./setup-git-structure.sh devsetup "My Dev Setup"

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
REPO_TYPE="${1:-devsetup}"
REPO_NAME="${2:-Development Repository}"

echo -e "${BLUE}🚀 Setting up Git repository structure${NC}"
echo -e "${BLUE}Repository Type: ${REPO_TYPE}${NC}"
echo -e "${BLUE}Repository Name: ${REPO_NAME}${NC}"
echo ""

# Function to create directory with README
create_dir_with_readme() {
    local dir_name="$1"
    local dir_purpose="$2"
    local dir_description="$3"
    local expected_files="$4"
    local contributing_notes="$5"
    
    echo -e "${YELLOW}📁 Creating ${dir_name}/ directory...${NC}"
    mkdir -p "$dir_name"
    
    cat > "${dir_name}/README.md" << EOF
# ${dir_purpose}

${dir_description}

## Purpose
${dir_description}

## Types of Files Expected
${expected_files}

## Contributing
${contributing_notes}
EOF
}

# Function to setup devsetup repository structure
setup_devsetup_structure() {
    echo -e "${GREEN}Setting up development setup repository structure...${NC}"
    
    create_dir_with_readme "configs" "Configurations" \
        "This directory contains configuration files for various development tools and environments. Store configuration files, dotfiles, and settings templates that can be used across different development environments." \
        "- Configuration files (\`.json\`, \`.yaml\`, \`.toml\`, \`.ini\`)
- Dotfiles (\`.bashrc\`, \`.zshrc\`, \`.gitconfig\`, etc.)
- Tool-specific config files (mise.toml, .nvmrc, etc.)
- Environment variable templates
- IDE/Editor configuration files" \
        "When adding new configuration files, please include comments explaining the purpose and any customization needed. Use clear, descriptive filenames and organize by tool or category when appropriate."
    
    create_dir_with_readme "scripts" "Scripts" \
        "This directory contains automation scripts for development environment setup and maintenance. Store shell scripts, setup scripts, and automation tools that help streamline the development environment configuration process." \
        "- Setup and installation scripts (\`.sh\`, \`.bash\`, \`.zsh\`)
- Environment bootstrapping scripts
- Tool installation and configuration scripts
- Maintenance and cleanup scripts
- Cross-platform compatibility scripts" \
        "All scripts should be executable, well-commented, and include usage instructions at the top. Test scripts on multiple platforms when possible and use portable shell syntax. Include error handling and provide clear success/failure feedback."
    
    create_dir_with_readme "docs" "Documentation" \
        "This directory contains comprehensive documentation for development environment setup and best practices. Provide detailed guides, tutorials, and reference materials for setting up and maintaining development environments." \
        "- Setup guides and tutorials (\`.md\`)
- Troubleshooting documentation
- Tool-specific installation guides
- Best practices and conventions
- Reference materials and cheat sheets
- Workflow documentation" \
        "Documentation should be written in clear, accessible language with step-by-step instructions. Include screenshots or code examples where helpful. Keep documents updated as tools and processes evolve."
    
    create_dir_with_readme "tools" "Tools" \
        "This directory contains custom tools and utilities for development environment management. Store custom-built tools, utilities, and helper applications that enhance the development workflow." \
        "- Custom CLI tools and utilities
- Helper scripts and programs
- Binary executables (with source code)
- Tool configuration managers
- Development workflow enhancers
- Third-party tools not available via package managers" \
        "Include source code when possible and provide build instructions. Document tool dependencies and system requirements. Ensure tools are cross-platform compatible or clearly specify platform limitations."
    
    create_dir_with_readme "templates" "Templates" \
        "This directory contains template files for common development configurations and project structures. Provide reusable templates for configuration files, project structures, and development environment setups." \
        "- Project structure templates
- Configuration file templates
- Development environment templates
- CI/CD pipeline templates
- Documentation templates
- Boilerplate code and configurations" \
        "Templates should be well-commented with placeholder values clearly marked. Include instructions for customizing and using each template. Use generic, descriptive names and organize templates by category."
    
    create_dir_with_readme "assets" "Assets" \
        "This directory contains static assets and resources used in documentation and setup processes. Store images, diagrams, screenshots, and other static resources that support the documentation and setup processes." \
        "- Screenshots and images (\`.png\`, \`.jpg\`, \`.gif\`)
- Diagrams and flowcharts
- Icons and graphics
- Reference files and datasets
- Font files and themes
- Media files for documentation" \
        "Use descriptive filenames and organize assets by category or purpose. Optimize images for web use while maintaining clarity. Include alt text descriptions where appropriate."
    
    create_dir_with_readme ".github" "GitHub Configuration" \
        "This directory contains GitHub-specific configuration files and templates. Store GitHub Actions workflows, issue templates, pull request templates, and other GitHub-specific configurations." \
        "- GitHub Actions workflows (\`.github/workflows/\`)
- Issue templates (\`.github/ISSUE_TEMPLATE/\`)
- Pull request templates (\`.github/pull_request_template.md\`)
- Community health files (CODE_OF_CONDUCT.md, CONTRIBUTING.md)
- Security policies and guidelines
- Automated workflow configurations" \
        "Follow GitHub's official documentation for template formats and workflow syntax. Test workflows thoroughly before committing. Use clear, descriptive names for templates and workflows."
}

# Function to setup project repository structure
setup_project_structure() {
    echo -e "${GREEN}Setting up general project repository structure...${NC}"
    
    create_dir_with_readme "src" "Source Code" \
        "This directory contains the main source code for the project." \
        "- Application source files
- Library code
- Main entry points
- Core business logic" \
        "Follow the project's coding standards and organize code logically by feature or module."
    
    create_dir_with_readme "tests" "Tests" \
        "This directory contains all test files and testing utilities." \
        "- Unit tests
- Integration tests
- End-to-end tests
- Test fixtures and mocks
- Testing utilities" \
        "Write comprehensive tests that cover edge cases. Use descriptive test names and organize tests to mirror the source code structure."
    
    create_dir_with_readme "docs" "Documentation" \
        "This directory contains project documentation." \
        "- API documentation
- User guides
- Architecture decisions
- Setup instructions
- Contributing guidelines" \
        "Keep documentation up-to-date with code changes. Use clear examples and maintain consistent formatting."
    
    create_dir_with_readme "config" "Configuration" \
        "This directory contains configuration files for different environments." \
        "- Environment-specific configs
- Application settings
- Deployment configurations
- CI/CD pipeline configs" \
        "Use environment variables for sensitive data. Document all configuration options and their purposes."
    
    create_dir_with_readme ".github" "GitHub Configuration" \
        "GitHub-specific files for workflows and templates." \
        "- GitHub Actions workflows
- Issue and PR templates
- Community health files" \
        "Test all workflows before merging. Use semantic and descriptive names for actions."
}

# Function to update main README
update_main_readme() {
    echo -e "${YELLOW}📝 Updating main README.md...${NC}"
    
    if [[ "$REPO_TYPE" == "devsetup" ]]; then
        cat > README.md << EOF
# ${REPO_NAME}

This repository contains configuration files, scripts, documentation, and resources for setting up and maintaining development environments.

## Repository Structure

- **[configs/](configs/)** - Configuration files, dotfiles, and settings templates for development tools
- **[scripts/](scripts/)** - Automation scripts for environment setup and maintenance  
- **[docs/](docs/)** - Comprehensive documentation, guides, and tutorials
- **[tools/](tools/)** - Custom tools and utilities for development workflow enhancement
- **[templates/](templates/)** - Reusable templates for projects and configurations
- **[assets/](assets/)** - Static resources like images, diagrams, and reference materials
- **[.github/](.github/)** - GitHub-specific configuration files and workflow templates

## Getting Started

Refer to the [documentation](docs/) directory for detailed setup guides and instructions.

## Contributing

See individual directory READMEs for specific contribution guidelines for each area of the repository.
EOF
    else
        cat > README.md << EOF
# ${REPO_NAME}

## Repository Structure

$(find . -maxdepth 1 -type d -name "[^.]*" | sort | while read -r dir; do
    dir_name=$(basename "$dir")
    if [[ -f "$dir/README.md" ]]; then
        purpose=$(head -n 1 "$dir/README.md" | sed 's/# //')
        echo "- **[${dir_name}/](${dir_name}/)** - ${purpose}"
    fi
done)

## Getting Started

Please refer to the documentation for setup and usage instructions.

## Contributing

See individual directory READMEs for specific contribution guidelines.
EOF
    fi
}

# Main execution
case "$REPO_TYPE" in
    "devsetup")
        setup_devsetup_structure
        ;;
    "project")
        setup_project_structure
        ;;
    "docs"|"tools")
        setup_devsetup_structure  # Use devsetup structure as base
        ;;
    *)
        echo -e "${RED}❌ Unknown repository type: $REPO_TYPE${NC}"
        echo -e "${YELLOW}Available types: devsetup, project, docs, tools${NC}"
        exit 1
        ;;
esac

# Update main README
update_main_readme

# Git operations
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${YELLOW}📋 Staging changes for commit...${NC}"
    git add .
    
    echo -e "${YELLOW}💾 Committing changes...${NC}"
    git commit -m "Add standard ${REPO_TYPE} repository structure with documentation"
    
    echo -e "${GREEN}✅ Repository structure created and committed successfully!${NC}"
    echo -e "${BLUE}📁 Directory structure:${NC}"
    tree -a -I '.git' || ls -la
else
    echo -e "${YELLOW}⚠️  Not in a git repository. Structure created but not committed.${NC}"
fi

echo ""
echo -e "${GREEN}🎉 Repository setup complete!${NC}"
echo -e "${BLUE}Next steps:${NC}"
echo -e "  1. Review the created structure"
echo -e "  2. Add your files to the appropriate directories"
echo -e "  3. Update documentation as needed"
echo -e "  4. Push changes to remote repository"