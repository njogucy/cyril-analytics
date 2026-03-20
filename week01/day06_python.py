#connecting python to sql
import sqlite3
#Step 1:Connect to the database
conn = sqlite3.connect ('/home/njogu/cyril-analytics/week01/practice.db')
#step 2:create a cursor
cursor = conn.cursor()
#step3: execute a query
cursor.execute ('select name, score from students where is_deleted = 0')
#step 4:fetch all results
rows = cursor.fetchall()
#step 5:process results
for row in rows:
 print (row)
#step 6:close the connection
conn.close()

#processing rows
import sqlite3

conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')
cursor = conn.cursor()

#get all active students
cursor.execute('select name, county, score from students where is_deleted = 0 order by score desc')
rows = cursor.fetchall()

#process with unpacking-cleaner than using row[1], row[2]
print (f'Total students:{len(rows)}')
print ()
for name, county, score in rows:
 print(f'{name:<20} | {county:<10} | {score}')

conn.close()

#getting aggregate results
import sqlite3

conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')
cursor = conn.cursor()

cursor.execute('select count(*), avg(score), max(score), min(score) from students where is_deleted = 0')
row = cursor.fetchone()

count, avg, high, low = row
print (f'Students: {count}')
print (f'Average: {avg:.1f}')
print (f'Highest: {high}')
print (f'Lowest: {low}')

conn.close()

import sqlite3

conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')
cursor = conn.cursor()

cursor.execute('select*from students_leaderboard order by score desc')
rows = cursor.fetchall()
for row in rows:
 print(row)

conn.close()

#passing parameters safely
import sqlite3


conn = sqlite3.connect('/home/njogu/cyril-analytics/week01/practice.db')
cursor = conn.cursor()

county = 'Nairobi'
cursor.execute('select name, county, score from students where county = ? and is_deleted = 0', (county,))
rows = cursor.fetchall()
for name, county, score in rows:
 print (f'{county} | {name}: {score}') 

#multiple parameters
cursor.execute('select name, county, score from students where county = ? and score > ? and is_deleted = 0',('Nairobi',87))
rows = cursor.fetchall()
for name, county, score in rows:
 print (f'{county} | {name}: {score}')

#insert from python
new_student = ('John Mbadi', 'Mombasa', 'Computer Science', 84, 2)
cursor.execute ('insert into students(name, county, course, score, year) values (?,?,?,?,?)',new_student)
conn.commit()
#verify
cursor.execute('select name, score from students order by id desc limit 1')
print (cursor.fetchone())

#insert multiple students
new_students = [
('Irene Wairimu', 'Kisumu', 'Data Science', 78, 1),
('Kelvin Odhiambo', 'Nakuru', 'Mathematicts', 71, 2),
('Linda Njeri', 'Nairobi', 'Computer Science', 88, 3),
]

cursor.executemany('insert into students (name, county, course, score, year) values (?,?,?,?,?)',new_students)
conn.commit()
print (f'Inserted {cursor.rowcount} rows')

#update a score
cursor.execute('update students set score = ? where name = ?', (90, 'Alice Wanjiru'))
conn.commit()
print (f'Rows updated: {cursor.rowcount}')

#soft delete
cursor.execute('update students set is_deleted = 1 where name = ?', ('Frank Mwangi',))
conn.commit()

conn.close()

