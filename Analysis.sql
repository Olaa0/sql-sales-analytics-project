SELECT * FROM fact_sales;

SELECT * FROM dim_date;

SELECT
  d.month,
  SUM(fs.quantity) AS units_sold,
  SUM(fs.quantity * fs.unit_price) AS revenue
FROM fact_sales fs
JOIN dim_date d ON fs.date_id = d.date_id
GROUP BY d.month
HAVING SUM(fs.quantity * fs.unit_price) > 500;

SELECT
  s.store_name,
  COALESCE(SUM(fs.quantity * fs.unit_price), 0) AS revenue
FROM dim_store s
LEFT JOIN fact_sales fs
  ON s.store_id = fs.store_id
GROUP BY s.store_name;


WITH customer_spend AS (
  SELECT
    customer_id,
    SUM(quantity * unit_price) AS total_spend
  FROM fact_sales
  GROUP BY customer_id
)
SELECT
  c.customer_name,
  cs.total_spend,
  CASE
    WHEN cs.total_spend >= 2000 THEN 'High Value'
    WHEN cs.total_spend >= 1000 THEN 'Mid Value'
    ELSE 'Low Value'
  END AS customer_segment
FROM customer_spend cs
JOIN dim_customer c
  ON cs.customer_id = c.customer_id;


WITH product_revenue AS (
  SELECT
    p.category,
    p.product_name,
    SUM(fs.quantity * fs.unit_price) AS revenue
  FROM fact_sales fs
  JOIN dim_product p ON fs.product_id = p.product_id
  GROUP BY p.category, p.product_name
)
SELECT
  *,
  RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rank_in_category
FROM product_revenue;

SELECT
  d.month,
  SUM(fs.quantity * fs.unit_price) AS monthly_revenue,
  SUM(SUM(fs.quantity * fs.unit_price))
    OVER (ORDER BY d.month) AS running_revenue
FROM fact_sales fs
JOIN dim_date d ON fs.date_id = d.date_id
GROUP BY d.month;
