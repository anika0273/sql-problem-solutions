SELECT ticker, min(open)
FROM stock_prices
GROUP BY ticker 
HAVING min(open) > 100
