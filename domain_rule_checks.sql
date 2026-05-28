-- =========================================
-- NEGATIVE SCORES
-- =========================================

SELECT
submission_id,
score
FROM submissions
WHERE score < 0;

-- =========================================
-- SCORES ABOVE MAXIMUM
-- =========================================

SELECT
submission_id,
score
FROM submissions
WHERE score > 100;

-- =========================================
-- INVALID DIFFICULTY VALUES
-- =========================================

SELECT
problem_id,
difficulty
FROM problems
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- =========================================
-- INVALID SUBMISSION STATUS
-- =========================================

SELECT
submission_id,
status
FROM submissions
WHERE status NOT IN
(
'successful',
'failed',
'pending',
'runtime_error',
'compilation_error'
);

-- =========================================
-- INVALID LANGUAGE VALUES
-- =========================================

SELECT
submission_id,
language
FROM submissions
WHERE language NOT IN
(
'Python',
'Java',
'C++',
'JavaScript'
);

-- =========================================
-- INVALID ATTENDANCE STATUS
-- =========================================

SELECT
attendance_id,
attendance_status
FROM attendance
WHERE attendance_status NOT IN
(
'present',
'absent',
'late'
);

-- =========================================
-- END TIME BEFORE START TIME
-- =========================================

SELECT
session_id,
start_time,
end_time
FROM sessions
WHERE end_time < start_time;

-- =========================================
-- RESOLVED TIME BEFORE REQUEST TIME
-- =========================================

SELECT
request_id,
requested_at,
resolved_at
FROM regrade_requests
WHERE resolved_at < requested_at;

-- =========================================
-- SUBMISSION BEFORE ENROLLMENT
-- =========================================

SELECT
s.submission_id,
s.student_id,
s.submitted_at,
e.enrollment_date
FROM submissions s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE s.submitted_at < e.enrollment_date;
