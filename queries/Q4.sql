--4 Identify paintings whose asking price is less than 50% of their regular pri

SELECT size_id, work_id, sale_price, regular_price
FROM product_size
WHERE sale_price < (regular_price * 0.5);
