-- ASSIGNMENT

CREATE DATABASE MarketCo;
use Marketco;

-- CREATE COMPANY TABLE

CREATE TABLE Company(
		CompanyID Int Primary Key ,
        CompanyName Varchar(45),
        Street Varchar(45),
        City Varchar(45),
        State Varchar(2),
        Zip Varchar(10)
);

----------------------------------------------------------------------------------------------------------------------
-- Q-1 Statement to create the contact table
----------------------------------------------------------------------------------------------------------------------

CREATE TABLE contact(
					ContactId Int Primary Key,
                    CompanyId Int,
                    FirstName Varchar(45),
                    LastName Varchar(45),
                    Street Varchar(45),
                    City Varchar(45),
                    State Varchar(2),
                    Zip Varchar(10),
                    IsMain Boolean,
                    Email Varchar(45),
                    Phone Varchar(45),
                    Foreign key (CompanyID) References Company(CompanyID)
                    );

----------------------------------------------------------------------------------------------------------------------
-- Q-2 Statement to create the Employee table 
----------------------------------------------------------------------------------------------------------------------

CREATE TABLE Employee(
					EmployeeID Int Primary Key,
                    FirstName Varchar(45),
                    LastName Varchar(45),
                    Salary Decimal(10,2),
                    HireDate Date,
                    JobTitle Varchar(25),
                    Email Varchar(45),
                    Phone Varchar(12)
					);

----------------------------------------------------------------------------------------------------------------------
-- Q-3 Statement to create the ContactEmployee table
-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the
-- date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).
----------------------------------------------------------------------------------------------------------------------

CREATE TABLE ContactEmployee(
					ContactEmployeeID Int Primary Key,
                    ContactID Int,
                    EmployeeID Int,
                    ContactDate Date,
                    Description Varchar(100),
                    Foreign Key (ContactID) References Contact(ContactID),
                    Foreign Key (EmployeeID) References Employee(EmployeeID)
					);

----- Inserting Values In Each Table

Insert Into Company(CompanyID, CompanyName, Street, City, State, Zip)
Values
(1, 'SmartRetail Inc.', '12 Commerce St', 'Dallas', 'TX', '75201'),
(2, 'FinTrust Ltd.', '47 Wall St', 'New York', 'NY', '10005'),
(3, 'BioNova Health', '88 Medical Ln', 'San Diego', 'CA', '92103'),
(4, 'QuantumSoft', '245 Silicon Ave', 'Palo Alto', 'CA', '94301'),
(5, 'AgriGrow Corp', '909 Farm Rd', 'Lincoln', 'NE', '68508'),
(6, 'StyleHub', '36 Fashion Blvd', 'Los Angeles', 'CA', '90017'),
(7, 'EduNation Pvt Ltd', '99 Scholar St', 'Cambridge', 'MA', '02139'),
(8, 'SkyNet Networks', '182 Cloud Dr', 'Houston', 'TX', '77002'),
(9, 'TravelLoop', '61 Trip Ln', 'Orlando', 'FL', '32801'),
(10, 'SolarX Energy', '754 Sun Dr', 'Phoenix', 'AZ', '85004');

Insert Into Contact(ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
Values
(1, 1, 'Brandon', 'Foster', '12 Commerce St', 'Dallas', 'TX', '75201', TRUE, 'brandon@smartretail.com', '469-555-1001'),
(2, 2, 'Natalie', 'Reed', '47 Wall St', 'New York', 'NY', '10005', FALSE, 'natalie@fintrust.com', '212-555-2002'),
(3, 3, 'Sanjay', 'Kumar', '88 Medical Ln', 'San Diego', 'CA', '92103', TRUE, 'sanjay@bionova.com', '619-555-3003'),
(4, 4, 'Isabella', 'Flores', '245 Silicon Ave', 'Palo Alto', 'CA', '94301', FALSE, 'isabella@quantumsoft.com', '650-555-4004'),
(5, 5, 'David', 'Miller', '909 Farm Rd', 'Lincoln', 'NE', '68508', TRUE, 'david@agrigrow.com', '402-555-5005'),
(6, 6, 'Angela', 'Nguyen', '36 Fashion Blvd', 'Los Angeles', 'CA', '90017', FALSE, 'angela@stylehub.com', '213-555-6006'),
(7, 7, 'Harsh', 'Sharma', '99 Scholar St', 'Cambridge', 'MA', '02139', TRUE, 'harsh@edunation.com', '617-555-7007'),
(8, 8, 'Elena', 'Cruz', '182 Cloud Dr', 'Houston', 'TX', '77002', FALSE, 'elena@skynet.com', '713-555-8008'),
(9, 9, 'Omar', 'Ali', '61 Trip Ln', 'Orlando', 'FL', '32801', TRUE, 'omar@travelloop.com', '407-555-9009'),
(10, 10, 'Grace', 'Baker', '754 Sun Dr', 'Phoenix', 'AZ', '85004', FALSE, 'grace@solarx.com', '602-555-1010');


Insert Into Employee(EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
Values
(1, 'Henry', 'Watson', 72000.00, '2022-01-12', 'Marketing Lead', 'henry@marketco.com', '214-555-1001'),
(2, 'Priya', 'Rao', 58000.00, '2021-03-14', 'Analyst', 'priya@marketco.com', '212-555-2002'),
(3, 'Jake', 'Anderson', 91000.00, '2019-09-25', 'Product Manager', 'jake@marketco.com', '415-555-3003'),
(4, 'Sophia', 'Gomez', 49000.00, '2020-05-30', 'Customer Rep', 'sophia@marketco.com', '718-555-4004'),
(5, 'Mohammed', 'Khan', 80000.00, '2023-02-10', 'System Engineer', 'mohammed@marketco.com', '646-555-5005'),
(6, 'Anita', 'Verma', 55000.00, '2022-08-01', 'Data Entry', 'anita@marketco.com', '510-555-6006'),
(7, 'Leo', 'Bennett', 74000.00, '2021-11-11', 'UI Designer', 'leo@marketco.com', '303-555-7007'),
(8, 'Fatima', 'Zahid', 69000.00, '2018-12-04', 'HR Lead', 'fatima@marketco.com', '972-555-8008'),
(9, 'Chris', 'Patel', 62000.00, '2020-06-20', 'Sales Rep', 'chris@marketco.com', '917-555-9009'),
(10, 'Neha', 'Kapoor', 76000.00, '2023-04-15', 'Data Scientist', 'neha@marketco.com', '650-555-1010');

Insert Into ContactEmployee(ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 1, 1, '2023-03-01', 'Introductory meeting'),
(2, 2, 2, '2023-03-05', 'Investment inquiry'),
(3, 3, 3, '2023-03-10', 'Product pitch'),
(4, 4, 4, '2023-03-15', 'Technical Q&A'),
(5, 5, 5, '2023-03-20', 'Hardware pricing discussion'),
(6, 6, 6, '2023-03-25', 'Design prototype feedback'),
(7, 7, 7, '2023-03-30', 'Education portal update'),
(8, 8, 8, '2023-04-05', 'Cloud migration plan'),
(9, 9, 9, '2023-04-10', 'Travel app testing feedback'),
(10, 10, 10, '2023-04-15', 'Green energy grant proposal');

----------------------------------------------------------------------------------------------------------------------
-- Q-4 In the Employee table, the statement that changes Anita Verma’s phone number to 215-555-8800 
----------------------------------------------------------------------------------------------------------------------
Select * from Employee;

Update Employee
Set Phone = '215-555-8800'
Where EmployeeID = 6;
 
----------------------------------------------------------------------------------------------------------------------
-- Q-5 In the Company table, the statement that changes the name of “SmartRetail Inc.” to “SmartRetail” . 
----------------------------------------------------------------------------------------------------------------------
Select * from Company;

Update Company 
Set CompanyName = 'SmartRetail'
Where CompanyID =1;

----------------------------------------------------------------------------------------------------------------------
-- Q-6 In ContactEmployee table, the statement that removes Brandon Foster’s contact event with Henry Watson
-- (one statement). HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove. 
----------------------------------------------------------------------------------------------------------------------
Select * From ContactEmployee;
Select * From Employee;
Select * From Contact;

Delete from ContactEmployee
Where ContactEmployeeID = 1;

----------------------------------------------------------------------------------------------------------------------
-- Q-7 Write the SQL SELECT query that displays the names of the employees that have contacted FinTrust Ltd. 
-- (one statement). Run the SQL SELECT query in MySQL Workbench. Copy the results below as well. 
----------------------------------------------------------------------------------------------------------------------
select * from employee;
SELECT DISTINCT e.FirstName,e.LastName from employee e
inner join contactemployee c on e.EmployeeID = c.EmployeeID
inner join contact ce on ce.contactID = c.contactID
where ce.FirstName = 'FinTrust Ltd';

--------------------------------------------------------------------------------------------------------------------
-- Q-8 What is the significance of “%” and “_” operators in the LIKE statement?
--------------------------------------------------------------------------------------------------------------------
-- % - matches zero or more characters.
-- Example: WHERE Name LIKE 'N%' matches names starting with "N".

-- _  - matches exactly one character.
-- Example: WHERE Name LIKE '_ohn' matches "John", "Bohn", etc.

--------------------------------------------------------------------------------------------------------------------
-- Q-9 Explain normalization in the context of databases
--------------------------------------------------------------------------------------------------------------------
-- Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves dividing large tables into smaller ones and defining relationships between them.
-- Common normal forms:
-- 1NF: Remove repeating groups.
-- 2NF: Remove partial dependencies.
-- 3NF: Remove transitive dependencies.

--------------------------------------------------------------------------------------------------------------------
-- Q-10 What does a join in MySQL mean?
-------------------------------------------------------------------------------------------------------------------
-- A JOIN clause is used to combine rows from two or more tables based on a related column.

--------------------------------------------------------------------------------------------------------------------
-- Q-11 What do you understand about DDL, DCL, and DML in MySQL?
-------------------------------------------------------------------------------------------------------------------
-- DDL (Data Definition Language): Defines structure.
-- E.g., CREATE, ALTER, DROP.
-- DML (Data Manipulation Language): Works with data.
-- E.g., INSERT, UPDATE, DELETE, SELECT.
-- DCL (Data Control Language): Controls access.
-- E.g., GRANT, REVOKE.

--------------------------------------------------------------------------------------------------------------------
-- Q-12 What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?
-------------------------------------------------------------------------------------------------------------------
-- JOINs allow combining related data across tables.
-- Common types:
-- INNER JOIN: Only matching rows.
-- LEFT JOIN: All from left table + matched from right table.
-- RIGHT JOIN: All from right table + matched from left table.
-- FULL JOIN: All rows from both tables

