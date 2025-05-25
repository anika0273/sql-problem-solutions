# Top 2 Highest-Grossing Products by Category in 2022

## 🧠 Problem Understanding

We have a `product_spend` table with records of transactions, including the category, product, user, spend amount, and transaction date.

### Objective

Write a SQL query to:
1. Filter transactions that occurred in **2022**.
2. Calculate the **total spend per product** within each category.
3. For **each category**, return the **top two highest-grossing products** based on total spend.

### Output Columns

- `category`
- `product`
- `total_spend`

## 🔎 Edge Cases

- What if a category has only one product in 2022?
- What if multiple products have the same total spend?

## 🗃️ Dataset: `product_spend.csv`

| category     | product           | user_id | spend  | transaction_date     |
|--------------|-------------------|---------|--------|-----------------------|
| appliance    | refrigerator       | 165     | 246.00 | 12/26/2021 12:00:00   |
| appliance    | refrigerator       | 123     | 299.99 | 03/02/2022 12:00:00   |
| appliance    | washing machine    | 123     | 219.80 | 03/02/2022 12:00:00   |
| electronics  | vacuum             | 178     | 152.00 | 04/05/2022 12:00:00   |
| electronics  | wireless headset   | 156     | 249.90 | 07/08/2022 12:00:00   |
| electronics  | vacuum             | 145     | 189.00 | 07/15/2022 12:00:00   |

## 💡 Thought Process

1. Filter `transaction_date` to the year 2022.
2. Group by `category` and `product`, and sum the `spend`.
3. Use a **window function (RANK or DENSE_RANK)** to rank products by total spend within each category. I prefer WINDOW FUNCTION for solving this kind of problem, WE can break it down in sections and approach the problem step by step. 
4. Return the top 2 for each category.

