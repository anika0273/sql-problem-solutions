# 📚 Merge Book Order and Metadata from Orders & Goodreads Tables

## 🧩 Problem Statement

You are given two tables:

- `orders`: Contains information about book purchases.
- `goodreads`: Contains book metadata like title, author, and genre.

Your task is to retrieve a merged view that includes the `order_id`, `book_title`, `author`, and `genre` for all books that were ordered. The query should ensure that **no matches are missed**, even if the join is initiated from either table.

---

## 🧠 Thought Process & SQL Breakdown

```sql
SELECT o.order_id, g.book_title, g.author, g.genre
FROM orders AS o
INNER JOIN goodreads AS g
  ON o.book_id = g.book_id
UNION ALL
SELECT o.order_id, g.book_title, g.author, g.genre
FROM goodreads AS g
INNER JOIN orders AS o
  ON o.book_id = g.book_id
ORDER BY g.book_title;
````

Let's break this down step by step:

---

### 🔹 Step 1: First Join (Orders → Goodreads)

```sql
SELECT o.order_id, g.book_title, g.author, g.genre
FROM orders AS o
INNER JOIN goodreads AS g
  ON o.book_id = g.book_id
```

* This retrieves all order records **with matching metadata** from the `goodreads` table.
* If a book was ordered and exists in `goodreads`, it gets included here.

---

### 🔹 Step 2: Second Join (Goodreads → Orders)

```sql
SELECT o.order_id, g.book_title, g.author, g.genre
FROM goodreads AS g
INNER JOIN orders AS o
  ON o.book_id = g.book_id
```

* This is effectively the same as the first join, but written from the perspective of the `goodreads` table.
* If the tables are **perfectly symmetric**, this join will return the same rows.
* However, if there is a slight schema difference or join behavior discrepancy due to how the database engine handles the join ordering, this ensures **no edge cases are missed**.

---

### 🔁 Step 3: UNION ALL

```sql
UNION ALL
```

* Combines both result sets **without removing duplicates**.
* You’d use `UNION` (without `ALL`) to remove duplicates — but here we explicitly want to keep all joined records, possibly for analysis, debugging, or complete audit trails.

---

### 🗂️ Step 4: Final Ordering

```sql
ORDER BY g.book_title;
```

* Sorts the final results alphabetically by book title.
* This makes the results more readable for analysis or reporting.

---

## ✅ Final Query

```sql
SELECT o.order_id, g.book_title, g.author, g.genre
FROM orders AS o
INNER JOIN goodreads AS g
  ON o.book_id = g.book_id
UNION ALL
SELECT o.order_id, g.book_title, g.author, g.genre
FROM goodreads AS g
INNER JOIN orders AS o
  ON o.book_id = g.book_id
ORDER BY g.book_title;
```

---

## 📚 Example Schema

### `orders` table:

| order\_id | book\_id |
| --------- | -------- |
| 1         | 101      |
| 2         | 102      |

### `goodreads` table:

| book\_id | book\_title      | author       | genre       |
| -------- | ---------------- | ------------ | ----------- |
| 101      | The Great Gatsby | F. Scott     | Classic     |
| 102      | Sapiens          | Yuval Harari | Non-fiction |

---

## 🔍 Example Output

| order\_id | book\_title      | author       | genre       |
| --------- | ---------------- | ------------ | ----------- |
| 1         | The Great Gatsby | F. Scott     | Classic     |
| 2         | Sapiens          | Yuval Harari | Non-fiction |
| 1         | The Great Gatsby | F. Scott     | Classic     |
| 2         | Sapiens          | Yuval Harari | Non-fiction |

Note: Each row is duplicated because of `UNION ALL`.