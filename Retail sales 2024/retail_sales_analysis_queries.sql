CREATE database retails_2024

use retails_2024

select * from retail_sales_2024


----------Reducing the decimal number value to 2 place----------

UPDATE retail_sales_2024
SET unit_price = ROUND(unit_price, 2);

UPDATE retail_sales_2024
SET discount = ROUND(discount, 2);

UPDATE retail_sales_2024
SET revenue = ROUND(revenue, 2);

UPDATE retail_sales_2024
SET cost = ROUND(cost, 2);

UPDATE retail_sales_2024
SET profit = ROUND(profit, 2);

select * from retail_sales_2024



/* NOTE: Below are the few assesment that needs to be done to build the final report on PowerBI or Tableau 
        to findout the business insight. */

-- 1) Monthly revenue trend

SELECT DATENAME(MONTH, order_date) + ' ' + CAST(YEAR(order_date) as VARCHAR(4)) as month,
       round(SUM(revenue),0) as total_revenue
FROM retail_sales_2024
GROUP BY DATENAME(MONTH, order_date), YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);


-- 2) Total Profit by region

SELECT region,
       round(SUM(profit),0) as total_profit
FROM retail_sales_2024
GROUP BY region
ORDER BY 2 DESC;


-- 3) Top 10 products by revenue

SELECT top 10 product,
              round(SUM(revenue),0) as Total_revenue
FROM retail_sales_2024
GROUP BY product
ORDER BY 2 DESC


-- 4) Category mix based on total units, total revenue, total profit

SELECT 
    category, 
    ROUND(SUM(revenue),0) as revenue, 
    SUM(units) as total_units, 
    ROUND(SUM(profit),0) as total_profit
FROM retail_sales_2024
GROUP BY category
ORDER BY 2 DESC;



-- 5) Segment wise revenue and margin percentage

SELECT segment,
       round(SUM(revenue),2) as Total_revenue,
	   round(SUM(profit),2) as Total_profit,
       ROUND(100.0 * SUM(profit)/NULLIF(SUM(revenue),0), 2) as margin_pct
FROM retail_sales_2024
GROUP BY segment
ORDER BY 2 DESC;


-- 6) Average of revenue order value,total units, and average profit for different product types


SELECT product,
       round(avg(revenue), 2) as avg_revenue,
       sum(units)as total_units,
       round(AVG(profit), 2) as avg_profit
FROM retail_sales_2024
GROUP BY product
ORDER BY 2 desc;


------------------------------Final step is the Dashboard and report analytics-------------------------------
