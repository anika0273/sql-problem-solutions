WITH ranked_items_cte AS(

SELECT 
  category, 
  product, 
  SUM(spend) AS total_spend,
  RANK() OVER(
    PARTITION BY category
    ORDER BY SUM(spend) DESC
  ) AS ranked
FROM product_spend
WHERE EXTRACT (YEAR FROM transaction_date) = 2022
GROUP BY category, product

)

SELECT category, product, total_spend
FROM ranked_items_cte
WHERE ranked <= 2