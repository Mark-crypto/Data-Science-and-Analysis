-- Data Cleaning
CREATE TABLE layoffs_staging LIKE layoffs;
INSERT INTO layoffs_staging SELECT * FROM layoffs

-- Removing duplicates
WITH duplicate_cte AS(
SELECT * , ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,stage,country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * FROM duplicate_cte WHERE row_num >1;

CREATE TABLE layoffs_staging2 LIKE layoffs_staging;
INSERT INTO layoffs_staging2
SELECT * , ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,stage,country, funds_raised_millions) AS row_num
FROM layoffs_staging;


SELECT * FROM layoffs_staging2 where row_num > 1;
-- removing duplicate values
DELETE FROM layoffs_staging2 WHERE row_num > 1;

-- Standardizing Data
SELECT company, TRIM(company) FROM layoffs_staging2;
UPDATE layoffs_staging2 SET company = TRIM(company);
SELECT DISTINCT industry FROM layoffs_staging2 ORDER BY 1;

SELECT * FROM layoffs_staging2 WHERE industry = "Crypto" || "Crypto Currency" || "CryptoCurrency";
OR 
SELECT * FROM layoffs_staging2 WHERE industry LIKE "Crypto%"
UPDATE layoffs_staging2 SET industry = "Crypto" WHERE industry LIKE "Crypto%";
SELECT location FROM layoffs_staging2 ORDER BY 1;
SELECT country FROM layoffs_staging2 ORDER BY 1;
SELECT DISTINCT country, TRIM(TRAILING "." FROM country) from layoffs_staging2 ORDER BY 1;
UPDATE layoffs_staging2 set country = TRIM(TRAILING "." FROM country) WHERE country LIKE "United States%";

SELECT `date`, str_to_date(`date`, '%m/%d/%Y') FROM layoffs_staging2; 
UPDATE layoffs_staging2 SET `date` = str_to_date(`date`, '%m/%d/%Y');
SELECT * FROM layoffs_staging2;
ALTER TABLE layoffs_staging2 
MODIFY COLUMN `date` DATE;

SELECT data_type FROM information_schema.columns
where TABLE_NAME = 'layoffs_staging2' 
AND COLUMN_NAME = 'date';

SELECT *
FROM layoffs_staging2 WHERE total_laid_off < 1;

SELECT *
FROM layoffs_staging2 
WHERE total_laid_off < 1
AND percentage_laid_off <= 0;

SELECT *
FROM layoffs_staging2 
WHERE industry = "";

SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2 ON t1.company = t2.company
AND t1.location = t2.location
WHERE t1.industry = "" 
AND t2.industry != ""

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2 ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry = "" 
AND t2.industry != ""

SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2 ON t1.company = t2.company
AND t1.location = t2.location
WHERE t1.company = "Airbnb";

SELECT *
FROM layoffs_staging2 WHERE company LIKE "Bally%";

DELETE
FROM layoffs_staging2 
WHERE total_laid_off < 1
AND percentage_laid_off <= 0;

ALTER TABLE layoffs_staging2 
DROP COLUMN row_num;

select * from layoffs_staging2;


-- Exploratory Data Analysis
SELECT company, SUM(total_laid_off) AS sum_1
FROM layoffs_staging2 
GROUP BY company
ORDER BY sum_1 DESC;

SELECT MAX(date), MIN(date) FROM layoffs_staging2

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT * FROM layoffs_staging2 
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;