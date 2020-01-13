-- SQL Requests

-- which teacher is teaching in which class
SELECT firstname, lastname, class_name 
FROM teacher
INNER JOIN class ON fk_class = class_ID;

-- all students in the class 1 A
SELECT firstname, lastname, class_name 
FROM student 
JOIN class ON fk_class = class_ID 
WHERE class_name = "1 A";

-- all students in the class 2 A
SELECT firstname, lastname, class_name 
FROM student 
JOIN class ON fk_class = class_ID 
WHERE class_name = "2 A";

-- all students in the class with the ID 1
SELECT firstname, lastname, class_name 
FROM student JOIN class ON fk_class = class_ID 
WHERE class_ID = 1;

