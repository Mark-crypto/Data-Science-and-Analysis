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