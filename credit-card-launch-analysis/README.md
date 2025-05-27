### Problem: JPMorgan Chase – Credit Card Launch Month Analysis

JPMorgan Chase is preparing to launch a new credit card. To estimate how many cards might be issued in the first month, they want to analyze **historical launch performance** of previously released cards.

---

### Table: `monthly_cards_issued`

| Column Name   | Type     |
|----------------|----------|
| issue_month    | integer  |
| issue_year     | integer  |
| card_name      | string   |
| issued_amount  | integer  |

---

### Task

- For each credit card, determine how many cards were issued in its **launch month**.
  - The launch month is defined as the **earliest issue_month and issue_year** combination for that card.
- Return:
  - The card name.
  - The issued amount in the launch month.
- Sort the output in **descending order of issued amount**.

---

### Output Format

| card_name              | issued_amount |
|------------------------|---------------|
| Chase Sapphire Reserve | 170000        |
| Chase Freedom Flex     | 65000         |

---

### Notes

- Use `MAKE_DATE(issue_year, issue_month, 1)` to convert month/year to a proper date.-> 1st CTE
- Use a **window function** to identify the first issuance per card.-> 2nd CTE
- Only return the **earliest record per card_name**.
- Use `ROW_NUMBER()` to isolate the earliest month per card.

---