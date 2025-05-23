# 💭 Thought Process

## Step 1: Join the tables
We need `customer_name` from `customers` and `amount` from `transactions`.  
Use `INNER JOIN` on `customer_id`.

## Step 2: Aggregate
Use `SUM(amount)` to get total spending per customer.

## Step 3: Sort
Sort the results by `SUM(amount)` in descending order.

## Step 4: Limit to top 3
Use `LIMIT 3` to get the top 3 spenders.

## Bonus
If there’s a tie in spending, both tied customers may be included, depending on SQL engine behavior.
