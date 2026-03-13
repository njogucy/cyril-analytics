#create a list of student names and print the first name in the list
names = ['John Mark', 'Peter Mwaura', 'Steven Oluoch']
print (names[0])

#loop through a list of scores and print each one
scores = [95, 73, 64, 82, 54]
for score in scores:
 print (score)

#loop through a list of scores and prints the one above 80
scores = [95, 34, 65, 74, 93]
for score in scores:
 if score > 80:
  print (score)

#find the highest score in a list
scores = [93, 56, 73, 65, 83]
print (max(scores))

#calculate the average score
scores = [73, 82, 37, 62, 29]
total = 0
for score in scores:
 total = total + score
 average = total / len(scores)
 print ('Average:', average)

#count how many students scored above 75
scores = [82, 67, 91, 74, 88, 55, 95, 78, 84]

count = 0
for score in scores:
 if score > 75:
  count = count + 1

print ('Students above 75:', count)

#from the scores list, build a new list containing only scores above 80.Print new lists and its length
scores = [82, 67, 91, 74, 88, 55, 95, 62, 78, 84]
high_scores = []

for score in scores:
  if score > 80:
   high_scores.append(score)
print (high_scores)
print (len(high_scores))


