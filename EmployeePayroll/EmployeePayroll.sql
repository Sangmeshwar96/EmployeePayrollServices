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
--Retrieve data from table
select * from employee_payroll;