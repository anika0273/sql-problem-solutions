# SQL Problem – Find Data Science Candidates

## 🧠 Problem Statement

Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in **Python**, **Tableau**, and **PostgreSQL**.

### ❗️Constraints:
- No duplicates in the `candidates` table.
- Return candidate IDs who have **all three** required skills.
- Sort the output by `candidate_id` in ascending order.

### 📋 Table: `candidates`

| candidate_id | skill       |
|--------------|-------------|
| 123          | Python      |
| 123          | Tableau     |
| 123          | PostgreSQL  |
| 234          | R           |
| 234          | PowerBI     |
| 234          | SQL Server  |
| 345          | Python      |
| 345          | Tableau     |

---

## 💡 Thought Process

- Step 1: Think about how to group candidate skills.
- Step 2: Use aggregation to check if all 3 skills are present.
- Step 3: Filter candidates who meet all the required criteria.
- Step 4: Sort by `candidate_id`.

---

## 🗃️ Sample Data

See `candidates.csv`.

---

## 📌 Your Task

Implement the solution in `solution.sql`. Test it using your preferred SQL environment (e.g., PostgreSQL, SQLite, DuckDB).

---