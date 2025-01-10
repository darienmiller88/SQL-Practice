/*
Assume there are three Spotify tables: artists, songs, and global_song_rank, which contain information about the artists, 
songs, and music charts, respectively.

Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table. 
Display the top 5 artist names in ascending order, along with their song appearance ranking.

If two or more artists have the same number of song appearances, they should be assigned the same ranking, and the rank 
numbers should be continuous (i.e. 1, 2, 2, 3, 4, 5). 

REASONING: Fuck this question for making me use two subqueries lol.
*/

SELECT * FROM(
  SELECT  
    artist_name,
    DENSE_RANK() OVER(ORDER BY num_rank_top_ten DESC) AS artist_rank
  FROM (
    SELECT 
      artists.artist_name, 
      COUNT(CASE WHEN global_song_rank.rank BETWEEN 1 AND 11 THEN 1 END) AS num_rank_top_ten
    FROM artists
    JOIN songs
    ON artists.artist_id=songs.artist_id
    JOIN global_song_rank
    ON global_song_rank.song_id=songs.song_id
    GROUP BY artists.artist_name
  ) as subquery
) as another_subquery
WHERE artist_rank <= 5
