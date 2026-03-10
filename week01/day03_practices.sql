--INSERT INTO
--name colums explicitly so that order doesn't matter
INSERT INTO students (id, name, county, course, score,year) 
VALUES(11,'Lana Njoki', 'Nairobi', 'Data Science', 88, 2);

--Multiple rows at once 
INSERT INTO students (id, name, county, course, score, year) VALUES
(12, 'Mark Ouma', 'Kisumu', 'Mathematics', 71, 3),
(13, 'Naomi Waweru', 'Nakuru', 'Computer Science', 86, 2),
(14, 'Paul Kibet', 'Eldoret', 'Data Science', 93,4);

--UPDATE
--one students score
UPDATE students SET score = 90 WHERE id = 1;

--multiple columns at once
UPDATE students SET score = 90, year = 4 WHERE id = 1;

--Safe practice, always SELECT first to see what will be affected
Select * from students where county = 'Nairobi'
--then run the update 
UPDATE students SET score = score + 5 WHERE county = 'Nairobi';

-- delete one student
DELETE FROM students WHERE id = 1;

--delete all students who scored below 60
DELETE FROM students WHERE score < 60;

--DANGER: delete all rows
DELETE FROM students; -- never run without WHERE

--Soft deletion and triggers
--soft deletion
--Add a soft delete column 
ALTER TABLE students ADD COLUMN is_deleted INTEGER DEFAULT 0;

--soft delete a student
UPDATE students SET is_deleted = 1 WHERE id = 6;

--now all queries filter out soft deleted columns 
SELECT * FROM students WHERE is_deleted = 0;

--you can always reverse it 
UPDATE students SET is_deleted = 0 WHERE id = 6;

--create audit log table
CREATE TABLE score_audit (
  id INTEGER PRIMARY KEY,
  student_id integer,
  old_score integer,
  new_score integer,
  changed_at text default [datetime('now')]
);

--create trigger:ffires after every score chaNGE
create trigger log_score_change
AFTER update on students
for each row 
when old.score != new.score
begin 
insert into score_audit (student_id, old_score, new_score)
values (old.id, old.score, new.score) ;
end;

--test it 
update students set score = 99 where id = 1;
select * from score_audit;


--Window Functions
--normal aggregate: collapses to one row per course
select course, AVG(score) as avg_score
FROM students group by course;

--Window function: keepss all rows, adds avg column
select name, course, score,
avg(score) over (partition by course) as course_avg
from students;

--ROW_NUMBER, RANK,DENSE_RANK
select name, score,
row_number() over (order by score desc) as row_num,
rank() over (order by score desc) as rnk,
dense_rank() over (order by score desc) as dense_rnk
from students;

--LEAD and LAG
select name, score,
lag(score) over (order by score desc) as score_above,
lead(score) over (order by score desc) as score_below
from students;