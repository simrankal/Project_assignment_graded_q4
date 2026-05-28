-- =========================================
-- DUPLICATE PRIMARY KEY CHECKS
-- =========================================

SELECT
student_id,
COUNT(*) AS duplicate_count
FROM students
GROUP BY student_id
HAVING COUNT(*) > 1;

-- =========================================
-- DUPLICATE EMAIL CHECKS
-- =========================================

SELECT
email,
COUNT(*) AS duplicate_count
FROM students
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1;

-- =========================================
-- DUPLICATE ENROLLMENTS
-- =========================================

SELECT
student_id,
course_id,
COUNT(*) AS duplicate_count
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- =========================================
-- FOREIGN KEY AUDITS
-- =========================================

-- Students linked to missing batches

SELECT
s.student_id,
s.batch_id
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id
WHERE b.batch_id IS NULL;

-- =========================================

-- Enrollments linked to missing students

SELECT
e.student_id,
e.course_id
FROM enrollments e
LEFT JOIN students s
ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

-- =========================================

-- Test results linked to missing submissions

SELECT
tr.test_result_id,
tr.submission_id
FROM test_results tr
LEFT JOIN submissions s
ON tr.submission_id = s.submission_id
WHERE s.submission_id IS NULL;

-- =========================================

-- Attendance linked to missing sessions

SELECT
a.attendance_id,
a.session_id
FROM attendance a
LEFT JOIN sessions s
ON a.session_id = s.session_id
WHERE s.session_id IS NULL;
