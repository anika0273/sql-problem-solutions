# 🛒 Walmart User Purchase Analysis (SQL)

## Problem Statement

Given a table of user transactions at Walmart, find each user's **most recent transaction date** and the **number of products they purchased** on that date.

## 🧠 Thought Process

I broke down the problem into clear steps to keep it intuitive:

1. **Rank transactions by recency** per user using `RANK()` window function.
2. **Filter** to only the most recent transaction per user.
3. **Count** how many products each user purchased in that transaction.
4. **Sort** the final output by transaction date and user ID.

> This solution is beginner-friendly and readable — no nested subqueries or complex joins.

---

## 🧾 Sample Input (`user_transactions.csv`)

| product_id | user_id | spend  | transaction_date       |
|------------|---------|--------|------------------------|
| 3673       | 123     | 68.90  | 07/08/2022 12:00:00    |
| 9623       | 123     | 274.10 | 07/08/2022 12:00:00    |
| 1467       | 115     | 19.90  | 07/08/2022 12:00:00    |
| 2513       | 159     | 25.00  | 07/08/2022 12:00:00    |
| 1452       | 159     | 74.50  | 07/10/2022 12:00:00    |

---

## ✅ Output

| transaction_date       | user_id | purchase_count |
|------------------------|---------|----------------|
| 07/08/2022 12:00:00    | 115     | 1              |
| 07/08/2022 12:00:00    | 123     | 2              |
| 07/10/2022 12:00:00    | 159     | 1              |

---

## 🧾 SQL Query

```sql
WITH sort_date_cte AS (
  SELECT 
    transaction_date, user_id,
    RANK() OVER(
      PARTITION BY user_id ORDER BY transaction_date DESC
    ) AS recent_date
  FROM user_transactions
),

find_recent_date_cte AS (
  SELECT 
    transaction_date, user_id
  FROM sort_date_cte
  WHERE recent_date = 1
)

SELECT 
  transaction_date, user_id,
  COUNT(*) AS purchase_count
FROM find_recent_date_cte
GROUP BY user_id, transaction_date
ORDER BY transaction_date, user_id;
