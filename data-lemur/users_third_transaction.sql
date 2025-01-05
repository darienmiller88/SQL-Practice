/*
Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third 
transaction of every user. Output the user id, spend and transaction date.

 I learned how to use RANK()! It's a cool function.
*/

SELECT user_id, spend, transaction_date FROM (
  SELECT 
    user_id, 
    spend, 
    transaction_date,  
    RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) AS transaction_rank
  FROM transactions
) AS subquery 
WHERE transaction_rank >= 3
