create database Lab6;
create table locations(
    location_id serial primary key ,
    street_address varchar(25) ,
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
create table departments(
    department_id serial primary key ,
    department_name varchar(50) unique ,
    budget int,
    location_id integer references locations
);
create table employees(
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

--3
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id;

--4
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id WHERE d.department_id IN (40, 80);

--5
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON e.department_id = d.department_id JOIN locations l ON d.location_id = l.location_id;

--6
SELECT d.department_id, d.department_name, e.employee_id
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

--7
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id;
