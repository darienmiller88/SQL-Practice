/*
Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. The output should
display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first 
by month and then by product ID.

I was thrown of by thr ordering at first, and then realized i had to order by month and id after grouping.
*/

SELECT 
  EXTRACT(MONTH FROM submit_date) as mth, 
  product_id, 
  ROUND(AVG(stars), 2) as avg_stars FROM reviews
GROUP BY product_id, mth
ORDER BY mth
