--add 4 new students. add the is_deleted column. soft delete any student below 60
alter table students add column is_deleted integer default 0
insert into students (id, name, county, course, score, year, is_deleted) values
(19, 'Hussein Mohammed','Mombasa', 'Data Science',88, 3, 0),
(20, 'Peter Njiru','Nairobi', 'Mathematics',73, 2, 0),
(21, 'Fatuma Omar','Kisumu','Computer Science', 91, 4, 0),
(22, 'Moses Wekesa','Nakuru','Data Science', 62, 1, 0);
update students set is_deleted = 1 where score < 60;
select * from students where is_deleted = 0;

--DENSE_RANK leaderboard of active students: rank, name, course, county, score.
select dense_rank() over(order by score desc) as rank,
name, course, county, score
from students where is_deleted = 0
order by rank;

--ROW_NUMBER with PARTITION BY. Show top 2 per course. Only show those rows in the final outpu
with ranked as (
select name, course, score,
row_number() over (partition by course order by score desc) as rnk
from students where is_deleted = 0
)
select rnk, name, course, score from ranked where rnk <= 2 order by course, rnk;

--Create score_audit table and trigger. Update 5 students. Query log joined with student names.
create trigger log_score_change
after update on students
for each row 
when old.score != new.score
begin 
insert into score_audit (student_id, old_score, new_score)
values (old.id, old.score, new.score) ;
end;

update students set score = 97 where name = 'Grace Chebet';
update students set score = 85 where name = 'Brian Otieno';UPDATE students SET score = 79 WHERE name = 'Henry Kamau';
update students set score = 92 where name = 'Eve Achieng';
update students set score = 70 where name = 'David Kipchoge';
select st.name, a.old_score, a.new_score,
a.new_score - a.old_score AS change, a.changed_at
from score_audit a
inner join students st on a.student_id = st.id
order by a.changed_at;














