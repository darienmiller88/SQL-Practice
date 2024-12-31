/*
Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

In order to solve this, I simply used a subquery to find all of the rows in the page_likes table, and had a main query to check which rows in the pages table to are NOT in the 
page_likes table
*/

SELECT page_id 
FROM pages 
WHERE page_id NOT IN (
  SELECT page_id FROM page_likes
);
