/*
Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of 
days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number 
of the days between each user's first and last post.

After figuring out how to find out the amount of days between two dates in Postgres, the solution became simple.

*/

SELECT user_id, 
MAX(post_date)::date - MIN(post_date)::date
AS days_between 
FROM posts
GROUP BY user_id
HAVING EXTRACT(YEAR FROM MAX(post_date)) = '2021'
AND COUNT(*) >= 2
