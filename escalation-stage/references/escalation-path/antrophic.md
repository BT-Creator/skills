# Antrophic Model escalation

For Antrophic models, the standard models as as follows:

- Large model: claude-sonnet-5.5 (medium)
- Small model: claude-haiku-5.5 (low)

Below you'll find the escalation table for OpenAI models

| Stage | Previous large Model | Previous large Model Reasoning | Previous small Model | Previous small Model Reasoning | Escalated large Model | Escalated large Model Reasoning | Escalated small model | Escalated small model reasoning |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | claude-sonnet-5.5 | medium | claude-haiku-5.5 | low | claude-opus-5.5 | low | claude-haiku-5.5 | low |
| 2 | claude-opus-5.5 | low | claude-haiku-5.5 | low | claude-opus-5.5 | medium | claude-haiku-5.5 | medium |
| 3 | claude-opus-5.5 | medium | claude-haiku-5.5 | medium | claude-fable-5.1 | low | claude-haiku-5.5 | high |
| 4 | claude-fable-5.1 | low | claude-haiku-5.5 | high | claude-fable-5.1 | medium | claude-sonnet-5.5 | medium |
