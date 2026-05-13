create database it202_ktdg_ss08;
use it202_ktdg_ss08;
create table department(
	dept_id int primary key auto_increment,
    dept_name varchar(100) not null,
    location varchar(100)
);
create table employee(
	emp_id int primary key auto_increment,
    emp_name varchar(100) not null,
    gender int default 1,
    birth_date date,
    salary decimal,
    dept_id int,
    foreign key (dept_id) references department(dept_id)
);
create table project(
	project_id int primary key auto_increment,
    project_name varchar(150),
    start_date date default(current_date()),
    end_date date,
    emp_id int,
    foreign key (emp_id) references employee(emp_id)
);
-- 2 thao tác cấu trúc bảng:
alter table employee add column email varchar(100) unique;
alter table project modify column project_name varchar(200);
alter table project modify column end_date date check(end_date > start_date);
-- 3 thao tác dữ liệu:
insert into department(dept_name, location) values
('IT', 'Ha Noi'),
('HR', 'HCM'),
('Marketing', 'Da Nang');
insert into employee(emp_name, gender, birth_date, salary, dept_id, email) values
('Nguyen Van A', 1, '1990-01-15', 1500, 1 ,'a@gmail.com'),
('Tran Thi B', 0, '1995-05-20', 1200, 1 ,'b@gmail.com'),
('Le Minh C', 1, '1988-10-10', 2000, 2 ,'c@gmail.com'),
('Pham Thi D A', 0, '1992-12-05', 1800, 3 ,'d@gmail.com');
insert into project(project_name, emp_id, start_date, end_date) values
('Website Redesign', 1, '2024-01-01', '2024-06-01'),
('Recruitment System', 3, '2024-02-01', '2024-08-01'),
('Marketing Campaign', 4, '2024-03-01', null);
update employee set salary = salary + 200 where dept_id = 1;
update project set end_date = '2024-12-31' where project_id = 3;
delete from project where start_date < '2024-02-01';
alter table employee add column gender_name varchar(5);
/*
select emp_name, email, gender_name
from employee
where
(case
 gender_name = 'Nam' as gender = 1)*/