SELECT u.city, COUNT(*) AS total_orders
FROM trades AS t 
LEFT JOIN users as u 
ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3