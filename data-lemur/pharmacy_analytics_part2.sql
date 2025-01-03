/*
CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. 
Each drug is exclusively manufactured by a single manufacturer.

Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and 
calculate the total amount of losses incurred.

Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value.
Display the results sorted in descending order with the highest losses displayed at the top.

REASONING: This one was quite interesting, though I'm not sure my solution is perfectly efficient. 
*/

SELECT manufacturer, num_drugs_profitable, total_loss FROM (
  SELECT 
    manufacturer,
    COUNT(CASE WHEN total_sales - cogs < 0 THEN 1 END) as num_drugs_profitable,
    ABS(SUM(CASE WHEN total_sales - cogs < 0 THEN total_sales - cogs ELSE 0 END)) AS total_loss
  FROM pharmacy_sales
  GROUP BY manufacturer
) AS subquery
WHERE num_drugs_profitable > 0
ORDER BY total_loss DESC
