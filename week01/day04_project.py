scores = [85, 43, 75, 95, 74, 39, 67, 90, 87, 45]
for score in scores:
    if score >= 65:
        grade = 'Pass'
    else:
        grade = 'Fail'
  
#totals
total = 0
for score in scores:
 total = total+score
  
countpass = 0
for score in scores:
   if score > 65:
      countpass = countpass + 1

countfail = 0
for score in scores:
   if score < 65:
      countfail = countfail + 1

count = len(scores)

print (f'Total Students:{count}')
print (f'Passing Students:{countpass}')
print (f'Failing Students:{countfail}')

total = 0
for score in scores:
   total = total + score
   average = total/len(scores) 

print (f'Average:{average}')

students = [
   ('Mark Wambua', 85),
   ('Catherine Wanza', 43),
   ('Kennedy Kamau', 75),
   ('John Barraza', 95),
   ('Wasike Wesonga', 74),
   ('Ivy Kagoha', 39),
   ('Brandon Kigiri', 67),
   ('Mercy Shelmith', 90),
   ('Brenda Achieng', 87),
   ('Kelvin Ogutu', 45),
 ]

#average
scores = [score for name, score in students]
average = sum(scores) / len(scores)
print(f'Average: {average:.1f}')

#students above average
for name, score in students:
    if score > average:
        print(f'{name}: {score}')
