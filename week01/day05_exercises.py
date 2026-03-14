#print score from a student dictionary
student = {'name': 'Alice', 'score': 82}
print (student['score'])

#add a grade key to a student dictionary
student['grade']= 'B'
print (student['grade'])

#print every key and value in the student dictionary
for key,value in student.items():
    print (f'{key}:{value}')

#define a function
def say_hello():
    print('Hello')

#write a function thar returns double a number *****
def double(x):
 return x*2
print (double(2))
print (double(82))

#define a get_grade function
def get_grade(score):
   if score >= 80:
      return 'B or above'
   else:
      return 'Below B'
print (get_grade(82))
print (get_grade(56))

#a function tha t returns highest score from a list of dictionaries
def top_score(students):
   scores = []
   for s in students:
    scores.append(s['score'])
   return max(scores) 

data = [{'name': 'Alice', 'score': 82}, {'name': 'Grace', 'score': 95}]
print (top_score(data))

#a function that returns only students with score above a threshold
def filter_students(students, threshold):
   result = []
   for s in students:
      if s['score'] > threshold:
       result.append(s['name'])
   return result

print(filter_students(data, 85))

#count students per county using a dictionary
students = [
   {'name': 'Alice', 'county': 'Nairobi'},
   {'name': 'Brian', 'county': 'Kisumu'},
   {'name': 'Carol', 'county': 'Nairobi'},
   {'name': 'David', 'county': 'Nakuru'},
   {'name': 'Eve', 'county': 'Nairobi'},
]

counts = {}
for s in students:
   county = s['county']
   if county in counts:
      counts[county] = counts[county] + 1
   else:
      counts[county] = 1

for county, count in counts.items():
   print (f'{county}: {count} students')

#function that returns a full student summary
def student_summary(student):
   grade = get_grade(student['score'])
   return f"{student['name']} | {student['county']} | Score: {student['score']} | Grade: {grade}"

students = [
   {'name': 'Alice Wanjiru', 'county': 'Nairobi', 'score': 82},
   {'name': 'Grace Chebet', 'county': 'Eldoret', 'score': 95},
   {'name': 'Frank Mwangi', 'county': 'Nairobi', 'score': 55},
]

for s in students:
   print (student_summary(s))

#function that groups students by county
def group_by_county(student_list):
   groups = {}
   for s in student_list:
      county = s['county']
      if county not in groups:
         groups[county] = []
      groups[county].append(s['name'])
   return groups  

result = group_by_county(students)
for county, names in result.items():
 print(f'{county}: {names}')