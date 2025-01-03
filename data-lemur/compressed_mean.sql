/*
You're trying to find the mean number of items per order on Alibaba, rounded to 1 decimal place using tables which includes 
information on the count of items in each order (item_count table) and the corresponding number of orders for each item 
count (order_occurrences table).

Explanation
Let's calculate the arithmetic average:

Total items = (1*500) + (2*1000) + (3*800) + (4*1000) = 8900

Total orders = 500 + 1000 + 800 + 1000 = 3300

Mean = 8900 / 3300 = 2.7

REASONING: Another simple query, just needed to use the SUM function
*/

SELECT 
  ROUND(
   (SUM(order_occurrences * item_count) 
    /
    SUM(order_occurrences))::DECIMAL,
    1
  )
FROM items_per_order;
