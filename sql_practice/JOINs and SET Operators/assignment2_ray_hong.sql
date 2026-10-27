/* 
Name: Ray Hong
Date: 09/21/2026
*/

--1 
SELECT d.department_name AS "Department Name",
l.city AS "City",
c.country_name AS "Country Name"
FROM departments d
JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
ORDER BY "Department Name";

--2
SELECT j.job_title AS "Job Title",
e.first_name AS "First Name",
e.last_name AS "Last Name",
d.department_name AS "Department Name",
e.salary AS "Salary"
FROM employees e
JOIN Jobs j
ON e.job_id = j.job_id
JOIN departments d
ON e.department_id = d.department_id
ORDER BY "Salary" DESC;

--3
SELECT e.first_name AS "First Name",
e.last_name AS "Last Name",
l.city AS "City Name",
c.country_name AS "Country Name",
r.region_name AS "Region Name"
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
JOIN regions r
ON c.region_id = r.region_id
WHERE r.region_name = 'Americas';

--4
SELECT DISTINCT d.department_id AS "Department ID",
d.department_name AS "Department Name",
e.last_name AS "Last Name",
l.city AS "City Name",
c.country_name AS "Country Name"
FROM departments d
LEFT JOIN employees e
ON d.manager_id = e.employee_id
LEFT JOIN locations l
ON d.location_id = l.location_id
LEFT JOIN countries c
ON l.country_id = c.country_id
WHERE d.department_id IN (10 ,60, 80, 100, 210)
ORDER BY d.department_name,
c.country_name DESC;

--5
SELECT e.employee_id AS "Employee ID",
e.first_name AS "First Name",
e.last_name AS "Last Name",
d.department_name AS "Department Name",
l.location_id AS "Location ID"
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE d.location_id >= 2500
ORDER BY "Location ID",
"Last Name";

--6
SELECT e.employee_id AS "Employees ID",
e.first_name AS "Employees First Name",
e.last_name AS "Employees Last Name",
m.first_name AS "Manager First Name",
m.last_name AS "Manager Last Name",
d.department_name  AS "Department Name",
e.salary AS "Employees Salary"
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary < 5000
ORDER BY "Department Name",
"Employees Salary";

--7
SELECT d.department_name AS "Department Name",
l.location_id AS "Location ID",
l.city AS "City Name",
r.region_name AS "Region Name"
FROM departments d
RIGHT JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
JOIN regions r
ON c.region_id = r.region_id
WHERE r.region_name NOT IN ('Europe', 'Asia')
ORDER BY r.region_name DESC;

--8
SELECT c.country_name AS "Country Name",
l.location_id AS "Location ID"
FROM locations l
FULL OUTER JOIN countries c
ON l.country_id = c.country_id
WHERE l.country_id IS NULL
OR c.country_id IS NULL
ORDER BY "Country Name";

--9
SELECT job_id AS "Ray Job_ids"
FROM jobs
INTERSECT
SELECT job_id
FROM employees
ORDER BY "Ray Job_ids";

--10
SELECT e.employee_id AS "Employee ID",
e.first_name AS "Employee First Name",
e.last_name AS "Employee Last Name",
m.employee_id AS "Manager ID",
m.first_name AS "Manager First Name",
m.last_name AS "Manager Last Name"
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.last_name LIKE 'H%'
ORDER BY "Employee Last Name";


--11
/*
1. Question: Display all employees' first names (if any) whose manager
salary is greater than 20000 and job history is empty,
their managers' first names, manager salary, and the city names of their 
departments. Sort the result by employee first name by alphabetical order.
2. SQL query used: SELECT, AS, FROM, WHERE, ORDER BY, JOIN, LEFT JOIN, ON.
3. Expected results: 4 columns show the employees, managers whose salary
is greater than 20000, and managers' salary, and the city name 
of their department.
*/
SELECT e.first_name AS "Employee First Name",
m.first_name AS "Manager First Name",
m.salary AS "Manager Salary",
l.city AS "City name"
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
LEFT JOIN job_history h
ON e.employee_id = h.employee_id
WHERE h.start_date IS NULL AND
m.salary > 20000
ORDER BY e.first_name;

