### Problem: Top 3 Cities by Completed Trades on Robinhood

Given `trades` and `users` tables, write a query to **find the top 3 cities** with the highest number of completed trade orders.

#### Table: `trades`

| Column Name | Type     |
|-------------|----------|
| order_id    | integer  |
| user_id     | integer  |
| quantity    | integer  |
| status      | string ('Completed', 'Cancelled') |
| date        | timestamp |
| price       | decimal(5,2) |

#### Table: `users`

| Column Name | Type     |
|-------------|----------|
| user_id     | integer  |
| city        | string   |
| email       | string   |
| signup_date | datetime |

---

### Example Output:

| city           | total_orders |
|----------------|--------------|
| San Francisco  | 3            |
| Boston         | 2            |
| Denver         | 1            |

---

### Thought Process

- Join `trades` with `users` on `user_id`.
- Filter to only `Completed` trades.
- Group by city.
- Order by count in descending order.
- Limit to top 3 cities.


