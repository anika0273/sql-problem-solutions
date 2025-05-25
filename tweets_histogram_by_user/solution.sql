WITH tweet_count_cte AS(

  SELECT user_id, COUNT(*) AS tweet_bucket 
  FROM tweets
  WHERE EXTRACT (YEAR FROM tweet_date) = 2022
  GROUP BY user_id
  
)

SELECT tweet_bucket, COUNT(user_id) AS users_num
FROM tweet_count_cte
GROUP BY tweet_bucket
ORDER BY tweet_bucket