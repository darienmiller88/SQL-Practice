/*
A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product 
category listed in the products table.

Write a query that identifies the customer IDs of these Supercloud customers.

I wrote a super hacky query before this one, so I had to improve it lol.
*/

SELECT 
  customer_contracts.customer_id
FROM customer_contracts
JOIN products
ON products.product_id=customer_contracts.product_id
GROUP BY customer_contracts.customer_id
HAVING COUNT(DISTINCT product_category) = (
  SELECT COUNT(DISTINCT product_category) FROM products
)
