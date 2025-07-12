SELECT * FROM dirty_cafe_sales;

-- Created a staging table to work on

CREATE TABLE dirty_cafe_sales_staging
LIKE dirty_cafe_sales;

SELECT *
FROM dirty_cafe_sales;

INSERT dirty_cafe_sales_staging
SELECT *
FROM dirty_cafe_sales;

SELECT * FROM dirty_cafe_sales_staging;

-- Checking for duplicates
SELECT * FROM dirty_cafe_sales_staging;

WITH duplicate_CTE AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY `Transaction ID`, `Item`, `Quantity`, `Price Per Unit`, `Total Spent`, `Payment Method`, `Location`, `Transaction Date`) AS row_num
FROM dirty_cafe_sales_staging
)
SELECT * FROM duplicate_CTE
WHERE row_num > 1;

-- Conclusion: No duplicates found

-- Handling missing/NULL values
SELECT * FROM dirty_cafe_sales_staging
WHERE Item = 'UNKNOWN'
	AND `Total Spent` = 'ERROR';

-- Deleting transactions where both the Item and Total Spent are unknown

DELETE FROM dirty_cafe_sales_staging
WHERE Item = 'UNKNOWN'
	AND `Total Spent` = 'ERROR';
    
DELETE FROM dirty_cafe_sales_staging
WHERE Item = 'UNKNOWN'
	AND `Total Spent` = 'UNKNOWN';
    
SELECT * FROM dirty_cafe_sales_staging
WHERE Item = 'UNKNOWN';

-- Replacing blank, 'ERROR' and 'UNKNOWN' values with NULL


UPDATE dirty_cafe_sales_staging
SET `Payment Method` = NULL
WHERE TRIM(`Payment Method`) = '' OR TRIM(`Payment Method`) = 'UNKNOWN' OR TRIM(`Payment Method`) = 'ERROR';

UPDATE dirty_cafe_sales_staging
SET Item = NULL
WHERE Item = 'UNKNOWN' OR TRIM(Item) = 'ERROR' OR TRIM(Item) ='';

UPDATE dirty_cafe_sales_staging
SET `Transaction Date` = NULL
WHERE `Transaction Date` = 'UNKNOWN' OR TRIM(`Transaction Date`) = 'ERROR' OR TRIM(`Transaction Date`) ='';

UPDATE dirty_cafe_sales_staging
SET `Total Spent` = NULL
WHERE `Total Spent` = 'UNKNOWN' OR TRIM(`Total Spent`) = 'ERROR' OR TRIM(`Total Spent`) ='';

UPDATE dirty_cafe_sales_staging
SET Location = NULL
WHERE Location = 'UNKNOWN' OR TRIM(Location) = 'ERROR' OR TRIM(Location) ='';

UPDATE dirty_cafe_sales_staging
SET `Total Spent` = ROUND(`Quantity` * `Price Per Unit`, 1);


SELECT * FROM dirty_cafe_sales_staging;


-- Standardizing the data

 ALTER TABLE dirty_cafe_sales_staging
 MODIFY COLUMN `Transaction Date` DATE;
 
 ALTER TABLE dirty_cafe_sales_staging
 MODIFY COLUMN `Total Spent` DECIMAL(10,1);
 
 SELECT * FROM dirty_cafe_sales_staging;
 

 
 
 
 





