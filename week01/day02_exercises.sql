--2.1:Find all students who scored above the average score of computer science students specifically--

SELECT name, score, course
FROM students
WHERE score > (
  SELECT AVG(score)
  FROM students
  WHERE course = 'Computer Science'
);

--2.2:find all students from counties with a population over 2 million.--
--my answer--
SELECT s.name, s.county, c.population
FROM students s
  INNER JOIN counties c ON c.county = s.county
WHERE c.population > 2000000
;
--was supposed to subquery--
SELECT name, county, score 
  FROM students
  WHERE county IN (
  SELECT county FROM counties
  WHERE population > 2000000
  );

--2.3:using a CTE, calculate the average score per course. Then show only courses where the average is between 70 and 85--
WITH course_summary AS (
  SELECT course, AVG(score) AS average_score
  FROM students
  GROUP BY course   --**
)
SELECT course, average_score
FROM course_summary
WHERE average_score BETWEEN 70 AND 85;

--2.4:Show each students name, score,and the region their county belongs to--
--my answer
SELECT s.name, s.score, s.county, c.region
FROM students s
INNER JOIN counties c ON s.county = c.county;

--2.5:Show each region and how many students come from it--
SELECT c.region, COUNT (*) AS students
FROM students s
INNER JOIN counties c ON s.county = c.county
GROUP BY c.region;

--2.6: use a left join to show all counties including those with no students. For counties with no students show 0 as the count
SELECT c.county, COUNT(s.id) AS students
FROM counties c
LEFT JOIN students s ON c.county = s.county
GROUP BY c.county 
ORDER BY students;

--2.7: using a cte and a join,show the average score per region
WITH student_regions AS (
  SELECT s.score, c.region
  FROM students s
  INNER JOIN counties c ON s.county = c.county
)
SELECT region, AVG(score) AS average_score
FROM student_regions
GROUP BY region
ORDER BY average_score DESC;

--2.8: find the top student from each region(highest score per region)
SELECT s.name, MAX(s.score) AS top_score, c.region
FROM students s
INNER JOIN counties c ON s.county = c.county
GROUP BY c.region
ORDER BY top_score DESC;

--2.9: using a subquery find all students who scored above the average of their own county 
SELECT s.name, s.score, s.county
  FROM students s
WHERE s.score > (
  SELECT AVG (s2.score)
FROM students s2
  WHERE s2.county = s.county
  );

--using two ctes first find per course stats, then show only courses rated 'exelent' or 'review needed'
WITH course_stats AS (
SELECT course, COUNT(*) AS enrolled, AVG(score) AS avg_score
FROM students
GROUP BY course
),
course_rated AS (
SELECT course, enrolled, avg_score,
CASE
WHEN avg_score >= 80 THEN 'Excellent'
WHEN avg_score >= 70 THEN 'Good'
ELSE 'Review Needed'
END AS rating
FROM course_stats
)
SELECT * FROM course_rated
WHERE rating != 'Good';





