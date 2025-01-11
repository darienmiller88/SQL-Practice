/*
Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements 
taken multiple times within each day.

Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and 
display the results in two different columns. Refer to the Example Output below for the desired format.

Definition:

Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, and measurements
taken at 2nd, 4th, and 6th times are considered even-numbered measurements.

I  liked this one! just had to learn how to use the DATE() function.
*/

SELECT 
  measurement_time,
  SUM(CASE WHEN rank % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum,
  SUM(CASE WHEN rank % 2 > 0 THEN measurement_value ELSE 0 END) AS odd_sum
FROM (
  SELECT 
    DATE(measurement_time) AS measurement_time, 
    measurement_value,
    RANK() OVER(PARTITION BY EXTRACT(DAY FROM measurement_time) ORDER BY measurement_time ASC)  
  FROM measurements
) AS subquery
GROUP BY measurement_time
ORDER BY measurement_time
