/*
CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.

Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report
your results in descending order of total sales. In case of any duplicates, sort them alphabetically by the manufacturer name.

Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million".


*/

SELECT manufacturer, '$' || 
  CASE 
    WHEN SUM(total_sales) >= 1000000 THEN ROUND((SUM(total_sales) / 1000000)::DECIMAL, 0) || ' million'
    ELSE TO_CHAR(SUM(total_sales), 'FM999999.99') 
  END as formatted_sales
FROM pharmacy_sales
GROUP BY manufacturer
