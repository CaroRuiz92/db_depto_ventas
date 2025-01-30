-- Active: 1734956459041@@127.0.0.1@3306@depto_ventas
USE depto_ventas;

SELECT v.fecha_venta, 
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, 
ROUND(v2.Promedio_Vtas, 3) AS Promedio_Ventas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC;

-- CONSULTAS CON FUNCIONES VENTANA

-- Ventas por fecha más sus respectivos promedios
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC;

-- Con acumulativo
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 3) AS Total_Venta_Acumulado
FROM venta v;

-- segunda versión del anterior
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ORDER BY v.ID_venta), 3) AS Total_Venta_Acum
FROM venta v;

-- Ranking de ventas ordenadas de mayor a menor
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

-- Top 3 de ventas
SELECT *
FROM (SELECT DENSE_RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta), 2) AS Gasto_Cliente
FROM venta v) ventas
WHERE Ranking_Venta < 4;

-- Clientes numerados, particionados por localidad
SELECT ROW_NUMBER() OVER (PARTITION BY c.localidad_cliente) AS row_ID,
c.nombre_apellido_cliente,
c.domicilio_cliente,
c.edad_cliente
FROM clientes c;

-- Listado de ventas por cliente, diferenciando la cantidad de días pasados entre venta y venta
SELECT ROW_NUMBER() OVER (PARTITION BY v.ID_cliente ORDER BY v.fecha_venta) AS Operacion,
v.ID_cliente,
LAG(v.fecha_venta) OVER (PARTITION BY v.ID_cliente ORDER BY v.fecha_venta) AS Fecha_anterior,
v.fecha_venta,
LEAD(v.fecha_venta) OVER (PARTITION BY v.ID_cliente ORDER BY v.fecha_venta) AS Fecha_siguiente,
DATEDIFF(LEAD(v.fecha_venta) OVER(PARTITION BY v.ID_cliente ORDER BY v.fecha_venta), v.fecha_venta) AS Diferencia_ste_Vta,
(v.precio_venta * v.cantidad_venta) AS Venta_monto
FROM venta v;

-- Se agrega promedio de días transcurridos entre venta y venta
SELECT ID_cliente,
ROUND(AVG(Diferencia_Ste_Venta), 2) AS Promedio_Dias_entre_Vtas
FROM (
    SELECT v.ID_cliente,
DATEDIFF(LEAD(v.fecha_venta) OVER w, v.fecha_venta) AS Diferencia_Ste_Venta
FROM venta v
WINDOW w AS (PARTITION BY v.ID_cliente ORDER BY v.fecha_venta)) vta
GROUP BY ID_cliente;

-- Productos, precios y promedio de precios en general
SELECT ID_producto, concepto_producto, precio_producto, 
(SELECT ROUND(AVG(precio_producto), 2) FROM stg_productos) AS Prom_Precio
FROM stg_productos
WHERE concepto_producto NOT LIKE 'Producto_'
ORDER BY precio_producto DESC;

-- Detalle monto venta por producto
SELECT p.ID_producto, p.concepto_producto, p.precio_producto, v.promedio_venta
FROM stg_productos p
INNER JOIN (
    SELECT ID_producto, ROUND(AVG(precio_venta * cantidad_venta), 2) AS promedio_venta
    FROM stg_venta
    GROUP BY ID_producto) v
ON p.ID_producto = v.ID_producto;

-- Productos cuyo precio es mayor al promedio
SELECT ID_producto, concepto_producto, precio_producto
FROM stg_productos
WHERE precio_producto > (SELECT AVG(precio_producto) 
                        FROM stg_productos 
                        WHERE concepto_producto NOT LIKE 'Producto_');

-- Producto más barato por categoría
SELECT p1.ID_producto, p1.concepto_producto, p1.tipo_producto, p1.precio_producto
FROM stg_productos p1
WHERE precio_producto = (SELECT MIN(precio_producto)
                        FROM stg_productos p2
                        WHERE p1.ID_producto = p2.ID_producto)
AND concepto_producto NOT LIKE 'Producto_'
ORDER BY concepto_producto;


-- Clientes que hayan comprado cierto producto

SELECT ID_cliente, nombre_apellido_cliente
FROM stg_clientes
WHERE ID_cliente IN (SELECT v.ID_cliente
                    FROM stg_venta v
                    WHERE v.ID_producto = 42737
                    );

-- Vendedores implicados en la venta de cierto producto

SELECT ID_empleado, nombre_empleado, apellido_empleado, sucursal_empleado
FROM stg_empleados e
WHERE EXISTS (
    SELECT ID_empleado 
    FROM stg_venta v
    WHERE v.ID_producto = 42737 AND
    e.ID_empleado = v.ID_empleado
);

-- Función que dado un código de producto 
-- devuelve el total de ventas para dicho producto 
-- luego, mediante una consulta, trae código y total de ventas
DELIMITER $$
CREATE FUNCTION Total_Vtas(cod_prod INT)
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10,2) DEFAULT 0;

    SELECT IFNULL(SUM(precio_venta * cantidad_venta), 0)
    INTO total_ventas
    FROM stg_venta
    WHERE ID_producto = cod_prod;

    RETURN total_ventas;
END $$
DELIMITER ;

SELECT Total_Vtas(42850);

-- Función que dado un código devuelve 
--la cantidad de productos vendidos o cero si no se ha vendido.

DELIMITER $$
CREATE FUNCTION Cant_Vendido(cod_prod INT)
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE cant_vendido DECIMAL(10,2) DEFAULT 0;

    SELECT SUM(cantidad_venta)
    INTO cant_vendido
    FROM stg_venta
    WHERE ID_producto = cod_prod;

    RETURN cant_vendido;
END $$
DELIMITER;

SELECT Cant_Vendido(42850);
