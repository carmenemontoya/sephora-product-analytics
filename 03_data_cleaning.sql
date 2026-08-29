-- Check total number of records
SELECT COUNT(*) AS total_products
FROM sephora_products;


-- Check missing values in important columns
SELECT
    COUNT(*) FILTER (WHERE brand IS NULL) AS missing_brand,
    COUNT(*) FILTER (WHERE category IS NULL) AS missing_category,
    COUNT(*) FILTER (WHERE price IS NULL) AS missing_price,
    COUNT(*) FILTER (WHERE rating IS NULL) AS missing_rating
FROM sephora_products;


-- Check duplicate products
SELECT 
    brand,
    name,
    COUNT(*) AS duplicate_count
FROM sephora_products
GROUP BY brand, name
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- Duplicate investigation:
-- Product names may appear more than once because Sephora has
-- different product versions, categories, URLs, and ingredients.
-- Duplicate names were reviewed and retained when records represented
-- different product listings.

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT (
        brand,
        category,
        name,
        size,
        rating,
        number_of_reviews,
        price,
        url
    )) AS unique_rows
FROM sephora_products;

-- Result: Total rows matched unique rows (9,168 records).
-- No exact duplicate records were found.