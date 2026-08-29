-- ==========================================
-- Sephora Product Analytics
-- Exploratory Data Analysis (EDA)
-- ==========================================


-- ==========================================
-- 1. Dataset Overview
-- ==========================================

-- Total number of products
SELECT 
    COUNT(*) AS total_products
FROM sephora_products;


-- Number of unique brands
SELECT 
    COUNT(DISTINCT brand) AS total_brands
FROM sephora_products;


-- Number of unique product categories
SELECT 
    COUNT(DISTINCT category) AS total_categories
FROM sephora_products;



-- ==========================================
-- 2. Product Distribution Analysis
-- ==========================================

-- Top 10 brands by number of products
SELECT 
    brand,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY brand
ORDER BY product_count DESC
LIMIT 10;


-- Top 10 product categories by number of products
SELECT 
    category,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY category
ORDER BY product_count DESC
LIMIT 10;



-- ==========================================
-- 3. Pricing Analysis
-- ==========================================

-- Average product price
SELECT 
    ROUND(AVG(price), 2) AS average_price
FROM sephora_products;


-- Minimum and maximum product prices
SELECT
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM sephora_products;


-- Average rating by price range
SELECT
    CASE
        WHEN price < 25 THEN 'Under $25'
        WHEN price BETWEEN 25 AND 50 THEN '$25-$50'
        WHEN price BETWEEN 50 AND 100 THEN '$50-$100'
        ELSE '$100+'
    END AS price_range,
    ROUND(AVG(rating), 2) AS average_rating,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY price_range
ORDER BY average_rating DESC;



-- ==========================================
-- 4. Customer Engagement Analysis
-- ==========================================

-- Products with the most customer loves
SELECT
    brand,
    name,
    love,
    number_of_reviews
FROM sephora_products
ORDER BY love DESC
LIMIT 10;


-- Products with highest ratings and enough reviews
-- Filters out products with very few reviews
SELECT
    brand,
    name,
    rating,
    number_of_reviews
FROM sephora_products
WHERE number_of_reviews >= 100
ORDER BY rating DESC, number_of_reviews DESC
LIMIT 10;


-- Products with the most reviews
SELECT
    brand,
    name,
    number_of_reviews,
    rating
FROM sephora_products
ORDER BY number_of_reviews DESC
LIMIT 10;



-- ==========================================
-- 5. Product Availability Analysis
-- ==========================================

-- Online-only product distribution
SELECT
    online_only,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY online_only;


-- Exclusive product distribution
SELECT
    exclusive,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY exclusive;


-- Limited edition product distribution
SELECT
    limited_edition,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY limited_edition;



-- ==========================================
-- 6. Brand Performance Analysis
-- ==========================================

-- Brands with highest average ratings
-- Requires at least 10 products for reliability
SELECT
    brand,
    ROUND(AVG(rating), 2) AS average_rating,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY brand
HAVING COUNT(*) >= 10
ORDER BY average_rating DESC
LIMIT 10;


-- Brands with the highest average customer engagement
SELECT
    brand,
    ROUND(AVG(love), 0) AS average_loves,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY brand
HAVING COUNT(*) >= 10
ORDER BY average_loves DESC
LIMIT 10;



-- ==========================================
-- 7. Rating and Review Analysis
-- ==========================================

-- Overall average rating
SELECT
    ROUND(AVG(rating), 2) AS average_rating
FROM sephora_products;


-- Rating distribution
SELECT
    rating,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY rating
ORDER BY rating DESC;



-- ==========================================
-- 8. Marketing Flag Analysis
-- ==========================================

-- Count products with marketing flags
SELECT
    marketing_flags,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY marketing_flags;


-- Count products by limited-time offers
SELECT
    limited_time_offer,
    COUNT(*) AS product_count
FROM sephora_products
GROUP BY limited_time_offer;
