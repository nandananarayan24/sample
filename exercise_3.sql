insert into student values('smith','17','1','CS'),('brown','8','2','CS');
insert into course values('intro to computer science','CS1310','4','CS'),('data structures','CS3320','4','CS');
insert into course values('discrete mathematics','MATH2410','3','MATH'),('database','CS3380','3','CS');
insert into section values('85','MATH2410','fall','07','king'),('92','CS1310','fall','07','anderson'),('102','CS3320','spring','08','knuth'),
('112','MATh2410','fall','08','chang'),('119','CS1310','fall','08','anderson'),('135','CS3380','fall','08','stone');
INSERT INTO grade_report VALUES('17','112','B'),('17','119','C'),('8','85','C'),('8','92','A'),('8','102','B'),('8','135','A');
INSERT INTO prerequisite VALUES('CS3380','CS3320'),('CS3380','MATH2410'),('CS3320','CS1310');
--1
SELECT c.course_name,g.grade
FROM grade_report g
JOIN section s ON g.section_identifier=s.section_identifier
JOIN course c ON s.course_number=c.course_number
WHERE g.student_number=
(SELECT student_number FROM student WHERE name='smith');

--2
SELECT st.name,g.grade FROM course c
JOIN section s ON c.course_number=s.course_number
JOIN grade_report g ON s.section_identifier=g.section_identifier
JOIN student st ON g.student_number=st.student_number
WHERE c.course_name='database' AND s.semester='fall';

--3
SELECT cs.course_name as prerequisite FROM course c
JOIN prerequisite p 
ON c.course_number=p.course_number
JOIN course cs ON p.prerequisite_number=cs.course_number
WHERE c.course_name='database';

--5
SELECT course_name from course 
WHERE course_number 
IN (SELECT course_number FROM section WHERE instructor='king' AND year IN (7,8))

--6
SELECT s.course_number, s.semester, s.year, COUNT(st.name) FROM Section s
LEFT JOIN Course c on c.course_number = s.course_number
LEFT JOIN Student st ON st.major = c.department
WHERE s.instructor='king'
GROUP BY s.course_number, s.semester, s.year;

--7
SELECT s.name,c.course_name,c.course_number,c.credit_hours,se.semester,se.year,g.grade FROM student s
JOIN course c ON s.major=c.department
JOIN section se ON se.course_number= c.course_number
JOIN grade_report g ON g.section_identifier=se.section_identifier
WHERE s.class='2';


--8
INSERT INTO student VALUES('johnson','25','1','MATH');

UPDATE student SET class='2' WHERE name='smith';

INSERT INTO course VALUES('knowledge engineering','CS4390','3','CS');

DELETE FROM student WHERE name='smith' AND student_number='17';