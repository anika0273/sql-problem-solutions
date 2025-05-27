### Problem: Spotify – Top Artists with Most Songs in Top 10

Spotify wants to highlight the **top 5 artists** whose songs have appeared **most frequently in the Top 10** of their global chart rankings.

---

### Tables

#### `artists`

| Column Name  | Type    |
|--------------|---------|
| artist_id    | integer |
| artist_name  | varchar |
| label_owner  | varchar |

#### `songs`

| Column Name  | Type    |
|--------------|---------|
| song_id      | integer |
| artist_id    | integer |
| name         | varchar |

#### `global_song_rank`

| Column Name  | Type    |
|--------------|---------|
| day          | integer (1–52) |
| song_id      | integer |
| rank         | integer (1–1,000,000) |

---

### Task

- Identify the top 5 artists whose songs appear **most frequently in the Top 10** (i.e., `rank <= 10`) of the global song rankings.
- Use **dense ranking** to assign artist ranks. If two artists have the same number of appearances, assign the same rank and skip no numbers (e.g., 1, 2, 2, 3, 4, 5).
- Return artist name and artist rank in **ascending order by rank**.

---

### Output Format

| artist_name | artist_rank |
|-------------|-------------|
| Ed Sheeran  | 1           |
| Drake       | 2           |
| Bad Bunny   | 2           |

---

### Notes

- Use `JOIN` to connect `songs` with `global_song_rank` and `artists`.
- Filter only rows with `rank <= 10`.
- Count the number of appearances for each artist using `COUNT()`.
- Use `DENSE_RANK()` to assign ranks based on descending counts.
- Limit results to **Top 5** ranks and order the output by `artist_rank ASC`.

---

### SQL Solution (in `solution.sql`)

```sql
WITH top_ten_rank_cte AS (
  SELECT 
    a.artist_name
  FROM global_song_rank AS g
  JOIN songs AS s ON g.song_id = s.song_id
  JOIN artists AS a ON s.artist_id = a.artist_id
  WHERE g.rank <= 10
),
artist_song_counts AS (
  SELECT 
    artist_name,
    COUNT(*) AS total_songs_in_top_ten
  FROM top_ten_rank_cte
  GROUP BY artist_name
),
artist_ranked_cte AS (
  SELECT 
    artist_name,
    DENSE_RANK() OVER (
      ORDER BY total_songs_in_top_ten DESC
    ) AS artist_rank
  FROM artist_song_counts
)
SELECT 
  artist_name,
  artist_rank
FROM artist_ranked_cte
WHERE artist_rank <= 5
ORDER BY artist_rank;
