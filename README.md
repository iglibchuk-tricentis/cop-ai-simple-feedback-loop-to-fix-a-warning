# Building a Healing Harness 

Practice building a harness that translates human intent to address technical debt into an automated feedback loop.

![Feedback Loop](feedback-loop.svg)

## Projects

These projects are exercises for practicing the setup of AI feedback loops. 

- **[csharp/](csharp/)** - C# TodoApp with intentional warnings
- **[java/](java/)** - Java TodoApp with intentional warnings
- **[typescript/](typescript/)** - React + TypeScript + Vite with intentional warnings

## What you should do

### Step 1: Fork the repository, so that you can create a PR

### Step 2: Guide an agent through all the steps to fix a single warning and create the PR

Make sure you have the agent perform all the steps:
- Run the tests to validate nothing broke
- Prove that the warning was fixed
- Review its own change

### Step 3: Design a process file that guides an agent through fixing a single warning and creating the PR

A process file guides the agent through a repeatable intervention protocol. It is typically written as markdown and includes:

 - High-level intent
 - Constraints
 - Numbered workflow steps

Store the process in `process/<your-process>.md`

Make sure the process takes care of starting from a clean working tree.

Trial run the process, and see if it works well. 
You do this by starting a fresh context and telling the agent to read the process file and to follow it.
Once it runs, carefully check what the agent is doing.
If you notice that it's not behaving as you'd expected, revert the changes, adapt the process and try again.
Keep doing this until you are happy with your process.

### Step 4: Design a harness that fixes warnings in the background

The harness should be able to find out what warnings there are to fix.
The harness should use your process file and fix one warning at a time, resulting in PRs that fix one warning each.
The harness should avoid fixing the same warning twice.
The harness should not occupy your main workspace, so you should be able to work on something else in the meantime.
Use `git worktree` to do that.

### Step 5: Refine your harness

Which steps in your harness currently use inference but could be done deterministically?
How do you make sure your validation steps do not rely on agent behavior?
How could you make the harness work while you are sleeping? 
How can you make sure that the agent's context is not fed with irrelevant output when programs/scripts are run in the process?

## Going Meta

A useful approach is to guide the AI step by step through fixing a single warning deliberately. 
Once successful, have the AI write this workflow into a markdown file so it can follow the same process autonomously for future warnings.

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
