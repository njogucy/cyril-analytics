--create a view called active_students showing name, course and score for all non deleted students
create view active_students as 
select name, course, score
from students
where is_deleted = 0;

--the view top_students already exists.query all students from it where course is DS
select * from top_students
where course = 'DS';

--remove the view top_students
drop view top_students;

--create an index idx_score
create index idx_score on students(score)

--create a view called nairobi_students showing name and score and non-deleted students
create view nairobi_students as 
select name, score, county
from students
where is_deleted = 0 and county = 'Nairobi';

--create a view called students_regions that shows students name, score and region
create view students_regions as 
select s.name, s.score, c.region
from students s
inner join counties c on s.county = c.county
where is_deleted = 0;

--create an index on students county and write a join that benefits from it
create index idx_students_county on students(county);

select s.name, s.score, c.region
from students s
inner join counties c on s.county = c.county
where is_deleted = 0;



















