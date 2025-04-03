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