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
   - run csharp\firts-warning.ps1
   
2. Understand the warning:
   - Read compiler documentation
   - Research best practices
   - Examine affected code context

### Phase 3: Test Implementation (TDD Cycle)

#### Step 1: Run Tests (Green)
- Verify tests fail or are affected by the warning
- Confirm baseline behavior
- Commit changes (use C:\Program Files\Git\bin\git.exe)

#### Step 2: Make Minimal Changes (GREEN)
- Apply the smallest fix to resolve the warning
- Examples:
  - Remove unused variables
  - Add proper null checks
  - Fix type mismatches
  - Add resource cleanup (dispose/try-finally)

#### Step 3: Run Tests Again
- Verify all tests pass
- Run linter/compiler to confirm warning is resolved
- Commit changes (use C:\Program Files\Git\bin\git.exe)

## Implementation Checklist

- [ ] Identify and list all warnings
- [ ] Fix warnings one at a time
- [ ] Verify tests pass after each fix
- [ ] Run full test suite
- [ ] Confirm no new warnings

## Tools & Commands

### C#
```bash
# Build and treat warnings as errors
dotnet build .\csharp\TodoApp.slnx

# Run tests
dotnet test .\csharp\TodoApp.slnx

# Run specific test
dotnet test .\csharp\TodoApp.slnx --filter "TestName"
```