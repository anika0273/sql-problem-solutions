SELECT 
    c.customer_name,
    SUM(t.amount) AS total_spent
FROM 
    customers c
JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    c.customer_name
ORDER BY 
    total_spent DESC
LIMIT 3;
