-- ============================================================
-- Sephora Product Analytics
-- Business Questions & Insights
-- ============================================================


-- ============================================================
-- Business Question 1
-- Which brands offer the largest number of products?
-- ============================================================

SELECT
    brand,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY brand
ORDER BY total_products DESC
LIMIT 10;


-- ============================================================
-- Business Question 2
-- Which product categories have the most products?
-- ============================================================

SELECT
    category,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY category
ORDER BY total_products DESC
LIMIT 10;


-- ============================================================
-- Business Question 3
-- Which products have the highest customer engagement?
-- (Most "Loved" products)
-- ============================================================

SELECT
    brand,
    name,
    love,
    number_of_reviews
FROM sephora_products
ORDER BY love DESC
LIMIT 10;


-- ============================================================
-- Business Question 4
-- Which products have the highest ratings?
-- (Only products with at least 100 reviews)
-- ============================================================

SELECT
    brand,
    name,
    rating,
    number_of_reviews
FROM sephora_products
WHERE number_of_reviews >= 100
ORDER BY rating DESC,
         number_of_reviews DESC
LIMIT 10;


-- ============================================================
-- Business Question 5
-- Do higher-priced products receive better ratings?
-- ============================================================

SELECT
    CASE
        WHEN price < 25 THEN 'Under $25'
        WHEN price BETWEEN 25 AND 50 THEN '$25-$50'
        WHEN price BETWEEN 50 AND 100 THEN '$50-$100'
        ELSE '$100+'
    END AS price_range,

    ROUND(AVG(price),2) AS average_price,

    ROUND(AVG(rating),2) AS average_rating,

    COUNT(*) AS total_products

FROM sephora_products

GROUP BY price_range

ORDER BY average_price;


-- ============================================================
-- Business Question 6
-- Which brands have the highest average ratings?
-- (Minimum of 10 products)
-- ============================================================

SELECT
    brand,
    ROUND(AVG(rating),2) AS average_rating,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY brand
HAVING COUNT(*) >= 10
ORDER BY average_rating DESC,
         total_products DESC
LIMIT 10;


-- ============================================================
-- Business Question 7
-- Which brands generate the most customer engagement?
-- ============================================================

SELECT
    brand,
    ROUND(AVG(love),0) AS average_loves,
    SUM(love) AS total_loves,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY brand
ORDER BY total_loves DESC
LIMIT 10;


-- ============================================================
-- Business Question 8
-- Which categories receive the highest average ratings?
-- (Minimum of 20 products)
-- ============================================================

SELECT
    category,
    ROUND(AVG(rating),2) AS average_rating,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY category
HAVING COUNT(*) >= 20
ORDER BY average_rating DESC
LIMIT 10;


-- ============================================================
-- Business Question 9
-- How many products are Online Only?
-- ============================================================

SELECT
    online_only,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY online_only;


-- ============================================================
-- Business Question 10
-- How many products are Exclusive?
-- ============================================================

SELECT
    exclusive,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY exclusive;


-- ============================================================
-- Business Question 11
-- Which brands have the highest average prices?
-- (Minimum of 10 products)
-- ============================================================

SELECT
    brand,
    ROUND(AVG(price),2) AS average_price,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY brand
HAVING COUNT(*) >= 10
ORDER BY average_price DESC
LIMIT 10;


-- ============================================================
-- Business Question 12
-- Which categories have the highest average prices?
-- ============================================================

SELECT
    category,
    ROUND(AVG(price),2) AS average_price,
    COUNT(*) AS total_products
FROM sephora_products
GROUP BY category
HAVING COUNT(*) >= 10
ORDER BY average_price DESC
LIMIT 10;