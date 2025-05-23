# 🧾 Top 3 Customers by Spending

## Problem Understanding

We have a `customers` table and a `transactions` table.  
We need to:

1. Join the two tables using `customer_id`.
2. Sum up `amount` spent by each customer.
3. Sort customers by total spending in descending order.
4. Return the top 3 customers.

## Edge Cases

- What if there are ties in total spending?
- What if fewer than 3 customers exist?

---

## Sample Data

### `customers.csv`

| customer_id | customer_name |
|-------------|---------------|
| 1           | Alice         |
| 2           | Bob           |
| 3           | Charlie       |
| 4           | Diana         |
| 5           | Evan          |

### `transactions.csv`

| transaction_id | customer_id | amount  | transaction_date |
|----------------|-------------|---------|------------------|
| 101            | 1           | 120.50  | 2023-01-01       |
| 102            | 2           | 300.00  | 2023-01-03       |
| 103            | 1           | 150.00  | 2023-01-04       |
| 104            | 3           | 300.00  | 2023-01-06       |
| 105            | 4           | 80.00   | 2023-01-07       |
| 106            | 3           | 50.00   | 2023-01-10       |
| 107            | 5           | 300.00  | 2023-01-12       |
| 108            | 2           | 50.00   | 2023-01-15       |

---

## Expected Output

| customer_name | total_spending |
|---------------|----------------|
| Charlie       | 350.00         |
| Bob           | 350.00         |
| Alice         | 270.50         |

---

## Tags

SQL, GROUP BY, ORDER BY, LIMIT, Aggregation
