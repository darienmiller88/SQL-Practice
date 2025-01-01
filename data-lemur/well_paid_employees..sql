/*
Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are 
any employees earning more than their direct managers.

As a HR Analyst, you're asked to identify all employees who earn more than their direct managers. The result should
include the employee's ID and name.

The hardest part was trying to conceptualize how a self join works, which definitely took a while.
*/

SELECT e1.employee_id as employee_id, e1.name as employee_name
FROM employee e1
JOIN employee e2 
ON e1.manager_id=e2.employee_id
WHERE e1.salary > e2.salary
