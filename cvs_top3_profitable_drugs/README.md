### Problem: CVS Health – Top 3 Most Profitable Drugs

CVS wants to analyze its pharmacy sales to identify the most profitable drugs.

**Profit Formula**:  
`Total Profit = Total Sales - Cost of Goods Sold (COGS)`

---

### Table: `pharmacy_sales`

| Column Name   | Type     |
|---------------|----------|
| product_id    | integer  |
| units_sold    | integer  |
| total_sales   | decimal  |
| cogs          | decimal  |
| manufacturer  | varchar  |
| drug          | varchar  |

---

### Task

- Calculate the total profit per drug.
- Return the top 3 most profitable drugs.
- Output should be in descending order of profit.

---

### Example Output

| drug            | total_profit |
|------------------|--------------|
| Zyprexa          | 84576.53     |
| Varicose Relief  | 80926.64     |
| Surmontil        | 79815.03     |

---

### Notes

- Each drug is produced by only one manufacturer.
- No ties in profit — safe to use `LIMIT 3`.

