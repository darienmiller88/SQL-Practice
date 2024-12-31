/*
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who 
are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

In order to solve this, I grouped the users by candidate id, and then I used a conditional count to which user has all three of the specified skill from the skills column.
*/

SELECT candidate_id FROM candidates
GROUP BY candidate_id
HAVING COUNT(
  CASE 
    WHEN skill='PostgreSQL' THEN 1
    WHEN skill='Tableau' THEN 1
    WHEN skill='Python' THEN 1
    ELSE NULL
  END
) = 3
