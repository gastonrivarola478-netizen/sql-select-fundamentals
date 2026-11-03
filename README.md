# SQL SELECT Fundamentals — TechStore

Consultas básicas sobre la tabla `sales` para el equipo de finanzas:
exploración general, selección de columnas específicas y alias en español.

## ¿Por qué es mala práctica usar SELECT * en producción?

`SELECT *` trae todas las columnas de la tabla, incluso las que nadie necesita.
En producción esto genera varios problemas:

**1. Rendimiento.**
Se traen más datos de los necesarios. La tabla `sales` tiene 9 columnas y a
finanzas le alcanzan 3. Con 10 filas no se nota, pero con millones de filas
se transfieren y procesan datos de más, y las consultas son más lentas.

**2. Mantenibilidad.**
Si alguien agrega, elimina o reordena columnas en la tabla, un informe que
usa `SELECT *` cambia su resultado sin avisar. Pedir las columnas por nombre
hace que el informe siga mostrando siempre lo mismo.

**3. Seguridad.**
Si algún día se agrega a `sales` una columna sensible (por ejemplo,
`costo_interno`), `SELECT *` la mostraría a quien no debería verla.

sql
-- Mal: trae todas las columnas, las necesite o no
SELECT * FROM sales;

-- Bien: solo lo que finanzas necesita
SELECT customer_id, product_id, total_amount
FROM sales;
```

## ¿Por qué son importantes los alias para un stakeholder no técnico?

Los nombres de las columnas están pensados para quienes arman la base de
datos, no para quienes leen el reporte. Alguien de finanzas ve
`total_amount` y puede dudar de qué es: ¿con impuestos o sin impuestos?, ¿en
qué moneda? Un alias lo traduce a un lenguaje que entiende de inmediato.

```sql
-- Antes: encabezados técnicos, en inglés
SELECT order_date, product_name, quantity
FROM sales;

-- Después: encabezados claros, en español
SELECT order_date AS fecha_pedido,
       product_name AS nombre_producto,
       quantity AS cantidad_unidades
FROM sales;
```
