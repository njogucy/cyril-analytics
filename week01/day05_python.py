#DICTIONARIES:Storing data with labels
#a dictionary storing a student's values
student = {
'name': 'Alice Wanjiru',
'county': 'Nairobi',
'course': 'Computer Science',
'score': 82,
'year': 4
}

#access values by key name
print (student['name'])
print (student['score'])
print (student['course'])

#add a new key
student['grade']='B'
print (student['grade'])

#update an existing key
student['score']= 85
print (student['score'])

#remove a key
del student['grade']

#check if a key exists
'name' in student
'grade' in student

#get all keys, all values, all pairs
print (student.keys())
print (student.values())
print (student.items())

#loop through keys and values together
for key, value in student.items():
 print (f'{key}:{value}')

#a list of dictionaries--like a table
students = [
{'name': 'Alice Wanjiru', 'county': 'Nairobi', 'score': 82},
{'name': 'Brian Otieno', 'county': 'Kisumu', 'score': 67},
{'name': 'Carol Muthoni', 'county': 'Nairobi', 'score': 91},
{'name': 'Grace Chebet', 'county': 'Eldoret', 'score': 95},
]

#loop through and access each record
for student in students:
 print (f"{student['name']} from {student['county']}: {student['score']}")

#FUNCIONS:Reusable blocks of code
#define a function
def greet ():
 print ('Hello from the function')
 print ('This runs every time you call greet ()')

#call the function
greet ()

#function with one parameter
def greet_student (name):
 print (f'Hello, {name}!')

greet_student('Alice')
greet_student('Brian')
greet_student('Cyril')

#functions with multiple parameters
def describe_student(name, score):
 print (f'{name} scored {score} points')

describe_student('Alice', 82)
describe_student('Grace',95)

#return values
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

#the return value can be stored or used directly
grade = get_grade(82)
print (grade)
print (get_grade(95))
print (get_grade(55))

#use in a loop
scores = [82, 67, 91, 74, 55]
for score in scores:
 print (f'{score} -> {get_grade(score)}')

#default parameter values
def describe_student(name, score, year = 1):
 print (f'Year {year} | {name}: {score}')

describe_student('Alice', 82, 3)
describe_student('Brian', 67)

#combining dictionaries, lists, and functions
students = [
{'name': 'Alice Wanjiru', 'county': 'Nairobi', 'score': 82, 'year': 3},
{'name': 'Brian Otieno', 'county': 'Kisumu', 'score': 67, 'year': 2},
{'name': 'Carol Muthoni', 'county': 'Nairobi', 'score': 91, 'year': 4},
{'name': 'David Kipchoge', 'county': 'Nakuru', 'score': 74, 'year': 1},
{'name': 'Eve Achieng', 'county': 'Mombasa', 'score': 88, 'year': 3},
{'name': 'Frank Mwangi', 'county': 'Nairobi', 'score': 55, 'year': 2},
{'name': 'Grace Chebet', 'county': 'Eldoret', 'score': 95, 'year': 4},
{'name': 'Henry Kamau', 'county': 'Nairobi', 'score': 62, 'year': 3},
]

#function to calculate average score
def average_score(student_list):
 total = 0
 for student in student_list:
  total = total + student['score']
 return total / len(student_list)

#function to filter by county
def get_by_county(student_list, county):
 result = []
 for student in student_list:
  if student['county'] == county:
    result.append(student)
 return result

#function to print a report
def print_report(student_list):
 for s in student_list:
  grade = get_grade(s['score'])
  print (f"{s['name']:<18} | {s['county']:<8} | {s['score']} | {grade}")

#use all three together
avg = average_score(students)
print(f'Overall average: {avg:.1f}')

nairobi = get_by_county(students, 'Nairobi')
print (f'\nNairobi students ({len(nairobi)}):')
print_report(nairobi)
