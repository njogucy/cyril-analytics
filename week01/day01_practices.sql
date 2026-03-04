--verifying entries--
SELECT * FROM students;

--list the student scores--
SELECT name, score FROM students;

--renameing columns with AS--
SELECT 
name AS student_name,
score AS exam_score,
county AS home_county
FROM students;

--filtering rows with WHERE--
--show only students from Nairobi--
SELECT * FROM students WHERE county= 'Nairobi';
--show only students who scored above 80--
SELECT name, score FROM students WHERE score >80;
--show students in year 3--
SELECT name, year FROM students WHERE year = 3;

--combining conditions with AND/OR--
--AND(Both Conditions Must be True)--
--students from nairobi who scored above 70--
SELECT name, county, score
FROM students
WHERE county = 'Nairobi' AND score >70;

--OR(Either Condition Can Be True)--
--students from nairobi or kisumu--
SELECT name,county
FROM students
WHERE county = 'Nairobi' OR county = 'Kisumu';

--IN(matching a list of values)--
--students from nairobi or kisumu or mombasa--
SELECT name, county
FROM students
WHERE county IN ('Nairobi', 'Kisumu', 'Mombasa');

--NOT IN excludes values--
--students not from nairobi--
SELECT name, county 
FROM students
WHERE county NOT IN ('Nairobi');

--BETWEEN checks if a value falls within a range--
--students who scored between 70 and 90--
SELECT name, score 
FROM students
WHERE score BETWEEN 70 AND 90;

--LIKE pattern matching--
--students whose name starts with A--
SELECT name FROM students WHERE name LIKE 'A%';

--students containing a course that contains 'science'--
SELECT name, course FROM students WHERE course LIKE '%science%';


--IS NULL and IS NOT NULL --
--find rows where score is missing--
SELECT * FROM students WHERE score IS NULL;

--find rows where score exists--
SELECT * FROM students WHERE score IS NOT NULL;

--ORDER BY sorting your results--
--all students sorted by score, highest first--
SELECT name, score
FROM students
ORDER BY score DESC;

--students from nairobi sorted alphabetically by names--
SELECT name, county
FROM students
  WHERE county = 'Nairobi'
ORDER BY name ASC;

--sort by county first, then by score within each county--
SELECT county, score
FROM students
ORDER BY county ASC, score DESC;


--LIMIT showing tom n rows--
--top 3 scoring students--
SELECT name, score 
FROM students
ORDER BY score DESC
LIMIT 3;


--aggregae functions--
SELECT 
COUNT (*) AS total_students,
AVG (score) AS average_score,
MAX (score) AS highest_score,
MIN (score) AS lowest_score
FROM students;

--group by ;summarising by category
--students from each county--
SELECT county,COUNT(*) AS total_students
  FROM students
  GROUP BY county;

--average score per course--
SELECT course, AVG (score) AS average_score
  FROM students
  GROUP BY course;

--Multiple aggregates per group--
SELECT 
  county,
  COUNT(*) AS total_students,
  AVG (score) AS avg_score,
  MAX (score) AS top_score,
  MIN (score) AS least_score
  FROM students
  GROUP BY county
  ORDER BY avg_score DESC;


--HAVING; filtering groups after GROUP BY-- 
--counties where more than one student is enrolled--
SELECT county,COUNT (*) AS total_students
  FROM students
  GROUP BY county
  HAVING total_students>1;

--combining where and having--
--among year 3 and 4 only show courses with an average score above 75--
SELECT 
course,
AVG(score) AS avg_score
FROM students
WHERE year in (3, 4)
GROUP BY course 
HAVING avg_score>75;








