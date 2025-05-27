WITH full_date_cte AS (
  SELECT 
    issue_month,	issue_year,
    MAKE_DATE(issue_year, issue_month, 1) AS issue_date,
    card_name,	issued_amount
  FROM monthly_cards_issued
),

sorted_date_cte AS (
  SELECT 
    card_name, issued_amount, issue_date,
    ROW_NUMBER() OVER(
      PARTITION BY card_name ORDER BY issue_date 
    ) AS row_num
  FROM full_date_cte
)

SELECT card_name, issued_amount
FROM sorted_date_cte
WHERE row_num = 1
ORDER BY issued_amount DESC