 -- ══════════════════════════════════════════
-- TechStore — Consultas Básicas SELECT
-- Autor: GASTON RIVAROLA
-- Fecha: 3/11/2026

-- ══════════════════════════════════════════
-- Consulta 1: Exploración general de la tabla sales

-- SELECT * conviene cuando se necesita ver cada rincón de la tabla a consultar
-- No conviene cuando los volúmenes de datos son muy grandes

 SELECT * FROM sales;

-- Consulta 2: Selección de columnas específicas para finanzas
 SELECT customer_id, product_id, total_amount
 FROM sales;

 -- Consulta 3: Selección con alias en español para stakeholders
 SELECT order_date as fecha_pedido,
 product_name as nombre_producto,
 quantity as cantidad_unidades
 FROM sales;

