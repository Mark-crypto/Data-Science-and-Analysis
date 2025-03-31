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

INSERT INTO layoffs_staging2
SELECT * , ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`,stage,country, funds_raised_millions) AS row_num
FROM layoffs_staging;