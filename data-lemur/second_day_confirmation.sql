/*
Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text. 
New users on TikTok sign up using their email addresses, and upon sign-up, each user receives a text message confirmation
to activate their account.

Write a query to display the user IDs of those who did not confirm their sign-up on the first day, but confirmed on the second day.

Another smooth SQL query.
*/

SELECT 
  emails.user_id
FROM emails
JOIN texts
ON texts.email_id=emails.email_id
GROUP BY emails.user_id
HAVING COUNT(CASE WHEN texts.signup_action='Not confirmed' THEN 1 END) = 1
