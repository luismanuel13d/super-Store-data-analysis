CREATE TABLE ventas (
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales NUMERIC(10,2)
);

--verifico si los datos llegaron bien filtrando la tabla 
select * from ventas 

--reviso las primeras 10 filas de mi tabla
SELECT * FROM ventas LIMIT 10;

-- veo que las filas este
SELECT COUNT(*) FROM ventas;

--ventas por region  
SELECT region, SUM(sales) AS total_ventas
FROM ventas
GROUP BY region
ORDER BY total_ventas DESC;

-- 10 productos mas vendidos 
SELECT product_name, SUM(sales) AS total_ventas
FROM ventas
GROUP BY product_name
ORDER BY total_ventas DESC
LIMIT 10;

-- eventas por categoria y subcategoria 
SELECT category, sub_category, SUM(sales) AS total_ventas
FROM ventas
GROUP BY category, sub_category
ORDER BY category, total_ventas DESC;

-- ventas por mes 
SELECT DATE_TRUNC('month', order_date) AS mes, SUM(sales) AS total_ventas
FROM ventas
GROUP BY mes
ORDER BY mes;

-- cuales son nuestros clientes
SELECT segment, SUM(sales) AS total_ventas, COUNT(*) AS cantidad_ordenes
FROM ventas
GROUP BY segment
ORDER BY total_ventas DESC;

-- cuidad con mas ventas 
SELECT city, SUM(sales) AS total_ventas
FROM ventas
GROUP BY city
ORDER BY total_ventas DESC
LIMIT 10;

-- promedio de compras ticket promedio
SELECT AVG(sales) AS ticket_promedio

-- clientes que mas han comprado 
SELECT customer_name, SUM(sales) AS total_gastado
FROM ventas
GROUP BY customer_name
ORDER BY total_gastado DESC
LIMIT 10;
FROM ventas;

-- ventas por region y categoria 
SELECT region, category, SUM(sales) AS total_ventas
FROM ventas
GROUP BY region, category
ORDER BY region, total_ventas DESC;

-- que tipo de evio se uso mas ?
SELECT ship_mode, COUNT(*) AS cantidad, SUM(sales) AS total_ventas
FROM ventas
GROUP BY ship_mode
ORDER BY cantidad DESC;

-- tiempo promedio de envio 
SELECT AVG(ship_date - order_date) AS dias_promedio_envio
FROM ventas;

-- vetas por region y por mes 
SELECT region, DATE_TRUNC('month', order_date) AS mes, SUM(sales) AS total_ventas
FROM ventas
GROUP BY region, mes
ORDER BY region, mes;