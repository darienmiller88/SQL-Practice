/*
As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying 
high earners in each department. A 'high earner' within a department is defined as an employee with a salary ranking among
the top three salaries within that department.

You're tasked with identifying these high earners across all departments. Write a query to display the employee's name 
along with their department name and salary. In case of duplicates, sort the results of department name in ascending order,
then by salary in descending order. If multiple employees have the same salary, then order them alphabetically.

Note: Ensure to utilize the appropriate ranking window function to handle duplicate salaries effectively.

First medium challenge where I figured out most of it! Just had to learn the difference between DENSE_RANK() and RANK().
*/

SELECT 
    department_name,
    name,
    salary
FROM(
  SELECT 
    department.department_name ,
    employee.name,
    employee.salary,
    DENSE_RANK() OVER(PARTITION BY department.department_name ORDER BY salary DESC) AS rank
  FROM employee
  JOIN department
  ON department.department_id=employee.department_id
) as subquery
WHERE rank in (1, 2, 3)
