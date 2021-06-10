
/*1. Write appropriate MYSQL DDL statements to define the UNIVERSITY database.*/

create database UNIVERSITY;
use UNIVERSITY;

create table STUDENT(Name varchar(20) not null, Student_number int primary key,Class int,Major varchar(10));
describe STUDENT;
create table COURSE(Course_name varchar(50) not null,Course_number varchar(20)primary key,Credit_hours int,Department varchar(20));
describe COURSE;
create table SECTION(Section_identifier int primary key,Course_number varchar(20),Semester varchar(20),Year int,Instructor varchar(50),foreign key(Course_number)
references COURSE(Course_number)on update cascade on delete cascade);
describe SECTION;
create table GRADE_REPORT(Student_number int,Section_identifier int,Grade varchar(5),primary key(Student_number,Section_identifier),foreign key(Student_number) references 
STUDENT(Student_number)on update cascade on delete cascade,foreign key(Section_identifier) references SECTION(Section_identifier)on update cascade on delete cascade);
describe GRADE_REPORT;
create table PREREQUISITE(Course_number varchar(20),Prerequisite_number varchar(20)primary key,foreign key(Course_number) references COURSE(Course_number)
on update cascade on delete cascade);
describe PREREQUISITE;
show tables;

/*  2. Write queries to insert values in all the five tables. */

insert into STUDENT values('Smith',17,1,'CS');
insert into STUDENT values('Brown',8,2,'CS');
select * from STUDENT;

insert into COURSE values('Into to Computer Science','CS1310',4,'CS');
insert into COURSE values('Data Structure','CS3320',4,'CS');
insert into COURSE values('Discrete Mathematics','MATH2410',3,'MATH');
insert into COURSE values('Database','CS3380',3,'CS');
select *from COURSE;

insert into SECTION values(85,'MATH2410','Fall',07,'King');
insert into SECTION values(92,'CS1310','Fall',07,'Anderson');
insert into SECTION values(102,'CS3320','Spring',08,'Knuth');
insert into SECTION values(112,'MATH2410','Fall',08,'Chang');
insert into SECTION values(119,'CS1310','Fall',08,'Abderson');
insert into SECTION values(135,'CS3380','Fall',08,'Stone');
select * from SECTION;

insert into GRADE_REPORT values(17,112,'B');
insert into GRADE_REPORT values(17,119,'C');
insert into GRADE_REPORT values(8,85,'A');
insert into GRADE_REPORT values(8,92,'A');
insert into GRADE_REPORT values(8,102,'B');
insert into GRADE_REPORT values(8,135,'A');
select * from GRADE_REPORT;

insert into PREREQUISITE values('CS3380','CS3320');
insert into PREREQUISITE values('CS3380','MATH2410');
insert into PREREQUISITE values('CS3320','CS1310');
select * from PREREQUISITE;

/* 3. Retrieve the list of all courses and grades of ‘Smith’ */

select st.Name,c.Course_name,g.Grade from COURSE c join SECTION s on c.Course_number=s.Course_number join GRADE_REPORT g on
 s.Section_identifier=g.Section_identifier join STUDENT st on g.Student_number=st.Student_number where name='Smith'; 
 
/* 4. List the names of students who took the section of the ‘Database’ course offered in fall 2008 and their grades in that section*/

select st.Name,c.Course_name,s.Semester,s.Year,g.Grade from COURSE c join SECTION s on c.Course_number=s.Course_number join GRADE_REPORT g
 on s.Section_identifier=g.Section_identifier join STUDENT st on g.Student_number=st.Student_number where Semester='Fall' and Year=08 and c.Course_name='Database'; 

/*  5. List the prerequisites of the ‘Database’ course.*/

select p.Course_number,p.Prerequisite_number from PREREQUISITE P join COURSE c on p.Course_number=c.Course_number where c.Course_name='Database';

/* 6. Retrieve the names of all senior students majoring in ‘CS’ (computer science). */

select distinct st.Name,st.Major,s.Year from STUDENT st join GRADE_REPORT g on st.Student_number=g.Student_number 
join SECTION s on g.Section_identifier=s.Section_identifier where st.Major='CS' and s.Year=07;

/*7. Retrieve the names of all courses taught by Professor King in 2007 and 2008. */

select c.Course_name,s.Instructor from COURSE c join SECTION s on c.Course_number=s.Course_number where s.Instructor='King';

/*8. For each section taught by Professor King, retrieve the course number, semester, year, and number of students who took the section. */

select s.Course_number,s.Semester,s.Year,count(g.Student_number)as No_of_students from SECTION s join GRADE_REPORT g on 
s.Section_identifier=g.Section_identifier where s.Instructor='King';

/*9. Retrieve the name and transcript of each senior student (Class = 4)majoring in CS. A transcript 
includes course name, course number, credit hours, semester, year, and grade for each course completed.*/

select st.Name,c.Course_name,c.Course_number,c.Credit_hours,s.Semester,s.Year,g.Grade from STUDENT st join GRADE_REPORT g on st.Student_number=g.Student_number 
join SECTION s on g.Section_identifier=s.Section_identifier join COURSE c on s.Course_number=c.Course_number where st.Major='CS' order by name;

/*10. Write SQL update statements to do the following on the database schema . */
/*A. Insert a new student, <’Johnson’,25,1,’Math’> , in the database. */

insert into STUDENT values('Johnson',25,1,'Math');
select * from STUDENT;

/*B. Change the class of student ‘Smith’ to 2.*/

update STUDENT set class=02 where Student_number=17;
select *from STUDENT;

/*C. Insert a new course, <’Knowledge Engineering’,’CS4390’,3,’CS’>. */

insert into COURSE values('Knowledge Engineering','CS4390',3,'CS');
select * from COURSE;

/*D. Delete the record for the student whose name is ‘Smith’ and whose student number is 17*/

delete  from STUDENT where Student_number=17;
select * from STUDENT;





