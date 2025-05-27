/* Assign the ROW_NUMBER to each row so we can determine 
odd-numbered and even-numbered measurements for a particular day 
WINDOW FUNCTION is applied to seperate the day */


WITH row_numbered_cte AS (
  SELECT 
  measurement_id,	measurement_value,	measurement_time,
  ROW_NUMBER() OVER(
    PARTITION BY EXTRACT(DAY FROM measurement_time) 
    ORDER BY measurement_time
  ) AS sorted_row
  FROM measurements
)


/*
CAST the measurement_time timestamp to DATE tipe (without the time)
find total measurement_value using a FILTER function to define the odd row and even row
use GROUP BY as we are using AGGREGATE function SUM()
Finally ORDER BY the measurement DATE
*/
SELECT 
  CAST(measurement_time AS DATE) AS measurement_day,
  SUM(measurement_value) FILTER(WHERE sorted_row%2 != 0) AS odd_sum,
  SUM(measurement_value) FILTER(WHERE sorted_row%2 = 0) AS even_sum
FROM row_numbered_cte
GROUP BY measurement_day
ORDER BY measurement_day;