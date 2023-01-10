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