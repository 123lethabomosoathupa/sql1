create table employees(
emp_id bigserial constraint employees_key primary key,
first_name varchar(100) not null,
surname_name varchar(100) not null,
gender  varchar(100) not null,
address varchar(100) not null,
email varchar(100) not null,
constraint email_key unique (email),
dep_id integer references department (dep_id),
roles_id integer references roles (role_id),
salary_id integer references salary (salary_id),
overtime_id integer references overtime (overtime_id)
);

create table department(
dep_id bigserial constraint dep_key primary key,
dep_name varchar(100),
dep_city varchar(100)
);

create table roles(
role_id bigserial constraint roles_key primary key,
roles_name varchar(100)

);

create table salary(
salary_id bigserial constraint salary_key primary key,
salary_pa numeric);

create table overtime(
overtime_id bigserial constraint overtime_key primary key,
overtime_hours integer
);

insert into overtime(overtime_hours)
values (1), (2), (3), (4), (5);

SELECT * FROM overtime;


insert into salary(salary_pa)
values (2000), (4000), (8000), (16000),(32000);

SELECT * FROM salary;
		
insert into roles(roles_name)
values ('manager'),
('supervisor'),
('technician'),
('junior'),
('senior');

SELECT * FROM roles;


insert into department(dep_name, dep_city)
values ('IT', 'Amsterdam'),
('Legal', 'London'),
('HR', 'Paris'),
('Finance', 'Monaco'),
('Marketing', 'New York');

SELECT * FROM department;


insert into employees(first_name, surname_name, gender, address, email, dep_id, roles_id,  salary_id, overtime_id)
values ('Hassan', 'Mansoor', 'Male', '1 Capital Street', 'hmansoor@gmail.com', 2, 3, 1, 5),
('Jon', 'Wick', 'Female', '5 Homicide Street', 'jwick@gmail.com', 1, 2, 5, 4),
('Denzel', 'Washington', 'Male', '69 Washington Avenue', 'dwash@gmail.com', 4, 5, 1, 3),
('Cameron', 'Diaz', 'Female', '5 Angels Street', 'cdiaz@gmail.com', 3, 4, 5, 2),
('Adam', 'Sandler', 'Male', '6 Gilmore Street', 'asandler@gmail.com', 1, 3, 5, 2);
 drop table employees;
SELECT * FROM employees;

Select employees.first_name, employees.surname_name, department.dep_id, department.dep_name, roles.role_id, roles.roles_name, salary.salary_id, salary.salary_pa, overtime.overtime_id, overtime_hours

From employees
left join department
on employees.dep_id = department.dep_id
left join roles
on employees.roles_id = roles.role_id
left join salary
on employees.salary_id = salary.salary_id
left join overtime
on employees.overtime_id = overtime.overtime_id;
