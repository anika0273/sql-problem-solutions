### Problem: Google Sensor – Sum of Odd/Even Measurements by Day

Given a `measurements` table from a Google sensor, calculate:

- The **sum of odd-numbered** measurements (1st, 3rd, 5th…)
- The **sum of even-numbered** measurements (2nd, 4th, 6th…)

for each **day**, and display them side-by-side in separate columns.

---

### Table: `measurements`

| Column Name        | Type     |
|--------------------|----------|
| measurement_id     | integer  |
| measurement_value  | decimal  |
| measurement_time   | datetime |

---

### Example Output

| measurement_day     | odd_sum | even_sum |
|---------------------|---------|----------|
| 07/10/2022 00:00:00 | 2355.75 | 1662.74  |
| 07/11/2022 00:00:00 | 1124.50 | 1234.14  |

---

### Steps

1. Use `ROW_NUMBER()` over each day to assign measurement order.
2. Classify rows as odd/even using modulo logic.
3. Group by `DATE(measurement_time)` to compute daily aggregates.
4. Use `FILTER` inside `SUM()` to separate odd/even row sums.

---

### Notes

- Assumes PostgreSQL for use of `FILTER` and `ROW_NUMBER()`.
- Result should always group by date, not full timestamp.


