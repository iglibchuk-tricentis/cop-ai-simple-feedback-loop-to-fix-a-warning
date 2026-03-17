# TDD Approach to Fix Warnings

## Overview
This document describes a Test-Driven Development (TDD) approach for systematically identifying, understanding, and fixing compiler warnings and code quality issues across the TodoApp project.

## Core Principles

1. **Test First**: Write or identify tests that validate the expected behavior
2. **Understand Context**: Analyze the warning in the context of existing functionality
3. **Minimal Changes**: Make the smallest change necessary to resolve the warning
4. **Verify**: Ensure tests pass and no new warnings are introduced
5. **Maintain Quality**: Keep code clean, readable, and maintainable

## Process Workflow

1. Run compiler/linter for each language:
   - build the project with dotnet tool 
   
2. Understand the warning:
   - Read compiler documentation
   - Research best practices
   - Examine affected code context

3. Create a branch in the repository for fixing the selected issue. It is important to select only one warning per time
   - run git to create a wokrtree with a dedicated branch for fixing the selected warning

4. Run Tests (Green)
   - Verify tests are green before fixing
   - Confirm baseline behavior

5. Make Minimal Changes (GREEN)
   - Apply the smallest fix to resolve the warning
   - Commit changes (use C:\Program Files\Git\bin\git.exe)
   - Examples:
      - Remove unused variables
      - Add proper null checks
      - Fix type mismatches
      - Add resource cleanup (dispose/try-finally)

6. Run Tests Again
   - Verify all tests pass
   - Run linter/compiler to confirm the selected warning is resolved
   - Commit changes (use C:\Program Files\Git\bin\git.exe)
   - Commit push the branch (use C:\Program Files\Git\bin\git.exe)

7. Create a PR via git for the fixed warning

8. Continue with step 3 but for the next warning

## Tools & Commands

### C#
```bash
# Build and treat warnings as errors
dotnet build .\TodoApp.slnx --no-incremental 2>&1

# Run tests
dotnet test .\TodoApp.slnx

# Run specific test
dotnet test .\TodoApp.slnx --filter "TestName"
```