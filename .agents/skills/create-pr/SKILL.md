---
name: create-pr
description: Use when create a pull request
---

- Create a draft pull request.
- If the user session is in Japanese, write a pull request in Japanese. Otherwise, write it in English.
- Write the intent of pull request.
- Do not write the details of diff, because a reviewer shoukd understand it from the diff.

Here is the body template:

```markdown
## Issue
- https://github.com/owner/repo/issues/number

## Problem to solve
Describe the intention why this change is needed.

## Change
Describe the summary of change in one line.
```
