/*
Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, write a query 
that retrieve the users along with the number of products they bought.

Output the user's most recent transaction date, user ID, and the number of products, sorted in chronological order 
by the transaction date.

This took way too long lmao. Left it unfinished for like 3 weeks
*/

SELECT
  transaction_date, 
  user_id, 
  purchase_count
FROM (
  SELECT 
    transaction_date, 
    user_id, 
    COUNT(*) AS purchase_count,
    RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC)
FROM user_transactions
GROUP BY user_id, transaction_date
) as subquery
WHERE rank = 1
ORDER BY transaction_date
