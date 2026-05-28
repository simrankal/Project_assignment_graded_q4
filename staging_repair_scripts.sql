-- =========================================
-- CREATE STAGING TABLE
-- =========================================

CREATE TABLE submissions_staging AS
SELECT *
FROM submissions;

-- =========================================
-- REPAIR 1: NEGATIVE SCORES
-- =========================================

-- BEFORE

SELECT
submission_id,
score
FROM submissions_staging
WHERE score < 0;

-- REPAIR

UPDATE submissions_staging
SET score = 0
WHERE score < 0;

-- AFTER

SELECT
submission_id,
score
FROM submissions_staging
WHERE score < 0;

-- =========================================
-- REPAIR 2: INVALID DIFFICULTY VALUES
-- =========================================

CREATE TABLE problems_staging AS
SELECT *
FROM problems;

-- BEFORE

SELECT
problem_id,
difficulty
FROM problems_staging
WHERE difficulty = 'Intermediate';

-- REPAIR

UPDATE problems_staging
SET difficulty = 'Medium'
WHERE difficulty = 'Intermediate';

-- AFTER

SELECT
problem_id,
difficulty
FROM problems_staging
WHERE difficulty = 'Intermediate';

-- =========================================
-- REPAIR 3: DUPLICATE ENROLLMENTS
-- =========================================

CREATE TABLE enrollments_staging AS
SELECT DISTINCT *
FROM enrollments;

-- BEFORE

SELECT
student_id,
course_id,
COUNT(*) AS duplicates
FROM enrollments_staging
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- REPAIR

DELETE e1
FROM enrollments_staging e1
JOIN enrollments_staging e2
ON e1.student_id = e2.student_id
AND e1.course_id = e2.course_id
AND e1.row_id > e2.row_id;

-- AFTER

SELECT
student_id,
course_id,
COUNT(*) AS duplicates
FROM enrollments_staging
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;
