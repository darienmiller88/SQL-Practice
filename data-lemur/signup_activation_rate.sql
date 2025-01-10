/*
New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate 
their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.

A senior analyst is interested to know the activation rate of specified users in the emails table. Write a query to find 
the activation rate. Round the percentage to 2 decimal places.

Definitions:

emails table contain the information of user signup details.
texts table contains the users' activation information.

Not bad at all lol
*/

SELECT 
  ROUND(
    (COUNT(CASE WHEN signup_action='Confirmed' THEN 1 END)::DECIMAL 
      / 
    COUNT(*)), 2) AS confirm_rate
FROM texts;
