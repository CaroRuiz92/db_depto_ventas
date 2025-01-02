SELECT v.fecha_venta, 
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, 
ROUND(v2.Promedio_Vtas, 3) AS Promedio_Ventas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC;

-- CONSULTAS CON FUNCIONES VENTANA
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC;

SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 3) AS Total_Venta_Acumulado
FROM venta v;

-- segunda versión del anterior
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ORDER BY v.ID_venta), 3) AS Total_Venta_Acum
FROM venta v;

SELECT RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta), 2) AS Gasto_Cliente
FROM venta v;

-- segundo versión del anterior con ranking bien detallado, sin gaps
SELECT DENSE_RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta), 2) AS Gasto_Cliente
FROM venta v;

SELECT *
FROM (SELECT DENSE_RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta), 2) AS Gasto_Cliente
FROM venta v) ventas
WHERE Ranking_Venta < 4;