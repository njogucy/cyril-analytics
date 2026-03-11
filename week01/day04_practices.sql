--VIEWS AND INDEXES
--create a view that shows student leaderboard
create view students_leaderboard as
select name, course, county, score,
dense_rank() over (order by score desc) as national_rank
from students
where is_deleted = 0
order by national_rank;

--run the full leaderboard query auto
select * from students_leaderboard;

--you can add where, order by, limit on top of a view
select *  from students_leaderboard
where course = 'Computer Science';

--views work in joins too
select sl.name, sl.score, sl.national_rank, c.region
from students_leaderboard sl 
inner join counties c on sl.county = c.county;

--remove a view
drop view students_leaderboard;

--replacing a view(in databases like postgresql and mysql:sqlite doesnt support)
create or replace view students_leaderboard as
select name, course, score,
dense_rank () over (order by score desc) as rank
from students where is_deleted = 0;

--indexes
--create an index on the county column
create index idx_students_county on students(county);

--create an index on score
create index idx_students_score on students(score);

--composite index on multiple columns
create index idx_students_course_year on students(score, year);

--see what indexes exists on a table
pragma index_lists (students);

--remove an index
drop index idx_students_county;














