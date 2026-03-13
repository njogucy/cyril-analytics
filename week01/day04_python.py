#Assigning values to variables
name = 'Alice Wanjiru'
score = 82
year = 3
average = 77.6
is_passing = True

#Using Variables
print (name)
print (score)
print (year)

#strings operations
county = 'nairobi'

#make uppercase or title case
print (county.upper())
print (county.title())

#check if a string contains something
course = 'Computer Science'
print ('Science' in course)
print ('Math' in course)

#f-string-insert variable values directly into text
name = 'Grace Chebet'
score = 95
print (f'{name} scored {score} points')
print (f'The average is {77.6:.1f}')

#arithmetic operations
a = 91
b = 82

print (a + b)
print (a - b)
print (a * 2)
print (a / 2)
print (a // 2)
print (a % 10)
print (a ** 2)

#calculating an average
total = 56+43+56+92+82
count = 5
average = total/count
print (f'Average:{average:.2f}')

#lists
#lists of student names
names = ['Alice Wanjiru', 'Brian Otieno', 'Carol Muthoni', 'David Kipchoge']

#a list of scores
scores = [82, 67, 91, 74, 88, 55, 95, 62, 78, 84]

#access items by index(counting starts at 0)
print (names[0]) #first item
print (names[1])
print (names[-1]) #last item

#length of a list
print (len(scores))

#add an item to the end
names.append('Eve Achieng')
print (len(names))

#for loop
scores = [82, 67, 91, 74, 88, 55, 95, 62, 78, 84]

#print each score
for score in scores:
 print (score) 

#processing students data with conditions
students = [
['Alice WWanjiru', 82],
['Brian Otieno', 67],
['Carol Muthoni', 91],
['Grace Chebet', 95],
]

#print a formatted summary for each student
for student in students:
 name = student [0]  #first item in each inner list
score = student [1]  #second item
if score >= 80:
 grade = 'B or above'
else: 
 grade = 'Below B'
print (f'{name}: {score} == {grade}')

#calculating stats with loop
score = [82, 67, 91, 74, 88, 55, 95, 62, 78, 84]

#calculate total and average manually
total = 0
for score in scores:
 total = total + score

average = total / len(scores)
print (f'Total: {total}')
print (f'Average: {average:.1f}')
print (f'Count: {len(scores)}')

#python's built in functions do this in one line
print (sum(scores))
print (max(scores))
print (min(scores))
