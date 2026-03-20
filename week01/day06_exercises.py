import sqlite3

conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')

cursor = conn.cursor()

#Exercise 1:Basic connection and query
#You have a SQLite database at /home/njogu/cyril-analytics/week01/practice.db containing a students table.Write a Python script that connects to the database, retrieves all active students (is_deleted = 0), and printseach student's name and score on a separate line

cursor.execute('select name, score from students where is_deleted = 0')
rows= cursor.fetchall()

for name, score in rows:
 print (f'{name}: {score}')

#Exercise 2:Aggregate Query
#Using the same database, write a script that prints a summary of the students table. The summary should show the total number of active students, the average score rounded to 1 decimal place, the highest score,and the lowest score. All in one query.

cursor.execute ('select count (*), avg(score), max(score), min(score) from students where is_deleted = 0')
rows = cursor.fetchone()

count, avg, max, min = rows
print (f'Students: {count}')
print (f'Average: {avg:.1f}')
print (f'Highest: {max}')
print (f'Lowest: {min}')

conn.close()
#Exercise 3:Parametised Query
#Write a function called get_students_by_county(conn, county) that takes an open connection and a county name, and returns a list of tuples containing the name and score of all active students from that county, ordered by score descending. Call the function twice — once for Nairobi and once for Kisumu — and print the results.

def get_students_by_county(conn, county):
 import sqlite3
 cursor = conn.cursor()
 cursor.execute('select name, score from students where county = ? and is_deleted = 0 order by score desc',(county,))
 return cursor.fetchall()

conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')

for label, county in [('Nairobi', 'Nairobi'), ('Kisumu', 'Kisumu')]:
 rows = get_students_by_county(conn, county)
 print (f'{label} students:')

 for name, score in rows:
  print (f'{name}: {score}')
  print ()

conn.close()

#Exercise 4:Insert and Verify
#Write a script that inserts three new students into the database using executemany(), commits the changes,then immediately queries and prints all students whose score is above 85, ordered by score descending. Thenewly inserted students should appear if they qualify.

import sqlite3
conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')

cursor = conn.cursor()

new_students = (
('Kelvin Wambua', 'Mombasa', 'Mathematics', 78, 3),
('Magdalene Wesonga', 'Nairobi', 'Computer Science', 86, 2),
('Catherine Wangeci', 'Nakuru', 'Data Science', 67, 1),
)

cursor.executemany('insert into students (name, county, course, score, year) values (?,?,?,?,?)',new_students)
conn.commit()

cursor.execute('select name, county, score from students where score > 85 and is_deleted = 0 order by score desc')
rows = cursor.fetchall()

for name, conty, score in rows:
 print (f'{name} | {county} | {score}')



#Exercise 6: Soft delete and verify
#Write a script that soft-deletes all students with a score below 60 (sets is_deleted = 1 for each one), commits the change, then prints a before and after count to confirm the operation worked.

cursor.execute('select count(*) from students where is_deleted = 0')
before = cursor.fetchone()[0]
print(f'Before: {before} active students')

cursor.execute('UPDATE students SET is_deleted = 1 where score < 60 and is_deleted = 0')
conn.commit()

print(f'Soft deleted {cursor.rowcount} student(s) with score below 60')

cursor.execute('select count(*) from students where is_deleted = 0')
after = cursor.fetchone()[0]
print(f'After: {after} active students')

conn.close()

#Exercise 7:Ranked Report With Python Logic
#Write a script that retrieves all active students ordered by score descending. For each student, assign a rank (1 = highest scorer), determine their grade using a Python function, and flag them as "Above average" or "Below average" based on the group average. Print a formatted table with all this information. Calculate the average in Python — do not use a second SQL query

def get_grade(score):
 if score >= 90:
  return 'A'
 elif score >= 80:
  return 'B'
 elif score >= 70:
  return 'C'
 elif score >= 60:
  return 'D'
 else:
  return 'F'

conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')
cursor = conn.cursor()

cursor.execute('select name, county, course, score from students where is_deleted = 0 order by score desc')
rows = cursor.fetchall()

scores = [r[3] for r in rows]
avg = sum(scores) / len(scores)
print(f'{"Rank"} | {"Name"} | {"County"} | {"Score"} | {"Grade"} | Standing')
print('-' * 70)

for rank, (name, county, course, score) in enumerate(rows, 1):
 grade = get_grade(score)
 standing = 'Above average' if score >= avg else 'Below average'

 print(f'{rank} | {name} | {county} | {score} | {grade} | {standing}')
print()
print(f'Group average: {avg}')

conn.close()