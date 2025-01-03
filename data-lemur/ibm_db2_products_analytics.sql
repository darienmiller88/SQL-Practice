/*
IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the 
third quarter of 2023 (July to September). Additionally, it should count the number of employees who did not run any queries
during this period.

Display the number of unique queries as histogram categories, along with the count of employees who executed that number of 
unique queries.

THIS WAS REALLY HARD! I eventually came up with a completely unique solution, though I don't know if it's partiucarly efficient.
I ended up finding out how many employees had 0 queries, and unioned that with a query that found out how many users had 1, 2, 3, etc
queries. 
*/

SELECT 0 AS unique_queries, COUNT(*) AS employee_count FROM employees WHERE employee_id NOT IN (
  SELECT employee_id FROM queries
  WHERE query_starttime BETWEEN '07/01/2023' AND '10/01/2023'
)
UNION 
SELECT unique_queries, COUNT(*) AS employee_count FROM (
  SELECT 
    employees.employee_id,
    COUNT(*) AS unique_queries 
  FROM employees
  JOIN queries
  ON queries.employee_id=employees.employee_id
  WHERE queries.query_starttime BETWEEN '07/01/2023' AND '10/01/2023'
  GROUP BY employees.employee_id 
) AS employee_queries
GROUP BY unique_queries
ORDER BY unique_queries
