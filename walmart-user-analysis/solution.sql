WITH sort_date_cte AS (
  SELECT 
    transaction_date,	user_id,
    RANK() OVER(
      PARTITION BY user_id ORDER BY transaction_date DESC
    ) AS recent_date
  FROM user_transactions
),

find_recent_date_cte AS(
  SELECT 
    transaction_date,	user_id
  FROM sort_date_cte
  WHERE recent_date = 1
)

SELECT 
  transaction_date,	user_id,
  COUNT(*) AS purchase_count
FROM find_recent_date_cte
 GROUP BY user_id, transaction_date
 ORDER BY transaction_date, user_id
