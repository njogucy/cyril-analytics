-- part 1: Course performance rating
WITH course_stats AS (
SELECT course, COUNT(*) AS enrolled, AVG(score) AS avg_score, MAX(score) AS top_score
FROM students
GROUP BY course
)
SELECT
course, enrolled, avg_score, top_score,
CASE
WHEN avg_score >= 80 THEN 'Excellent'
WHEN avg_score >= 70 THEN 'Good'
ELSE 'Review Needed'
END AS performance_rating
FROM course_stats
ORDER BY avg_score DESC;

--part 2: county enrollment analysis with regions

SELECT c.county, c.region,
COUNT(s.id) AS enrolled,
ROUND(AVG(s.score), 1) AS avg_score,
MAX(s.score) AS top_score,
MIN(s.score) AS lowest_score
FROM counties c
INNER JOIN students s ON c.county = s.county
GROUP BY c.county, c.region
ORDER BY avg_score DESC;

--part 3: Above Average students per course

SELECT
s.name, s.course, s.score,
ROUND(s.score - (
SELECT AVG(s2.score) FROM students s2 WHERE s2.course = s.course
), 1) AS above_course_avg
FROM students s
WHERE s.score > (
SELECT AVG(s2.score) + 10 FROM students s2 WHERE s2.course = s.course
)
ORDER BY above_course_avg DESC;




