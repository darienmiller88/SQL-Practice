/*
Imagine you're an HR analyst at a tech company tasked with analyzing employee salaries. Your manager is keen on understanding the pay distribution and asks 
you to determine the second highest salary among all employees.

It's possible that multiple employees may share the same second highest salary. In case of duplicate, display the salary only once.
*/

SELECT salary AS second_highest_salary FROM(
SELECT 
  name,
  salary,
  department_id,
  RANK() OVER (ORDER BY salary DESC) as salary_rank
FROM employee
) as subquery
WHERE salary_rank=2
