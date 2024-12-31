/*
QUESTION:

Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the 
bucket and the number of Twitter users who fall into that bucket.

In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

In order to do this, I needed to first create a table detailing how much tweets each user tweeted, which was accomplished simply by using group by. Afterwards,
I had to turn that into a subquery so I can count how many of those users tweeted 1, 2, 3, etc tweets by grouping by the number of tweets.
*/

SELECT num_tweets, COUNT(*) as num_users FROM
(
  SELECT user_id, COUNT(*) as num_tweets FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = '2022'
  GROUP BY user_id
) AS num_tweets_table
GROUP BY num_tweets
