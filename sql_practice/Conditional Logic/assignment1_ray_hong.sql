/*
Name: Ray Hong
Date: 09-03-2026
*/

--1
SELECT department_name AS "Department Name", 
location_id AS "Location ID"
FROM Departments
WHERE manager_id = 200;

--2
SELECT region_name AS "Region Name"
FROM Regions
WHERE region_name LIKE '%and%';

--3
SELECT department_name AS "Department Name", 
location_id AS "Location ID"
FROM Departments
WHERE location_id = 1000 
OR location_id = 1700
OR location_id = 2500
ORDER BY location_id;

--4
SELECT first_name AS "First Name",
last_name AS "Last Name",
job_id AS "Job ID"
FROM Employees
WHERE job_id LIKE 'SA____';

--5
SELECT salary AS "Salary",
last_name AS "Last Name"
FROM Employees
ORDER BY salary DESC, last_name;

--6
SELECT employee_id AS "Employee ID",
start_date AS "Start Date",
job_id AS "Job ID"
FROM Job_History
WHERE start_date >= '2006-01-01' AND start_date < '2006-02-01'
OR start_date >= '2006-03-01' AND start_date < '2006-04-01'
ORDER BY start_date;

--7
SELECT first_name AS "First Name",
last_name AS "Last Name",
commission_pct AS "Commission Percentage"
FROM Employees
WHERE commission_pct IS NOT NULL
OR last_name LIKE '% %'
ORDER BY commission_pct DESC;

--8
SELECT employee_id AS "Employee ID",
first_name AS "First Name",
last_name AS "Last Name",
hire_date AS "Hire Date",
department_id AS "Department ID"
FROM Employees
WHERE hire_date < '2005-01-01'
OR department_id = 80
OR department_id = 90
ORDER BY hire_date;

--9
SELECT first_name AS "First Name",
last_name AS "Last Name",
salary AS "Original Salary",
salary * 1.2 AS "New Salary"
FROM Employees
WHERE salary * 1.2 < 9000
ORDER BY "New Salary";

--10
SELECT employee_id AS "Employee ID",
first_name AS "First Name",
last_name AS "Last Name"
FROM Employees
WHERE last_name LIKE 'H%'
ORDER BY first_name;

--11
/*
1. Question: Display all jobs (if any) whose 
min salary is greater than 5000. The results should 
be displayed based on the greatest salary first.
2. SQL query used: SELECT, AS, FROM, WHERE, ORDER BY DESC
3. Expected results: 3 columns show the jobs whose min salary
is greater than 5000. The 9 result rows are sorted based on the min salary
from largest to smallest.
*/
SELECT job_id AS "Job ID", 
job_title AS "Job Title", 
min_salary AS "Min Salary"
FROM Jobs
WHERE min_salary > 5000
ORDER BY min_salary DESC;