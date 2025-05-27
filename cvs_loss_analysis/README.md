### Problem: CVS Health – Manufacturer Loss Analysis

CVS Health wants to understand which manufacturers are producing **loss-generating drugs**.

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

- Find drugs that resulted in a **loss** (i.e., COGS > total_sales).
- For each manufacturer:
  - Count the number of such loss-generating drugs.
  - Calculate total loss in absolute value using `(COGS - total_sales)`.
- Sort results by highest loss first.

---

### Output Format

| manufacturer | drug_count | total_loss |
|--------------|-------------|------------|
| Biogen       | 1           | 297324.73  |
| AbbVie       | 1           | 221429.36  |
| Eli Lilly    | 1           | 221422.17  |

---

### Notes

- Only include drugs with actual losses.
- Loss = `COGS - total_sales`
- Use `SUM()` and `COUNT()` in combination with `GROUP BY`

