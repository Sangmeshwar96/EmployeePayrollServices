--Creating Database
Create Database payroll_service;
--Using Database
use Payroll_Service;
--Selecting database
select DB_NAME();
--Creating Table into database
create table employee_payroll
(Id bigint identity(1,1),
Name varchar (100),
Salary money, 
Start date);
--Displaying data from table
select * from employee_payroll;
--Inserting data into table
insert into employee_payroll values
('John',250000.00,'2019-01-04'),
('Alex',275000.00,'2020-11-14'),
('Piter',350000.00,'2021-05-25');
insert into employee_payroll values
('Bill',100000.00,'2018-01-03'),
('Terissa',200000.00,'2019-11-13'),
('Charlie',300000.00,'2020-05-21');
--Retrieve data from table
select * from employee_payroll;
--Selecting salary of Bill
select salary from employee_payroll where name = 'Bill';
--Selecting all employees with start date between 1/1/2018 and present date
select * from employee_payroll where start between '2018-01-01' and GETDATE();