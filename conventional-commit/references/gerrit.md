# Gerrit commit-message integration

## Detect

Strong signals:

- SSH clone or push URLs using port `29418`
- Review pushes to `refs/for/<branch>`
- `/ssh_info`
- Hostnames commonly beginning with `review.` or `gerrit.`

Gerrit is normally self-hosted, so hostname alone may be inconclusive.

## Change-Id

Gerrit's primary commit-message integration is review identity, not issue auto-closing.

```text
fix(index): reduce false positives in query expansion

Change-Id: I0123456789abcdef0123456789abcdef01234567
```

Rules:

- Preserve the `Change-Id:` when amending or rebasing a commit for an existing review.
- Keep `Change-Id:` in the final footer paragraph.
- Let Gerrit's `commit-msg` hook create it when possible.
- Do not invent, regenerate, or alter an existing Change-Id without a specific reason.
- Some Gerrit installations accept or generate a `Link:` trailer instead when configured with a review URL.

## Issue-tracker trailers

Issue references such as `Bug:` or `Feature:` are project conventions rather than universal Gerrit state-changing keywords.

Example used by Gerrit's own project conventions:

```text
fix(index): reduce false positives in query expansion

Bug: Issue 24891
Change-Id: I0123456789abcdef0123456789abcdef01234567
```

Consult repository contribution documentation before adding project-specific trailers such as `Bug:`, `Feature:`, `Task:`, `Signed-off-by:`, or external tracker IDs.

## Sources

- Gerrit Documentation, commit-msg hook: https://gerrit-review.googlesource.com/Documentation/cmd-hook-commit-msg.html
- Gerrit Documentation, Change-Ids: https://gerrit-review.googlesource.com/Documentation/user-changeid.html
- Gerrit Documentation, Uploading changes: https://gerrit-review.googlesource.com/Documentation/user-upload.html
- Gerrit Documentation, Crafting changes: https://gerrit-review.googlesource.com/Documentation/dev-crafting-changes.html
