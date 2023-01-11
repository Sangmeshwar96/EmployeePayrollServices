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

--Add extra column of gender to table
Alter table employee_payroll
Add Gender char;
select * from employee_payroll;

--Update gender of employees
update employee_payroll set Gender = 'M' where Name = 'Bill';
update employee_payroll set Gender = 'M' where Name = 'Charlie';
update employee_payroll set Gender = 'M' where Name = 'John';
update employee_payroll set Gender = 'M' where Name = 'Piter';
update employee_payroll set Gender = 'M' where Name = 'Alex'
update employee_payroll set Gender = 'F' where name = 'Terissa';
select * from employee_payroll;

--Sum of salary of all males
select SUM(salary) from employee_payroll
where gender = 'M'
group by gender;

--Average salary according to gender
select AVG(salary), Gender from employee_payroll
group by Gender;

--Minimum salary according to gender
select MIN(salary), Gender from employee_payroll
group by Gender;

--Maximum salary acording to gender
select MAX(salary), Gender from employee_payroll
group by Gender;

--Employee count according to gender
select COUNT(Gender), Gender from employee_payroll
group by Gender;

--Add additional Employee information columns
alter table employee_payroll add phone_number varchar(13)
alter table employee_payroll add address varchar(250), Department varchar(20);
alter table employee_payroll add PhoneNumber bigint;
alter table employee_payroll add Address varchar(255) not null default 'India';

--Add department for existing enteries
Update employee_payroll set department = 'Sales' where id in (1 , 3 ,4 , 6);
Update employee_payroll set department = 'Marketting' where id in(2,5);

--Adding constraints
alter table employee_payroll alter column department varchar(20) Not null;
select * from employee_payroll;

--Add salary divisions
alter table employee_payroll add deduction float, taxable_pay real, income_tax real, net_pay real;

--Rename salary column
EXEC sp_rename 'employee_payroll.salary', 'basic_pay', 'COLUMN';