/*
In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. 
A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

List the user IDs who have gone on at least 1 shopping spree in ascending order.

I hated this question with a passion, I don't even fully know if it's correct
*/

SELECT
 user_id
FROM (
SELECT 
  user_id, 
  transaction_date,
  transaction_date::DATE
  - 
  LAG(transaction_date::DATE) OVER(PARTITION BY user_id ORDER BY transaction_date)
  AS day_difference
FROM transactions
) as subquery
WHERE day_difference=1
GROUP BY user_id
HAVING COUNT(*) >= 2
