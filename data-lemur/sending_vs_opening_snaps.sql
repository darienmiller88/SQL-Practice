/*
Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.

Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these 
activities grouped by age group. Round the percentage to 2 decimal places in the output.

Notes:

Calculate the following percentages:
time spent sending / (Time spent sending + Time spent opening)
Time spent opening / (Time spent sending + Time spent opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.

This question was very fun to do! I just had to switch from COUNT to SUM.
*/

SELECT 
  age_breakdown.age_bucket, 
  ROUND((SUM(CASE WHEN activity_type='send' THEN time_spent END)::DECIMAL 
    / 
  SUM(CASE WHEN activity_type='open' OR activity_type='send' THEN time_spent END)) * 100, 2)
  AS send_percent,
  ROUND((SUM(CASE WHEN activity_type='open' THEN time_spent END)::DECIMAL 
    / 
  SUM(CASE WHEN activity_type='open' OR activity_type='send' THEN time_spent END)) * 100, 2)
  AS open_percent
FROM age_breakdown
JOIN activities
ON activities.user_id=age_breakdown.user_id
GROUP BY age_breakdown.age_bucket
