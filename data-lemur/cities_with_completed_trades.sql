/*
Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.

Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in 
descending order. Output the city name and the corresponding number of completed trade orders.

This was fairly straightforward, with the query only requiring a simple join.
*/

SELECT users.city, COUNT(*) AS num_trades_completed FROM users
JOIN trades
ON trades.user_id=users.user_id
WHERE trades.status='Completed'
GROUP BY users.city
ORDER BY num_trades_completed DESC
LIMIT 3
