# Before and After Repair Evidence

---

## Repair 1 — Negative Scores

### Before

| submission_id | score |
| ------------- | ----- |
| 88312         | -5    |

### Repair Action

Updated negative scores to 0.

### After

| submission_id | score |
| ------------- | ----- |
| 88312         | 0     |

---

## Repair 2 — Invalid Difficulty

### Before

| problem_id | difficulty   |
| ---------- | ------------ |
| 204        | Intermediate |

### Repair Action

Mapped Intermediate → Medium.

### After

| problem_id | difficulty |
| ---------- | ---------- |
| 204        | Medium     |
