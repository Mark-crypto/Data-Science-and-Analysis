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

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2  DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2  DESC;

SELECT YEAR(`date`), SUM(total_laid_off)AS laid
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 2  DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2  DESC;

SELECT SUBSTRING(`date`,1, 7) AS `MONTH`, 
SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1, 7) != ""
GROUP BY `MONTH`
ORDER BY `MONTH` DESC;

WITH rolling_total AS(
SELECT SUBSTRING(`date`,1, 7) AS `MONTH`, 
SUM(total_laid_off) AS total_fired
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1, 7) != ""
GROUP BY `MONTH`
ORDER BY `MONTH` DESC
)
SELECT `MONTH`, total_fired,
SUM(total_fired) 
OVER(ORDER BY `MONTH`) AS total
FROM rolling_total;


SELECT company, YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;


WITH Company_Year (company, years, total_fired) AS(
SELECT company, YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(SELECT * , DENSE_RANK() OVER(PARTITION BY years ORDER BY total_fired DESC) AS ranking
FROM Company_Year
WHERE years != "")

SELECT * FROM Company_Year_Rank 
WHERE ranking <= 5;