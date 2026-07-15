# Azure DevOps commit-message integration

## Detect

Treat these as strong Azure DevOps signals:

- `https://dev.azure.com/{organization}/{project}/_git/{repository}`
- `https://{organization}.visualstudio.com/{project}/_git/{repository}`
- SSH remotes using `ssh.dev.azure.com`

Distinguish an Azure Repos repository from a GitHub repository connected to Azure Boards.

## Azure Repos work items

Azure Repos can link `#<work-item-id>` mentions and can resolve work items with `fix`, `fixes`, or `fixed` resolution mentions when repository settings enable the behavior.

Neutral traceability:

```text
fix(auth): prevent duplicate callback processing

Refs: #123
```

Resolve the work item:

```text
fix(auth): prevent duplicate callback processing

Fixes #123
```

Important behavior:

- Resolution keywords are case-insensitive.
- A colon after the keyword is accepted for Azure Repos resolution mentions.
- Repeat the keyword and ID for every work item that should resolve.
- Automation is evaluated when the commit reaches the repository's default branch or through the configured pull-request completion flow.
- Linking and resolution can be disabled in repository settings.

Prefer `Refs: #123` when the commit is related but does not complete the work item.

## GitHub connected to Azure Boards

Use `AB#<work-item-id>` to link GitHub commits, branches, pull requests, or issues to Azure Boards after the connection is configured.

Neutral traceability in a commit message:

```text
fix(auth): prevent duplicate callback processing

Refs: AB#12345
```

State transition intent in a supported GitHub workflow:

```text
fix(auth): prevent duplicate callback processing

Fixed AB#12345
```

Important behavior:

- Prefer uppercase `AB#`.
- For GitHub pull requests and issues, place `AB#12345` in the description; titles and comments do not create the Azure Boards link.
- State transitions occur only in supported workflows, normally when a pull request is merged into the default branch.
- Repeat the transition term for each work item when all items should transition.

## Sources

- Microsoft Learn, Resolve work items on commit: https://learn.microsoft.com/azure/devops/repos/git/resolution-mentions
- Microsoft Learn, Link GitHub objects to Azure Boards work items: https://learn.microsoft.com/azure/devops/boards/github/link-to-from-github
- Microsoft Learn, Azure Repos repository settings: https://learn.microsoft.com/azure/devops/repos/git/repository-settings
- Microsoft Learn, Azure DevOps organization URL formats: https://learn.microsoft.com/azure/devops/extend/develop/work-with-urls
