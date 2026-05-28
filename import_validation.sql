-- =========================================
-- ROW COUNT VALIDATION
-- =========================================

-- Count rows in students table
SELECT COUNT(*) AS total_students
FROM students;

-- Count rows in courses table
SELECT COUNT(*) AS total_courses
FROM courses;

-- Count rows in submissions table
SELECT COUNT(*) AS total_submissions
FROM submissions;

-- =========================================
-- DISTINCT PRIMARY KEY VALIDATION
-- =========================================

SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT student_id) AS distinct_student_ids
FROM students;

SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT submission_id) AS distinct_submission_ids
FROM submissions;

-- =========================================
-- NULL / BLANK CHECKS
-- =========================================

SELECT COUNT(*) AS missing_emails
FROM students
WHERE email IS NULL
OR TRIM(email) = '';

SELECT COUNT(*) AS missing_problem_titles
FROM problems
WHERE problem_title IS NULL
OR TRIM(problem_title) = '';

-- =========================================
-- EMPTY TABLE CHECKS
-- =========================================

SELECT 'attendance' AS table_name,
COUNT(*) AS row_count
FROM attendance;

SELECT 'regrade_requests' AS table_name,
COUNT(*) AS row_count
FROM regrade_requests;
