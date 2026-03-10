--3.1 insert values into students table
insert into students (id, name, county, course, score, year)
values (15, 'Amina Hassan', 'Mombasa', 'Data Science', 88, 3);

--3.2 insert 3 new students then verify
insert into students (id, name, county, course, score, year) values
(16, 'Faith Wwende', 'Nairobi', 'Data Science', 85, 2),
(17, 'George Oloo', 'Kisumu', 'Mathematics', 72, 3),
(18, 'Hannah Njeri', 'Mombasa', 'Computer Science', 91, 1);
select * from students;

--3.3give all computer science students 5 bonus points
update students set score = score + 5 where course= 'Computer Science';

--3.4 update all year 4 students; add 3 bonus points
update students set score = score + 3 where year = 4;
select * from students;

--3.5 show each student's score and their course average side by side
select name, course, score,
round(avg(score) over (partition by course), 1) as course_avg,
round(score-avg(score) over (partition by course), 1) as vs_avg
from students
order by course, score desc;

--3.6 show national leaderboard using dense_rank
select dense_rank() over (order by score desc) as rank,
name, course, county, score
from students
where is_deleted = 0
order by rank;

--3.7 create the score_audit trigger, update 3 students and check the log
create trigger log_score_change
after update on students
for each row 
when old.score != new.score
begin 
insert into score_audit (student_id, old_score, new_score)
values (old.id, old.score, new.score) ;
end;

update students set score = 97 where name = 'Grace Chebet';
update students set score = 85 where name = 'Brian Otieno';
update students set score = 79 where name = 'Henry Kamau';
select * from score_audit;

--using two CTEs find top scorer and bottom scorer per county
with top as (select county, max(score) as top_score from students group by county),
bottom as (SELECT county, MIN(score) as bottom_score from students group by county)
select t.county, t.top_score, b.bottom_score
from top t
inner join bottom b on t.county = b.county
order by t.top_score desc










