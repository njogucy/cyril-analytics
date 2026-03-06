-- Subqueries--

--subquery in WHERE--
--students who scored above the overall average--
SELECT name,score
FROM students
WHERE score> (SELECT AVG(score) FROM students);

--students from the county with the most students
SELECT name,county 
FROM students 
WHERE county =(
  SELECT county
  FROM students
  GROUP BY county
  ORDER BY COUNT(*) DESC
);

--subquery with IN--
--find all students from rift valley region--
SELECT name, county, score
FROM students
WHERE county IN (
  SELECT county FROM counties
  WHERE region= 'Rift Valley'
);

--subquery in FROM--
--calculate average per course, then filter those averages--
SELECT course,average_score
FROM (
  SELECT course, AVG(score) AS average_score
  FROM students
  GROUP BY course
) AS course_summary
WHERE average_score >75;

--CTEs--
--simple CTE-one step--
--rewriting 'the subquery in from' using CTE--
WITH course_summary AS (
  SELECT course, AVG (score) AS average_score
  FROM students
  GROUP BY course
)
SELECT course, average_score 
FROM course_summary
WHERE average_score > 75;

--multiple CTEs- chaining steps--
--Step1: find which county has the most students--
--Step2: get all students from that county--
--Step3: find the top scorer from those students--
WITH top_county AS (
  SELECT county
  FROM students
  GROUP BY county
  ORDER BY COUNT(*) DESC
  LIMIT 1
),
county_students AS (
  SELECT s.*
  FROM students s
  INNER JOIN top_county tc ON s.county = tc.county
)
SELECT name, county, score
FROM county_students
ORDER BY score DESC
LIMIT 1;

--INNER JOIN--
--show each student with their county's region--
SELECT s.name, s.score, c.region, c.population
FROM students s
INNER JOIN counties c ON s.county = c.county
ORDER BY s.score DESC;

--LEFT JOIN--
--INNER JOIN: Garissa will not appear (no student has county=Garissa)
SELECT c.county,s.name
FROM counties c
INNER JOIN students s ON c.county = s.county;

--LEFT JOIN: Garissa will appear with NULL in the name column
-- LEFT JOIN: all counties including those with no students
SELECT c.county, s.name
FROM counties c
LEFT JOIN students s ON c.county = s.county;

--find counties with no students enrolled--
SELECT  c.county, c.region, s.name, s.score
FROM counties c
LEFT JOIN students s ON c.county = s.county
WHERE s.name IS NULL;

--JOIN with GROUP BY--
--Average student score per region--
SELECT c.region, COUNT(*) AS students, AVG(s.score) AS average_score
FROM students s
INNER JOIN counties c ON s.county = c.county
GROUP BY c.region
ORDER BY average_score DESC;

--Regions where the average score is above 75, with atleast 2 students--
SELECT c.region, COUNT(*) AS students, AVG(s.score) AS average_score
FROM students s
INNER JOIN counties c ON s.county = c.county
GROUP BY c.region
HAVING average_score > 75 AND students >= 2
ORDER BY average_score DESC;