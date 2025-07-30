-- ASSESMENT
Create Database Assesment;
use assesment;

Create Table Worker(
					worker_id int primary key ,
                    first_name varchar(25) not null,
                    last_name varchar(25),
                    salary int,
                    joining_date datetime ,
                    department varchar(25) 
);

INSERT INTO worker (worker_id, first_name, last_name, salary, joining_date, department) 
VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

---------------------------------------------------------------------------------------------------------------------
-- Q-1 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
-- Ascending and DEPARTMENT Descending
---------------------------------------------------------------------------------------------------------------------
select * from worker
order by first_name asc , department desc;

---------------------------------------------------------------------------------------------------------------------
-- Q-2 Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the
--  Worker table.
---------------------------------------------------------------------------------------------------------------------
select * from worker
where first_name in ('Vipul' , 'Satish');

---------------------------------------------------------------------------------------------------------------------
-- Q-3 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
---------------------------------------------------------------------------------------------------------------------
select * from worker
where first_name = '____h';

--------------------------------------------------------------------------------------------------------------------
-- Q-4 Write an SQL query to print details of the Workers whose SALARY lies between 1
--------------------------------------------------------------------------------------------------------------------
select * from worker
where salary between 100000 and 200000;

--------------------------------------------------------------------------------------------------------------------
-- Q-5 Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
--------------------------------------------------------------------------------------------------------------------
select first_name , last_name , count(*) from worker
group by first_name , last_name
having count(*) > 1;

--------------------------------------------------------------------------------------------------------------------
-- Q-6 Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
--------------------------------------------------------------------------------------------------------------------
select first_name, last_name, department, COUNT(*) AS count
from Worker
group by first_name, last_name, department
having COUNT(*) > 1;

--------------------------------------------------------------------------------------------------------------------
-- Q-7 Write an SQL query to fetch the departments that have less than five people in them
--------------------------------------------------------------------------------------------------------------------
select department , count(department) as num_of_worker 
from worker
group by department
having count(department) < 5;

-------------------------------------------------------------------------------------------------------------------
-- Q-8 Write an SQL query to show all departments along with the number of people in there
--------------------------------------------------------------------------------------------------------------------
select department , count(department) as total_worker
from worker
group by department;

-------------------------------------------------------------------------------------------------------------------
-- Q-9 Write an SQL query to print the name of employees having the highest salary in each department. 
-------------------------------------------------------------------------------------------------------------------
select * from worker
where salary in (
			select max(salary)
            from worker);
            
----------------------------------------------------------------------------------------------------------------
-- Question 2: Open school database, then select student table and use following SQL statements.
-- TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT 
---------------------------------------------------------------------------------------------------------------
Create database school_assesment;
use school_assesment;

create table student(
				StdID Int Primary Key ,
                StdName Varchar(50) ,
                Sex Varchar(10) ,
                Percentage Int ,
                Class Int ,
                Sec Char(1) ,
                Stream Varchar(25) ,
                DOB Date 
                );

Insert Into Student (StdID, StdName, Sex, Percentage, Class, Sec, Stream, DOB)
Values
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'JAHANVI Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-03-08'),
(1008, 'SAHIL SARAS', 'Male', 56, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'AKSHRA AGARWAL', 'Female', 72, 12, 'B', 'Commerce', '1996-10-01'),
(1010, 'STUTI MISHRA', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'HARSH AGARWAL', 'Male', 42, 11, 'C', 'Science', '1998-03-08'),
(1012, 'NIKUNJ AGARWAL', 'Male', 49, 12, 'C', 'Commerce', '1998-06-28'),
(1013, 'AKRITI SAXENA', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'TANI RASTOGI', 'Female', 82, 12, 'A', 'Science', '2008-11-23');  

----------------------------------------------------------------------------------------------------------------
-- Q-1 To display all the records form STUDENT table. SELECT * FROM student ;
----------------------------------------------------------------------------------------------------------------
select * from student;

----------------------------------------------------------------------------------------------------------------
-- Q-2 To display any name and date of birth from the table STUDENT. SELECT StdName, DOB FROM student ; 
-----------------------------------------------------------------------------------------------------------------
select StdName , DOB from student;

----------------------------------------------------------------------------------------------------------------
-- Q-3 To display all students record where percentage is greater of equal to 80 FROM student table.
----------------------------------------------------------------------------------------------------------------
select * from student 
where Percentage >=80;

------------------------------------------------------------------------------------------------------------------
-- Q-4 To display student name, stream and percentage where percentage of student is more than 80.
-------------------------------------------------------------------------------------------------------------------
select StdName , Stream , Percentage from student
where Percentage >=80;

-------------------------------------------------------------------------------------------------------------------
-- Q-5 To display all records of science students whose percentage is more than 75 form student table.
-------------------------------------------------------------------------------------------------------------------
select * from student 
where Percentage > 75 and Stream = 'Science';
