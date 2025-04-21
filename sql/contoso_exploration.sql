SELECT s.orderdate, 
s.netprice * s.quantity * s.exchangerate AS net_revenue ,
c.givenname,
c.surname,
c.countryfull,
c.continent,
p.productkey,
p.productname,
p.categoryname,
p.subcategoryname,
CASE WHEN s.netprice * s.quantity * s.exchangerate > 1000 THEN 'HIGH' ELSE 'LOW' END AS high_low
FROM sales s
LEFT JOIN customer c ON c.customerkey = s.customerkey
LEFT JOIN product p ON p.productkey = s.productkey
WHERE orderdate::date >= '2020-01-01' LIMIT 10;

SELECT orderdate, COUNT(DISTINCT customerkey) 
AS total_customers 
FROM sales
WHERE orderdate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY orderdate
ORDER BY orderdate;

-- Visualizaton using matplotlib
from matplotlib import pyplot as plt
import seaborn as sns
def _plot_series(series, series_name, series_index=0):
  palette = list(sns.palettes.mpl_palette('Dark2'))
  xs = series['orderdate']
  ys = series['total_customers']
  
  plt.plot(xs, ys, label=series_name, color=palette[series_index % len(palette)])

fig, ax = plt.subplots(figsize=(10, 5.2), layout='constrained')
df_sorted = _df_1.sort_values('orderdate', ascending=True)
_plot_series(df_sorted, '')
sns.despine(fig=fig, ax=ax)
plt.xlabel('orderdate')
_ = plt.ylabel('total_customers')

SELECT s.orderdate, 
COUNT(DISTINCT CASE WHEN c.continent = 'Europe' THEN s.customerkey END) AS eu_customers,
COUNT(DISTINCT CASE WHEN c.continent = 'North America' THEN s.customerkey END) AS na_customers,
COUNT(DISTINCT CASE WHEN c.continent = 'Australia' THEN s.customerkey END) AS au_customers
FROM sales s
LEFT JOIN customer c ON s.customerkey = c.customerkey
WHERE orderdate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY orderdate
ORDER BY orderdate;

SELECT p.categoryname,
SUM(CASE WHEN s.orderdate BETWEEN '2022-01-01' AND '2022-12-31' THEN s.quantity * s.netprice * s.exchangerate ELSE 0 END) 
AS total_net_revenue_2022 ,
SUM(CASE WHEN s.orderdate BETWEEN '2023-01-01' AND '2023-12-31' THEN s.quantity * s.netprice * s.exchangerate ELSE 0 END) 
AS total_net_revenue_2023
FROM sales s 
LEFT JOIN product p ON p.productkey = s.productkey
GROUP BY p.categoryname
ORDER BY p.categoryname;

SELECT p.categoryname,
AVG(CASE WHEN s.orderdate BETWEEN '2022-01-01' AND '2022-12-31' THEN s.quantity * s.netprice * s.exchangerate ELSE 0 END) 
AS average_net_revenue_2022 ,
AVG(CASE WHEN s.orderdate BETWEEN '2023-01-01' AND '2023-12-31' THEN s.quantity * s.netprice * s.exchangerate ELSE 0 END) 
AS average_net_revenue_2023
FROM sales s 
LEFT JOIN product p ON p.productkey = s.productkey
GROUP BY p.categoryname
ORDER BY p.categoryname;

WITH median_value AS(
  SELECT
PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY (s.quantity * s.netprice * s.exchangerate)) AS median
FROM sales s 
WHERE orderdate BETWEEN '2022-01-01' AND '2023-12-31'
)


SELECT orderdate,quantity, netprice, 
(CASE WHEN quantity >= 2 AND netprice >= 100 THEN 'Multiple High value order'
WHEN netprice >= 100 THEN 'High value order'
WHEN quantity >= 2 THEN 'Multiple Standard Items'
ELSE 'Single Standard order' 
END
) 
AS order_type 
FROM sales
LIMIT 10;

SELECT p.categoryname,
SUM(CASE WHEN (s.quantity * s.netprice * s.exchangerate) < mv.median 
 AND  s.orderdate BETWEEN '2022-01-01' AND '2022-12-31'
 THEN (s.quantity * s.netprice * s.exchangerate)  END) AS y2022_low_net_revenue,
SUM(CASE WHEN (s.quantity * s.netprice * s.exchangerate) >= mv.median 
 AND s.orderdate BETWEEN '2022-01-01' AND '2022-12-31'
 THEN (s.quantity * s.netprice * s.exchangerate)  END) AS y2022high_net_revenue,
SUM(CASE WHEN (s.quantity * s.netprice * s.exchangerate) < mv.median 
 AND  s.orderdate BETWEEN '2023-01-01' AND '2023-12-31'
 THEN (s.quantity * s.netprice * s.exchangerate)  END) AS y2023_low_net_revenue,
SUM(CASE WHEN (s.quantity * s.netprice * s.exchangerate) >= mv.median 
 AND s.orderdate BETWEEN '2023-01-01' AND '2023-12-31'
 THEN (s.quantity * s.netprice * s.exchangerate)  END) AS y2023high_net_revenue
FROM sales s 
LEFT JOIN product p ON p.productkey = s.productkey,
median_value mv
GROUP BY p.categoryname
ORDER BY p.categoryname;

WITH percentiles AS (
SELECT 
  PERCENTILE_CONT(.25) WITHIN GROUP (ORDER BY (s.quantity * s.netprice * s.exchangerate) ) AS rev_25thpercentile,
  PERCENTILE_CONT(.75) WITHIN GROUP (ORDER BY (s.quantity * s.netprice * s.exchangerate) ) AS rev_75thpercentile
  FROM sales s
  WHERE orderdate BETWEEN '2022-01-01' AND '2023-12-31'
)
SELECT p.categoryname AS category,
SUM(s.quantity * s.netprice * s.exchangerate) AS total_revenue,
  CASE
    WHEN (s.quantity * s.netprice * s.exchangerate) <= prct.rev_25thpercentile THEN '3-Low'
    WHEN (s.quantity * s.netprice * s.exchangerate) >= prct.rev_75thpercentile THEN '1-High'
    ELSE '2-Medium'
  END AS revenue_tier
FROM sales s 
LEFT JOIN product p ON p.productkey = s.productkey,
percentiles prct
GROUP BY p.categoryname, revenue_tier
ORDER BY p.categoryname, revenue_tier;

SELECT  
DATE_TRUNC('month', orderdate)::date AS order_month,
SUM(quantity * netprice * exchangerate) AS total_revenue,
COUNT(DISTINCT customerkey) AS total_unique_customers
FROM sales 
GROUP BY order_month

SELECT 
DATE_PART('month', orderdate) AS order_month,
DATE_PART('year', orderdate) AS order_year,
DATE_PART('day', orderdate) AS order_day
FROM sales
ORDER BY RANDOM()
LIMIT 10;

SELECT  
EXTRACT(MONTH FROM orderdate) AS order_month,
EXTRACT(YEAR FROM orderdate) AS order_year,
SUM(quantity * netprice * exchangerate) AS total_revenue,
COUNT(DISTINCT customerkey) AS total_unique_customers
FROM sales 
GROUP BY order_month, order_year
ORDER BY RANDOM()

SELECT CURRENT_DATE, 
orderdate
FROM sales 
WHERE 
orderdate >= CURRENT_DATE - INTERVAL '5 years'

SELECT DATE_PART('year', orderdate) as order_year,
ROUND(AVG(EXTRACT(DAY FROM AGE(deliverydate, orderdate))),2) as avg_processing_time,
CAST(SUM(quantity * netprice * exchangerate) AS INTEGER) AS net_revenue
FROM sales
WHERE orderdate >= CURRENT_DATE - INTERVAL '5 YEARS'
GROUP BY order_year
ORDER BY order_year 

SELECT *, 
net_revenue * 100 / daily_net_revenue AS pct_daily_net_rev
FROM (
SELECT customerkey, orderdate,
orderkey * 10 + linenumber as order_line_number,
(quantity * netprice * exchangerate) AS net_revenue,
SUM(quantity * netprice * exchangerate) OVER(PARTITION BY orderdate) AS daily_net_revenue
FROM sales
) AS rev_by_day

WITH yearly_cohort AS(
SELECT DISTINCT customerkey, 
EXTRACT(YEAR FROM MIN(orderdate) OVER(PARTITION BY customerkey)) AS cohort_year
FROM sales
)
SELECT y.cohort_year,
EXTRACT( YEAR FROM orderdate) AS purchase_year,
SUM(quantity * netprice * exchangerate) AS net_revenue
FROM sales s LEFT JOIN
yearly_cohort y ON s.customerkey = y.customerkey
GROUP BY cohort_year, purchase_year
LIMIT 10


WITH yearly_cohort AS(
SELECT DISTINCT
customerkey,
EXTRACT( YEAR FROM  MIN(orderdate) OVER(PARTITION BY customerkey)) as cohort_year,
EXTRACT(YEAR FROM orderdate) as purchase_year
FROM sales
)
SELECT DISTINCT
cohort_year,
purchase_year,
COUNT(customerkey) OVER(PARTITION BY purchase_year, cohort_year) AS num_customers
FROM 
yearly_cohort
ORDER BY 
cohort_year, 
purchase_year

WITH customer_orders AS(
SELECT customerkey,
quantity * netprice * exchangerate AS order_value,
COUNT(*) OVER (PARTITION BY customerkey ) AS total_orders
FROM sales
)
SELECT 
customerkey, 
AVG(order_value),
total_orders
FROM 
customer_orders
GROUP BY 
customerkey, 
total_orders