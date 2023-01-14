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
alter table employee_payroll add Phone_Number bigint;
alter table employee_payroll add Department varchar(25);
alter table employee_payroll add Address varchar(255) not null default 'America';

--Add department for existing enteries
Update employee_payroll set Department = 'Sales' where id in (1 , 2);
Update employee_payroll set Department = 'Marketting' where id = 3;

--Adding constraints
alter table employee_payroll alter column department varchar(20) Not null;
select * from employee_payroll;

--Add salary divisions
alter table employee_payroll add deduction float, taxable_pay real, income_tax real, net_pay real;

--Rename salary column
EXEC sp_rename 'employee_payroll.salary', 'basic_pay', 'COLUMN';

--make data for Terissa added with department change 
insert into employee_payroll (name, start, basic_pay, Department) values
('Terissa', '2019-11-13', '200000', 'Sales');

--Update information for every employee
Update employee_payroll 
set Phone_Number = '9926707344', Address = 'Damoh Naka', deduction = 1000, taxable_pay = 99000, income_tax = 5000, net_pay = 94000 where id = 1
Update employee_payroll
set Phone_Number = '8529631478', Address = 'PNB Colony', deduction = 3000, taxable_pay = 297000, income_tax = 10000, net_pay = 287000 where id = 3
Update employee_payroll
set Phone_Number = '9586942335', Address = 'Shanti Nagar', deduction = 2000, taxable_pay = 198000, income_tax = 8000, net_pay = 190000 where name = 'Terissa';
select * from employee_payroll;

--Create separate employee table
create table employee
(
Id int identity(1,1) not null primary key,
Name varchar(25) not null ,
Gender char(1) not null,
Phone_Number varchar(13) not null,
Address varchar(250) not null default 'India',
);

--Insert data into employee table
insert into employee values
('Bill', 'M', '9424787443', 'Shanti Nagar'),
('Terissa', 'F', '8109322276', 'Damoh Naka'),
('Charlie', 'M', '9926707344', 'Panchsheel Nagar');
select * from employee;

--Create separate EmployeeDepartment table
create table EmployeeDepartment
(
DepartmentId int not null primary key,
Department varchar (20) not null,
EmployeeId int not null foreign key references Employee(Id) on delete cascade
);

--Insert data into EmployeeDepartment table
insert into EmployeeDepartment values
(101, 'Sales',1),
(102, 'Sales',2),
(103, 'HR', 3),
(104,'Marketting',2);
select * from EmployeeDepartment;

--Create separate Payroll table
create table Payroll
(
Id int not null foreign key references Employee(Id) on delete cascade,
Start date not null,
Basic_pay money not null,
Deduction money,
Taxable_pay money,
Income_tax money,
Net_pay money not null
);

--Insert data into Payroll table
insert into Payroll values
(1,'2018-01-03', 100000, 10000, 90000, 1000, 89000),
(2, '2019-11-13', 200000, 10000, 190000,3000,187000),
(3, '2020-05-21', 300000, 20000, 280000, 5000, 275000);
select * from Payroll;