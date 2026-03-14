#Part 1
#create a list of 10 student dictionaries
students = [
    {'name': 'John Kagoha', 'county': 'Kisumu', 'course': 'Civil Engineering', 'score': 82, 'year': 2},
    {'name': 'Mark Gitau', 'county': 'Nakuru', 'course': 'Mathematics', 'score': 67, 'year': 4},
    {'name': 'Mercy Wamucii', 'county': 'Nairobi', 'course':'Medicine', 'score': 90, 'year': 3},
    {'name': 'Adrian Eliud', 'county': 'Bungoma', 'course': 'Computer Science', 'score': 85, 'year': 1},
    {'name': 'Essie Wanjiru', 'county': 'Nairobi', 'course': 'Mathematics', 'score': 57, 'year': 2},
    {'name': 'Tyrell Maina', 'county': 'Bungoma', 'course': 'Civil Engineering', 'score': 84, 'year': 4},
    {'name': 'Kate Kiamba', 'county': 'Nakuru', 'course': 'Mathematics', 'score': 76, 'year': 2},
    {'name': 'Emmanuel Noel', 'county': 'Kisumu', 'course': 'Computer Science', 'score': 87, 'year': 1},
    {'name': 'Wendy Kiama', 'county': 'Nairobi', 'course': 'Mathematics', 'score': 67, 'year': 3},
    {'name': 'Grace Chebet', 'county': 'Nakuru', 'course': 'Medicine', 'score': 78, 'year': 1},
 ]
#print total no of students
print (f'Total Students:{len(students)}')

#print first and last stude
print (students[0])
print (students[-1])

#part 2
#write four functions
#get grade function
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
 
#average score function
def average_score(student_list):
 total = 0
 for student in student_list:
  total = total + student['score']
 return total/len(student_list)

#top student function
def top_student(student_list):
 top = {}
 for s in student_list:
  if s['score'] == max('score'):
   top.append(s['name'])
 return top
 

#filter by year function
def group_by_year(student_list):
 groups = {}
 for s in student_list:
  year = s['year']
  if year not in groups:
   groups[year] = []
  groups[year].append(s['name'])
 return groups

result = group_by_year(students)
for year, names in result.items():
 print(f'Year{year}:{names}')

 #print a full report
 def print_report(student_list):
  for s in student_list:
   grade = get_grade(s['score'])
   print (f"{s['name']:<18} | {s['county']:<8} | {s['score']} | {grade}")

#print the overall average
print(average_score(students))

#print top student's name and score
print(f'Top student:'); top_student(students)

#print all year 3 students
result = group_by_year(students)
for year, names in result.items():
 if year == 3:
  print(f'Year{year}:{names}')

#print a county count showing how many students are from each county
counts = {}
for s in students:
 county = s['county'] 
 if county in counts:
  counts[county] = counts[county] + 1
 else:
  counts[county] = 1

for county, count in counts.items():
 print (f'{county}: {count} students') 