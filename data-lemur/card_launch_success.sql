-- Your team at JPMorgan Chase is soon launching a new credit card. You are asked to estimate how many cards you'll issue in 
-- the first month.

-- Before you can answer this question, you want to first get some perspective on how well new credit card launches typically 
-- do in their first month.

-- Write a query that outputs the name of the credit card, and how many cards were issued in its launch month. The launch 
-- month is the earliest record in the monthly_cards_issued table for a given card. Order the results starting from the 
-- biggest issued amount.

-- monthly_cards_issued Table:
-- Column Name	Type
-- issue_month	integer
-- issue_year	integer
-- card_name	string
-- issued_amount	integer
--
-- First SQL question that didn't take me a month to figure out lmao


SELECT 
  card_name,
  issued_amount
FROM
(
  SELECT
    issue_date, 
    card_name,
    issued_amount,
    RANK() OVER(PARTITION BY card_name ORDER BY issue_date) as rank
  FROM (
  SELECT 
    card_name,
    issued_amount,
    issue_month || '/' || issue_year AS issue_date
  FROM monthly_cards_issued
  ) AS monthly_cards_issued_date
) AS monthly_cards_issued_rank
WHERE rank = 1
ORDER BY issued_amount DESC
