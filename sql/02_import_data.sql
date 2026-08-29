-- ============================================================
-- Sephora Product Analytics
-- Import Data
-- ============================================================
-- Update the file path below to the absolute path of the CSV
-- on your computer before running this script in PostgreSQL.
--
-- Example:
-- /Users/yourname/Documents/Sephora-Product-Analytics/data/sephora_website_dataset.csv

COPY sephora_products
FROM '/path/to/Sephora-Product-Analytics/data/sephora_website_dataset.csv'
DELIMITER ','
CSV HEADER;
