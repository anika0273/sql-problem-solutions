### Problem: FAANG Stocks with Open Price Always Above $100

Use SQL's `HAVING` and `MIN` to find all FAANG stocks whose **open share price was always greater than $100**.

#### Table: `stock_prices`

| Column Name | Type      |
|-------------|-----------|
| date        | timestamp |
| ticker      | string    |
| open        | float     |
| high        | float     |
| low         | float     |
| close       | float     |

---

### Example Output:

| ticker | min  |
|--------|------|
| NFLX   | 326.10 |
| MSFT   | 158.78 |

---

### Thought Process

- Group the data by ticker.
- Use `MIN(open)` to find the lowest open price per ticker.
- Use `HAVING` to filter tickers where `MIN(open)` > 100.

