# Healing With Grounded Signals 

Practice building AI systems that reduce pain by translating human intent into action, verified through continuous ground-truth feedback loops.

## Projects

These projects are exercises for practicing the setup of AI feedback loops. 

- **[csharp/](csharp/)** - C# TodoApp with intentional warnings
- **[java/](java/)** - Java TodoApp with intentional warnings
- **[typescript/](typescript/)** - React + TypeScript + Vite with intentional warnings

## What you should do

Step 1: Fork the repository, so that you can create a PR

Step 2: Guide an agent to:

1. Take the pain signal (warning)
2. Follow a guided intervention protocol (changes code)
3. Run grounding checks/feedback (build/test/lint)
4. Produce an auditable change set (PR)
5. Repeat

## Constraints

- Small Steps: Fix one warning per PR
- Persistent Process: Process File / Skill
- Review: The Agent should review its own work
- Background: The Agent does not occupy your main workspace (It is not working on your development environment / your branch)

## Possible Solutions

- Process file
- Slash command/Skill
- Wrapper script
- Prove it hook
- Cli agent
- Git worktree

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

Ideally, you prevent warnings from entering the codebase in the first place. Many warnings can also be auto-fixed by IDEs or tools like `dotnet format`, `eslint --fix`, etc. That's more efficient.

This exercise is not about that. It's about learning to work with AI agents: guiding them, giving them feedback, and letting them run in a loop on your desired workflow.
