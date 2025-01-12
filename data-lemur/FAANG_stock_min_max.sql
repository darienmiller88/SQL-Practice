/*
The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial
datasets. As a Data Analyst at Bloomberg, you have access to historical data on stock performance.

Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.

For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest and lowest
open prices (refer to the Example Output format). Ensure that the results are sorted by ticker symbol.

This one was SUPER satisfying, TO_CHAR is really powerful!
*/

SELECT 
  ticker,
  TO_CHAR(
    (SELECT date FROM stock_prices WHERE open = highest_open), 
    'Mon-YYYY'
  ) AS highest_mth,
  highest_open,
  TO_CHAR(
    (SELECT date FROM stock_prices WHERE open = lowest_open), 
    'Mon-YYYY'
  ) AS lowest_mth,
  lowest_open
FROM (
  SELECT 
    ticker,
    MAX(open) AS highest_open,
    MIN(open) AS lowest_open
  FROM stock_prices
  GROUP BY ticker
) AS subquery
ORDER BY ticker
