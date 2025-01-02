/*
Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) 
for the app in 2022 and round the results to 2 decimal places.

I forgot that ROUND doesn't float or double precision, so I was frustrated for a bit trying to get 2 decimal places.
*/

SELECT 
  app_id, 
  ROUND(
    ((COUNT(CASE WHEN event_type='click' THEN 1 END)::NUMERIC / 
  COUNT(CASE WHEN event_type='impression' THEN 1 END))) * 100, 
  2)
  AS ctr 
FROM events
WHERE EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY app_id
