SELECT ROUND(SUM(gross_revenue),2) AS total_revenue,
       ROUND(SUM(profit),2) AS total_profit,
       ROUND((SUM(profit)/NULLIF(SUM(gross_revenue),0))*100,2) AS profit_margin_pct
FROM retail_sales;
-------------------------------------------------------------------------------------
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       ROUND(SUM(gross_revenue),2) AS revenue
FROM retail_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;
---------------------------------------------------------------------------------------

SELECT category,
       ROUND(SUM(gross_revenue),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM retail_sales
GROUP BY category
ORDER BY revenue DESC;
---------------------------------------------------------------------------------------

SELECT region,
       ROUND(SUM(gross_revenue),2) AS revenue,
       ROUND(AVG(delivery_days),2) AS avg_delivery_days,
       ROUND(AVG(returned)*100,2) AS return_rate_pct
FROM retail_sales
GROUP BY region
ORDER BY revenue DESC;
----------------------------------------------------------------------------------------

SELECT product_name, ROUND(SUM(gross_revenue),2) AS revenue
FROM retail_sales
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;
----------------------------------------------------------------------------------------
SELECT discount_pct,
       ROUND(SUM(gross_revenue),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM retail_sales
GROUP BY discount_pct
ORDER BY discount_pct;
----------------------------------------------------------------------------------------

WITH regional_category AS (
    SELECT region, category, ROUND(SUM(gross_revenue),2) AS revenue,
           DENSE_RANK() OVER (PARTITION BY region ORDER BY SUM(gross_revenue) DESC) AS rnk
    FROM retail_sales
    GROUP BY region, category
)
SELECT region, category, revenue
FROM regional_category
WHERE rnk = 1
ORDER BY region;
