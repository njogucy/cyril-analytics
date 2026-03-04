-- Creating tables and inserting values --
--students table--
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name TEXT,
  county TEXT,
  course TEXT,
  score INTEGER,
  year INTEGER
);

--counties table--
CREATE TABLE counties (
  county TEXT PRIMARY KEY,
  region TEXT,
  population INTEGER
);

--Inserting values into the tables--
--inserting students values--
INSERT INTO students VALUES (1, 'Alice Wanjiru', 'Nairobi', 'Computer Science', 82, 3);
INSERT INTO students VALUES (2, 'Brian Atieno', 'Kisumu', 'Mathematics', 67,2);
INSERT INTO students VALUES (3, 'Carol Muthoni', 'Nairobi', 'Data Science', 91, 4);
INSERT INTO students VALUES (4, 'David Kipchoge', 'Nakuru', 'Computer Science', 74, 1);
INSERT INTO students VALUES (5, 'Eve Achieng', 'Mombasa', 'Mathematics', 88, 3);
INSERT INTO students VALUES (6, 'Frank Mwangi', 'Nairobi', 'Data Science', 55, 2);
INSERT INTO students VALUES (7, 'Grace Chebet', 'Eldoret', 'Computer Science', 95, 4);
INSERT INTO students VALUES (8, 'Henry Kamau', 'Nairobi', 'Mathematics', 62,3);
INSERT INTO students VALUES (9, 'Irene Wairimu', 'Kisumu', 'Data Science', 78, 1);
INSERT INTO students VALUES (10, 'James Mutua', 'Mombasa', 'Computer Science', 84,2);

--inserting counties values--
INSERT INTO counties VALUES ('Nairobi', 'Crentral', 4397073);
INSERT INTO counties VALUES ('Kisumu', 'Nyanza', 1155574);
INSERT INTO counties VALUES ('Mombasa', 'Coast', 1208333);
INSERT INTO counties VALUES ('Nakuru', 'Rift Valley', 2162202);
INSERT INTO counties VALUES ('Eldoret', 'Rift Valley', 1163186);







