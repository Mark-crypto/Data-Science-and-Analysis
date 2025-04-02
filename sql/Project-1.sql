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