--show only the name and course of every student--
SELECT name, course
FROM students;

--show all students who are in year 1 or year 2--
SELECT name, year
FROM students 
WHERE year IN (1,2);

--show students whose score is between 60 and 80--
SELECT name, score
FROM students 
WHERE score BETWEEN 60 AND 80;

--show students whose name contains the letters 'iru'--
SELECT name
FROM students
WHERE name LIKE '%iru%';

--show any data science students from nairobi or kisumu who scored above 75--
SELECT *
FROM students
WHERE county IN ('Nairobi', 'Kisumu') AND score >75 AND course IN ('Data Science');

--show the top 5 students by score displaying only thein name and score--
SELECT name, score 
FROM students
ORDER BY score desc
LIMIT 5;

--average score of students from nairobi only--
SELECT county, AVG (score) AS average_score
FROM students
WHERE county ='Nairobi';

--show the highest and lowest score for each year of study--
SELECT year, MAX(score) as highest_score, MIN (score) AS lowest_score
FROM students
GROUP BY year;

--course with the highest average score--
SELECT course, AVG(score) AS average_score
FROM students
ORDER BY average_score DESC
LIMIT 1;

--show only counties where the average student score is above 75--
SELECT county ,AVG(score) AS average_score
FROM students
GROUP BY county
HAVING average_score>75;









