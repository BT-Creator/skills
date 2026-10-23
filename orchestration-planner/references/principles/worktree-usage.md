# Use worktrees in order to avoid write conflicts

If the request can be split into smaller tasks sets, but there might be write overlap, you can make use of git worktrees in order to avoid the write conflicts.

When using Git worktrees, you must also have a step where you merge the different worktrees back into the original worktree. Make sure to mark which worktree is the "main" worktree
