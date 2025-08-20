create database project;
use project;

-- Table Creation --

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    join_date DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    supplier_id INT
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(50),
    contact_no VARCHAR(15)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(50),
    hire_date DATE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Inserting Values --

INSERT INTO Customers
VALUES
(1, 'Ramesh', 'Patel', 'Ahmedabad', 'Gujarat', '2023-01-15'),
(2, 'Priya', 'Sharma', 'Mumbai', 'Maharashtra', '2023-02-10'),
(3, 'Amit', 'Verma', 'Delhi', 'Delhi', '2023-03-05'),
(4, 'Sneha', 'Mehta', 'Surat', 'Gujarat', '2023-04-12'),
(5, 'Vikram', 'Singh', 'Jaipur', 'Rajasthan', '2023-05-20');

INSERT INTO Products 
VALUES
(101, 'Laptop', 'Electronics', 55000, 201),
(102, 'Smartphone', 'Electronics', 25000, 202),
(103, 'Office Chair', 'Furniture', 7000, 203),
(104, 'Coffee Table', 'Furniture', 4500, 203),
(105, 'LED TV', 'Electronics', 40000, 202);

INSERT INTO Suppliers
VALUES
(201, 'TechSource Ltd', 'Bengaluru', '9876543210'),
(202, 'GadgetWorld', 'Mumbai', '9823456789'),
(203, 'FurniPro', 'Pune', '9812345678');

INSERT INTO Employees 
VALUES
(301, 'Anita', 'Desai', 'Sales Executive', '2022-05-15'),
(302, 'Rahul', 'Jain', 'Sales Executive', '2021-08-10'),
(303, 'Kavita', 'Iyer', 'Store Manager', '2020-03-20');

INSERT INTO Orders 
VALUES
(1001, 1, 301, '2023-06-01', 55000),
(1002, 2, 302, '2023-06-03', 29500),
(1003, 3, 301, '2023-06-05', 40000),
(1004, 4, 302, '2023-06-07', 11500),
(1005, 5, 301, '2023-06-10', 25000);

INSERT INTO Order_Items 
VALUES
(1, 1001, 101, 1),
(2, 1002, 102, 1),
(3, 1002, 104, 1),
(4, 1003, 105, 1),
(5, 1004, 103, 1),
(6, 1004, 104, 1),
(7, 1005, 102, 1);

INSERT INTO Payments 
VALUES
(401, 1001, '2023-06-02', 'Credit Card', 55000),
(402, 1002, '2023-06-04', 'UPI', 29500),
(403, 1003, '2023-06-06', 'Debit Card', 40000),
(404, 1004, '2023-06-08', 'Cash', 11500),
(405, 1005, '2023-06-11', 'UPI', 25000);

-- Question and Answers

-- Q-1-List all customers' names and phone numbers.
alter table customers 
add phone_no varchar(15);

UPDATE Customers SET phone_no = '9876543210' WHERE customer_id = 1;
UPDATE Customers SET phone_no = '9123456780' WHERE customer_id = 2;
UPDATE Customers SET phone_no = '9988776655' WHERE customer_id = 3;
UPDATE Customers SET phone_no = '9876501234' WHERE customer_id = 4;
UPDATE Customers SET phone_no = '9090909090' WHERE customer_id = 5;

select first_name , last_name , phone_no from customers;

-- Q-2-Find all customers from the state 'Gujarat'.

select * from customers
where state = 'Gujarat';

-- Q-3-Show employees ordered by hire_date in descending order.

select * from employees 
order by hire_date  desc;

-- Q-4-List all unique product categories available.

select distinct category from products;

-- Q-5-Find orders placed between '2023-06-01' and '2023-06-05'.

select * from orders
where order_date between '2023-06-01' and '2023-06-05';

-- Q-6-List details of customers from either 'Mumbai', 'Delhi', or 'Jaipur'.

select * from customers
where city in ('Mumbai','Delhi','Jaipur');

-- Q-7- Find customer names that start with 'A'.

select * from customers
where first_name like 'A%';

-- Q-8-Retrieve orders where total_amount is NULL.

select * from orders
where total_amount is null;

-- Q-9-Show top 3 most expensive products.

select * from products
order by price desc
limit 3;

-- Q-10-Get customer name and employee name for all orders.

select o.order_id , c.first_name as customer_name , e.first_name as employee_name , o.total_amount
from orders o
join customers c on c.customer_id = o.customer_id
join employees e on e.employee_id = o.employee_id;

-- Q-11-Show products in the category 'Electronics'.

select * from products 
where category = 'Electronics';

-- Q-12-Count how many orders each employee has handled.

select e.employee_id , e.first_name , count(o.order_id) as total_order 
from orders o
left join employees e on e.employee_id = o.employee_id
group by e.employee_id , e.first_name;

-- Q-13-Calculate total amount spent by each customer.

select c.customer_id , c.first_name , sum(o.total_amount) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id , c.first_name;

-- Q-14-Find employees who have handled more than 2 orders

select e.employee_id , e.first_name , count(o.order_id) as order_count
from employees e
join orders o on e.employee_id = o.employee_id 
group by e.employee_id , e.first_name
having count(o.order_id) > 2;

-- Q-15-Get a list of all customers and their orders (even if they haven’t ordered)

select o.order_id , c.first_name from customers c
left join orders o on c.customer_id = o.customer_id;

-- Q-16-Show all employees and the customer names they’ve served (include employees with no orders).

select e.employee_id , e.first_name as employee_name, c.first_name as customer_name 
from Employees e
left join Orders o on e.employee_id = o.employee_id
left join Customers c on o.customer_id = c.customer_id;

-- Q-17-Find average product price for each category.

select product_id , product_name , category , avg(price) as avg_price 
from products
group by category , product_id , product_name;

SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Q-18-Rename columns in the output (e.g., customer_name, employee_name, total_amount).

select c.first_name as customer_name , e.first_name as employee_name , o.total_amount as total_amount
from orders o
join customers c on o.customer_id = c.customer_id 
join employees e on o.employee_id = e.employee_id;

-- Q-19-Show product price category as 'Low', 'Medium', or 'High' based on price.

select product_name , price ,
	case 
		when price < 5000 then 'Low'
        when price between 5000 and 15000 then 'Medium'
        else 'High'
	end as price_category
from products;

-- Q-20-List customers who have ordered a product in the 'Furniture' category.

select distinct c.customer_id , c.first_name , c.last_name , c.city , c.state from customers c 
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where p.category = 'Furniture';

-- Q-21-Find the average order amount for customers from 'Gujarat'.

select c.customer_id ,c.first_name , c.city, avg(o.total_amount) as avg_amount 
from orders o
join customers c on o.customer_id = c.customer_id
where c.state = 'Gujarat'
group by c.customer_id ,c.first_name , c.city;

-- Q-22-Find employees who have handled at least one order.

select distinct e.employee_id , e.first_name , e.last_name 
from employees e
join orders o on e.employee_id = o.employee_id;

-- Q-23-Rank customers based on total amount spent (highest first).

select c.customer_id , c.first_name , sum(o.total_amount) as total_amount,
	   rank() over (order by sum(o.total_amount) Desc) as rank_no
from customers c
join orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.first_name;

-- Q-24-Using a CTE, calculate total spending per customer and filter those over ₹40,000.

with CustomerSpending as (
    select c.customer_id,
           c.first_name,
           SUM(o.total_amount) as total_spent
    from Customers c
    join Orders o on c.customer_id = o.customer_id
    group by c.customer_id, c.first_name
)
select *
from CustomerSpending
where total_spent > 40000;

-- Q-25-Call a stored procedure to generate monthly sales report.

DELIMITER //
CREATE PROCEDURE MonthlySalesReport()
BEGIN
    SELECT 
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY YEAR(order_date), MONTH(order_date)
    ORDER BY order_year, order_month;
END //
DELIMITER ;

call MonthlySalesReport();

-- Q-26-Combine lists of all supplier and customer phone numbers.

select  phone_no from customers
union
select contact_no from suppliers;

-- Q-27-Create a view of current month orders with customer and employee names.

create view current_month_orders 
as
select o.* , c.first_name as customer_name, e.first_name as employee_name
from orders o
join customers c  on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id
where month(o.order_date) = month(curdate())
	  and year(o.order_date) = year(curdate());

-- Q-28-Write a trigger to auto-update payment_method to 'Cash' if not specified.

DELIMITER //
CREATE TRIGGER set_default_payment_method
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.payment_method IS NULL OR NEW.payment_method = '' THEN
        SET NEW.payment_method = 'Cash';
    END IF;
END //
DELIMITER ;



