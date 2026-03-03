# TodoApp

A simple C# todo application for practicing AI feedback loops. Learn to reduce pain by translating human intent into action, verified through continuous ground-truth feedback loops.

![Feedback Loop](../feedback-loop.svg)

## What you should do

Guide an agent to:

1. Take the pain signal (warning)
2. Follow a guided intervention protocol (changes code)
3. Run grounding checks/feedback (build/test)
4. Produce an auditable change set (PR)
5. Repeat

## Constraints

- Small Steps: Fix one warning per PR
- Persistent Process: Process File / Skill
- Review: The Agent should review its own work
- Background: The Agent does not occupy your main workspace (It is not working on your development environment / your branch)

## Going Meta

A useful approach is to guide the AI step by step through fixing a single warning deliberately. Once successful, have the AI write this workflow into a markdown file so it can follow the same process autonomously for future warnings.

1. Pick one warning from the build output
2. Walk the AI through understanding the warning
3. Have it propose a fix
4. Verify the fix (build, test)
5. Ask the AI to document the workflow it just followed
6. Use that workflow for subsequent warnings

**Bonus:** Vibe code scripts that distill the feedback for the AI. Instead of dumping raw build output, create scripts that extract and format exactly what the AI needs to see - warning codes, file locations, relevant context - without bloating the context window.

## Out of Scope

Ideally, you prevent warnings from entering the codebase in the first place. Many warnings can also be auto-fixed by IDEs or tools like `dotnet format`. That's more efficient.

This exercise is not about that. It's about learning to work with AI agents: guiding them, giving them feedback, and letting them run in a loop on your desired workflow.

## Build

```bash
dotnet build TodoApp.slnx --no-incremental
```

## Test

```bash
dotnet test TodoApp.slnx
```
