# AI Coding Agent Instructions for Code1

## Overview
Code1 is a Python project scaffold with pytest configured for testing. The repository is in initial setup phase. Update this file as project architecture and conventions emerge from development.

## Current Setup
- **Language**: Python
- **Testing Framework**: pytest (configured in `.vscode/settings.json`)
- **Test Discovery**: Root directory (`.`)
- **IDE**: VS Code with Python support enabled

## Developer Workflows

### Testing
```bash
# Run all tests (pytest is configured as the default test framework)
pytest
# or through VS Code Test Explorer (installed by default)
```

- Test files should be discoverable by pytest from the root directory
- Configuration in `.vscode/settings.json` enables pytest integration

## Project Conventions
_To be established as code develops. Consider documenting:_
- Module organization (flat vs. package structure)
- Naming conventions for modules, classes, functions
- Import organization (standard library, third-party, local)
- File structure for features/components

## Architecture Patterns
_To be established as components emerge. Track:_
- Major components and their responsibilities
- Service/module boundaries
- Data flow between components
- Key design decisions and their rationale

## Key Files/Directories
- `.vscode/settings.json` - Python and pytest configuration
- `.github/copilot-instructions.md` - This file; update as patterns emerge