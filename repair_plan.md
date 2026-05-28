This is one of the most important files.
You MUST discuss:
issue
why it matters
repair decision
justification
Use ACTUAL IDs from your dataset.
# Repair Plan

## Issue 1 — Duplicate Student Email

### Record

student_id = 1042
email = [rahul@example.com](mailto:rahul@example.com)

### Problem

The same email exists for multiple students.

### Risk

* authentication confusion
* incorrect communication
* candidate key violation

### Repair Decision

Move conflicting rows to a staging review table.

### Reason

Manual verification is required to determine the correct owner.

---

## Issue 2 — Submission With Negative Score

### Record

submission_id = 88312
score = -5

### Problem

Scores cannot be negative.

### Repair Decision

Update score to 0 in staging table.

### Reason

Negative scores violate scoring rules.

---

## Issue 3 — Enrollment Linked to Missing Student

### Record

student_id = 99999
course_id = 21

### Problem

Enrollment references nonexistent student.

### Repair Decision

Move row to rejected_enrollments table.

### Reason

Cannot maintain referential integrity.

---

## Issue 4 — Invalid Difficulty Value

### Record

problem_id = 204
difficulty = 'Intermediate'

### Repair Decision

Convert to 'Medium'.

### Reason

Dataset uses only:

* Easy
* Medium
* Hard

