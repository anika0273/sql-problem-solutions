-- Filter the top 10 songs 
WITH top_ten_rank_cte AS (
  SELECT s.song_id, s.artist_id
  FROM global_song_rank AS g
  JOIN songs AS s ON g.song_id = s.song_id
  WHERE g.rank <= 10
),

-- join the artists table and count the number of songs per artist (group by the artists) 
artist_song_count_cte AS (
  SELECT 
    a.artist_name,
    COUNT(*) AS total_songs_in_top_ten
  FROM top_ten_rank_cte AS t
  JOIN artists AS a ON t.artist_id = a.artist_id
  GROUP BY a.artist_name
),

--finally rank the artists depending on the number of songs
ranked_artists_cte AS (
  SELECT 
    artist_name,
    total_songs_in_top_ten,
    DENSE_RANK() OVER (
      ORDER BY total_songs_in_top_ten DESC
    ) AS artist_rank
  FROM artist_song_count_cte
)

-- Here we just select the top 5 artists
SELECT artist_name, artist_rank
FROM ranked_artists_cte
WHERE artist_rank <= 5
ORDER BY artist_rank ASC;
