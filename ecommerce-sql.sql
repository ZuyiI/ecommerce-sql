-- a. How does the payment method affect the completion or cancellation of orders?
SELECT 
    payment_method,
    COUNT(item_id) AS total_orders,
    COUNT(CASE WHEN status = 'complete' THEN 1 END) AS completed_orders,
    COUNT(CASE WHEN status = 'canceled' THEN 1 END) AS canceled_orders,
    ROUND(COUNT(CASE WHEN status = 'complete' THEN 1 END) * 100.0 / COUNT(item_id), 2) AS completion_rate
FROM 
    pakistan_largest_ecommerce_dataset
GROUP BY 
    payment_method
ORDER BY 
    completion_rate DESC;

   
/* b. Are there certain product categories that have higher cancellation rates compared to others?
 * If yes, what might be the reason for it? */
SELECT 
    category_name_1 AS category,
    COUNT(item_id) AS total_orders,
    COUNT(CASE WHEN status = 'canceled' THEN 1 END) AS canceled_orders,
    ROUND(COUNT(CASE WHEN status = 'canceled' THEN 1 END) * 100.0 / COUNT(item_id), 2) AS cancellation_rate
FROM 
    pakistan_largest_ecommerce_dataset
GROUP BY 
    category_name_1
ORDER BY 
    cancellation_rate DESC;
   

-- b.i. What is the average price of items per product category?
SELECT 
    category_name_1 AS category, 
    ROUND(AVG(price), 0) as avg_price
FROM 
    pakistan_largest_ecommerce_dataset
WHERE 
    status = 'complete'  -- Only consider completed orders
GROUP BY 
    category_name_1
ORDER BY 
    avg_price DESC;
   

-- c. Is there any relationship between the price of the item product and the likelihood of the order being canceled?
SELECT 
    CASE 
        WHEN price < 500 THEN 'Below 500'
        WHEN price BETWEEN 500 AND 1000 THEN '500 - 1000'
        WHEN price BETWEEN 1001 AND 2000 THEN '1001 - 2000'
        ELSE 'Above 2000'
    END AS price_range,
    COUNT(item_id) AS total_orders,
    COUNT(CASE WHEN status = 'canceled' THEN 1 END) AS canceled_orders,
    ROUND(COUNT(CASE WHEN status = 'canceled' THEN 1 END) * 100.0 / COUNT(item_id), 2) AS cancellation_rate
FROM 
    pakistan_largest_ecommerce_dataset
GROUP BY 
    price_range
ORDER BY 
    price_range;

   
-- c.i. Does having discounts affect cancellation of orders?
SELECT
    COUNT(*) AS total_canceled_orders,
    SUM(CASE WHEN discount_amount > 0 THEN 1 ELSE 0 END) AS canceled_orders_with_discount,
    SUM(CASE WHEN discount_amount = 0 THEN 1 ELSE 0 END) AS canceled_orders_without_discount,
    ROUND(SUM(CASE WHEN discount_amount > 0 THEN 1 ELSE 0 END)::numeric / COUNT(*)::numeric, 2) * 100 AS percent_canceled_with_discount,
    ROUND(SUM(CASE WHEN discount_amount = 0 THEN 1 ELSE 0 END)::numeric / COUNT(*)::numeric, 2) * 100 AS percent_canceled_without_discount
FROM
    pakistan_largest_ecommerce_dataset
WHERE
    status = 'canceled';
    
   
