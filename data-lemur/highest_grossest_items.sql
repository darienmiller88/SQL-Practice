/*
Assume you're given a table containing data on Amazon customers and their spending on products in different category, write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, 
and total spend.

This one was tricky lol.
*/

SELECT 
  category, 
  product, 
  total_spend
FROM(
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    COUNT(*) AS num_products,
    RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) as rank
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
) AS subquery 
WHERE rank=1 OR rank=2
