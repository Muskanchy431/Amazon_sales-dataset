
-- Author: Muskan Chaudhary
-- Description: SQL Analysis on Sales Dataset
-- Database: sales_data.db
-- Table: sales_data

-- Drop table if it exists (for re-runs)
DROP TABLE IF EXISTS sales_data;

-- Create the table with appropriate schema
CREATE TABLE sales_data (
    region TEXT,
    country TEXT,
    item_type TEXT,
    sales_channel TEXT,
    order_priority TEXT,
    order_date TEXT,
    order_id INTEGER,
    ship_date TEXT,
    units_sold INTEGER,
    unit_price REAL,
    unit_cost REAL,
    total_revenue REAL,
    total_cost REAL,
    total_profit REAL
);

-- Import CSV data using command line (SQLite)
-- .mode csv
-- .import data.csv sales_data

-- View first 10 rows
SELECT * FROM sales_data LIMIT 10;

-- Total Revenue by Region
SELECT region, SUM(total_revenue) AS total_revenue
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;

-- Top 5 Most Profitable Countries
SELECT country, SUM(total_profit) AS total_profit
FROM sales_data
GROUP BY country
ORDER BY total_profit DESC
LIMIT 5;

-- Revenue by Item Type
SELECT item_type, SUM(total_revenue) AS revenue
FROM sales_data
GROUP BY item_type
ORDER BY revenue DESC;

-- Average Units Sold per Channel
SELECT sales_channel, AVG(units_sold) AS avg_units_sold
FROM sales_data
GROUP BY sales_channel;

-- Monthly Sales Trend (Assuming MM/DD/YYYY format)
SELECT 
  SUBSTR(order_date, 7, 4) AS year,
  SUBSTR(order_date, 1, 2) AS month,
  SUM(total_revenue) AS monthly_revenue
FROM sales_data
GROUP BY year, month
ORDER BY year, month;

-- Average Profit per Order Priority
SELECT order_priority, AVG(total_profit) AS avg_profit
FROM sales_data
GROUP BY order_priority
ORDER BY avg_profit DESC;

-- Total Units Sold by Country and Item Type
SELECT country, item_type, SUM(units_sold) AS total_units
FROM sales_data
GROUP BY country, item_type
ORDER BY total_units DESC;

-- Orders with High Profit (above $500,000)
SELECT * FROM sales_data
WHERE total_profit > 500000
ORDER BY total_profit DESC;

-- End of Script
