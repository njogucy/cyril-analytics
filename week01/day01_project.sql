--A manager asks for a full overview. Write a single query showing each student's name,course,county,score, and a grade letter. Sort by score descending

SELECT name, course, county, score,
CASE 
WHEN score >= 90 THEN 'A'
WHEN score >= 80 THEN 'B'
WHEN score >= 70 THEN 'C'
WHEN score >= 60 THEN 'D'
ELSE 'F'
END AS grade
FROM students
ORDER BY score DESC;


--show each county, how many students are enrolled, the average score, the top score, and the lowest score. Order by average score descending.
SELECT county, COUNT (*) AS enrolled_students,AVG (score) AS average_score, MAX (score) AS top_score, MIN (score) AS lowest_score
FROM students
GROUP BY county
ORDER BY average_score DESC;


--find all students who scored below the overall average and are in year 1 and year 2.show their name ,year,course,score, and how far below the average they are.
SELECT name, year, course, score , ROUND ((SELECT AVG (SCORE)FROM students)-score, 1)AS below_average_by
FROM students
WHERE score<(SELECT AVG (score)FROM students)
AND year IN (1, 2)
ORDER BY score ASC;


