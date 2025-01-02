/* 2024-12-23 09:23:20 [4 ms] */ 
USE depto_ventas;
/* 2024-12-23 09:23:46 [3 ms] */ 
SELECT * FROM sucursales LIMIT 100;
/* 2024-12-23 09:27:35 [214 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Sucursales.csv'
INTO TABLE sucursales
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_sucursales, nombre_sucursal, direccion_sucursal, localidad_sucursal, provincia_sucursal);
/* 2024-12-23 09:28:01 [31 ms] */ 
SELECT * FROM sucursales LIMIT 100;
/* 2024-12-23 09:40:17 [373 ms] */ 
CREATE TABLE proveedores (
ID_proveedor INT KEY,
nombre_proveedor VARCHAR(50),
direccion_proveedor VARCHAR(70),
ciudad_proveedor VARCHAR(40),
departamento_proveedor VARCHAR(25),
provincia_sucursal VARCHAR(40),
pais_proveedor VARCHAR(25)
);
/* 2024-12-23 09:47:26 [898 ms] */ 
CREATE TABLE proveedores (
ID_proveedor INT KEY,
nombre_proveedor VARCHAR(50),
direccion_proveedor VARCHAR(70),
ciudad_proveedor VARCHAR(40),
departamento_proveedor VARCHAR(25),
provincia_proveedor VARCHAR(40),
pais_proveedor VARCHAR(25)
);
/* 2024-12-23 09:48:49 [838 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Proveedores.xlsx'
INTO TABLE proveedores
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_proveedor, nombre_proveedor, direccion_proveedor, ciudad_proveedor, provincia_proveedor, departamento_proveedor, pais_proveedor);
/* 2024-12-23 09:49:31 [1 ms] */ 
SELECT * FROM proveedores LIMIT 100;
/* 2024-12-23 09:53:22 [284 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Proveedores.csv'
INTO TABLE proveedores
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_proveedor, nombre_proveedor, direccion_proveedor, ciudad_proveedor, provincia_proveedor, departamento_proveedor, pais_proveedor);
/* 2024-12-23 09:53:52 [2 ms] */ 
SELECT * FROM proveedores LIMIT 100;
/* 2024-12-23 10:06:46 [385 ms] */ 
CREATE TABLE productos (
ID_producto INT KEY,
concepto_producto VARCHAR(100),
tipo_producto VARCHAR(100),
precio_producto FLOAT
);
/* 2024-12-23 10:08:31 [236 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:09:24 [3 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:14:35 [132 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:14:44 [132 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:15:03 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:19:04 [77 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:19:31 [206 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:19:46 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:26:42 [167 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:28:35 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:28:46 [466 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:28:50 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:34:36 [130 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:34:45 [374 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:34:57 [3 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:38:10 [871 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:38:17 [467 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:38:33 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:39:31 [138 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:39:47 [1510 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:39:56 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:42:18 [690 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:42:25 [443 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:42:33 [3 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:44:01 [705 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:44:08 [137 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto);
/* 2024-12-23 10:44:22 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:46:59 [491 ms] */ 
DESCRIBE productos;
/* 2024-12-23 10:47:47 [1606 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:48:54 [1464 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto)
SET precio_producto = NULLIF(precio_producto, '');
/* 2024-12-23 10:49:15 [1 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:50:49 [124 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:51:20 [643 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, precio_producto)
SET precio_producto = CAST(REPLACE(precio_producto, ',', '.') AS DECIMAL(10,2));
/* 2024-12-23 10:51:35 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:53:07 [1605 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:53:22 [1784 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, @precio_producto)
SET precio_producto = CAST(REPLACE(@precio_producto, ',', '.') AS DECIMAL(10,2));
/* 2024-12-23 10:53:41 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:55:39 [1173 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:56:03 [394 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, @precio_producto)
SET precio_producto = CAST(REPLACE(@precio_producto, ',', '.') AS DECIMAL(10,2));
/* 2024-12-23 10:56:10 [1 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 10:57:39 [44 ms] */ 
DELETE FROM productos;
/* 2024-12-23 10:58:05 [437 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, @precio_producto)
SET precio_producto = CAST(REPLACE(@precio_producto, ',', '.') AS DECIMAL(10,2));
/* 2024-12-23 10:58:15 [1 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 11:03:02 [157 ms] */ 
DELETE FROM productos;
/* 2024-12-23 11:03:10 [730 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, @precio_producto)
SET precio_producto = CAST(REPLACE(@precio_producto, ',', '.') AS DECIMAL(10,2));
/* 2024-12-23 11:03:14 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 11:07:02 [1538 ms] */ 
UPDATE productos
SET precio_producto = 244444442
WHERE precio_producto = 100000000;
/* 2024-12-23 11:07:20 [2 ms] */ 
SELECT * FROM productos LIMIT 100;
/* 2024-12-23 11:28:26 [1297 ms] */ 
CREATE TABLE empleados (
ID_empleado INT KEY,
apellido_empleado VARCHAR(100),
nombre_empleado VARCHAR(100),
sucursal_empleado VARCHAR(50),
sector_empleado VARCHAR(30),
cargo_empleado VARCHAR(30),
salario_empleado INT
);
/* 2024-12-23 11:31:16 [182 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Empleados.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
/* 2024-12-23 11:32:03 [3 ms] */ 
SELECT * FROM empleados LIMIT 100;
/* 2024-12-23 11:32:27 [88 ms] */ 
DELETE FROM empleados;
/* 2024-12-23 11:34:34 [468 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Empleados.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_empleado, apellido_empleado, nombre_empleado, sucursal_empleado, sector_empleado, cargo_empleado, salario_empleado);
/* 2024-12-23 11:35:04 [3 ms] */ 
SELECT * FROM empleados LIMIT 100;
/* 2024-12-23 11:40:19 [414 ms] */ 
DELETE FROM empleados;
/* 2024-12-23 11:50:57 [1022 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Empleados.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_empleado, apellido_empleado, nombre_empleado, sucursal_empleado, sector_empleado, cargo_empleado, salario_empleado);
/* 2024-12-23 11:51:02 [3 ms] */ 
SELECT * FROM empleados LIMIT 100;
/* 2024-12-23 11:57:22 [2 ms] */ 
SELECT count(*) FROM empleados LIMIT 100;
/* 2024-12-23 12:00:39 [2 ms] */ 
SELECT * FROM empleados
ORDER BY ID_empleado DESC LIMIT 100;
/* 2024-12-23 12:00:58 [1 ms] */ 
SELECT * FROM empleados
ORDER BY ID_empleado DESC
LIMIT 10;
/* 2024-12-23 12:02:40 [2 ms] */ 
SELECT * FROM empleados
ORDER BY ID_empleado ASC
LIMIT 10;
/* 2024-12-23 12:02:57 [2 ms] */ 
SELECT * FROM empleados
ORDER BY ID_empleado DESC
LIMIT 10;
/* 2024-12-23 14:09:39 [5 ms] */ 
USE depto_ventas;
/* 2024-12-23 14:10:57 [3 ms] */ 
-- Active: 1734956459041@@127.0.0.1@3306@depto_ventas;
/* 2024-12-23 14:13:13 [93 ms] */ 
SELECT * FROM sucursales LIMIT 100;
/* 2024-12-23 14:14:00 [2 ms] */ 
-- Active: 1734956459041@@127.0.0.1@3306@depto_ventas;
/* 2024-12-23 14:17:19 [29 ms] */ 
USE depto_ventas;
/* 2024-12-23 14:21:06 [911 ms] */ 
CREATE TABLE canal_venta (
    ID_canal_vta INT KEY,
    descrip_canal_vta VARCHAR(50)
);
/* 2024-12-23 14:22:23 [101 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/CanalDeVenta.csv'
INTO TABLE canal_venta
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_canal_vta, descrip_canal_vta);
/* 2024-12-23 14:27:33 [228 ms] */ 
CREATE TABLE tipos_gastos (
    ID_tipo_gasto INT KEY,
    descrip_gasto VARCHAR(50),
    monto_aprox_gasto INT
);
/* 2024-12-23 14:29:27 [701 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/TiposDeGasto.csv'
INTO TABLE tipos_gastos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_tipo_gasto, descrip_gasto, monto_aprox_gasto);
/* 2024-12-23 14:51:30 [1 ms] */ 
SELECT * FROM sucursales LIMIT 100;
/* 2024-12-23 15:21:27 [5 ms] */ 
SELECT * FROM canal_venta LIMIT 100;
/* 2024-12-23 15:29:54 [1211 ms] */ 
CREATE TABLE calendario (
    ID_fecha INT KEY,
    fecha DATE,
    anio INT,
    mes INT,
    dia INT,
    trimestre INT,
    semana INT,
    dia_nombre VARCHAR(30),
    mes_nombre VARCHAR(30)
);
/* 2024-12-23 15:31:37 [416 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Calendario.csv'
INTO TABLE calendario
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_fecha, fecha, anio, mes, dia, trimestre, semana, dia_nombre, mes_nombre);
/* 2024-12-23 15:45:52 [2314 ms] */ 
CREATE TABLE compra (
    ID_compra INT KEY,
    fecha_compra DATE,
    ID_producto INT,
    cantidad INT,
    precio_compra INT,
    ID_proveedor INT,
    FOREIGN KEY (ID_producto) REFERENCES productos(ID_producto),
    FOREIGN KEY (ID_proveedor) REFERENCES proveedores(ID_proveedor)
);
/* 2024-12-23 15:47:21 [3411 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Compra.csv'
INTO TABLE compra
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_compra, fecha_compra, ID_producto, cantidad, precio_compra, ID_proveedor);
/* 2024-12-24 09:29:36 [1780 ms] */ 
CREATE TABLE gasto (
    ID_gasto INT KEY,
    ID_sucursal INT,
    ID_tipo_gasto INT,
    fecha_gasto DATE,
    monto_gasto FLOAT,
    FOREIGN KEY (ID_sucursal) REFERENCES sucursales(ID_sucursales),
    FOREIGN KEY (ID_tipo_gasto) REFERENCES tipos_gastos(ID_tipo_gasto)
);
/* 2024-12-24 09:31:30 [5553 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Gasto.csv'
INTO TABLE gasto
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_gasto, ID_sucursal, ID_tipo_gasto, fecha_gasto, monto_gasto);
/* 2024-12-24 09:46:58 [1475 ms] */ 
CREATE TABLE clientes (
    ID_cliente INT KEY,
    provincia_cliente VARCHAR(50),
    nombre_apellido_cliente VARCHAR(100),
    domicilio_cliente VARCHAR(70),
    telefono_cliente VARCHAR(70),
    edad_cliente INT,
    localidad_cliente VARCHAR(50),
    x_cliente VARCHAR(100),
    y_cliente VARCHAR(100),
    fecha_alta_cliente VARCHAR(100),
    usuario_alta_cliente VARCHAR(100),
    fecha_ultima_modific_cliente VARCHAR(100),
    usuario_ultima_modific_cliente VARCHAR(100),
    marca_baja_cliente VARCHAR(100),
    col10_cliente VARCHAR(70));
/* 2024-12-24 09:52:25 [2057 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Clientes_final.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_cliente, provincia_cliente, nombre_apellido_cliente, domicilio_cliente, telefono_cliente, edad_cliente, localidad_cliente, x_cliente, y_cliente, fecha_alta_cliente, usuario_alta_cliente, fecha_ultima_modific_cliente, usuario_ultima_modific_cliente, marca_baja_cliente, col10_cliente);
/* 2024-12-24 10:24:46 [495 ms] */ 
CREATE TABLE venta (
    ID_venta INT PRIMARY KEY,
    fecha_venta DATE,
    fecha_entrega_venta DATE,
    ID_canal_vta INT,
    ID_cliente INT,
    ID_sucursal INT,
    ID_empleado INT,
    ID_producto INT,
    precio_venta FLOAT,
    cantidad_venta INT,
    FOREIGN KEY (ID_canal_vta) REFERENCES canal_venta(ID_canal_vta),
    FOREIGN KEY (ID_cliente) REFERENCES clientes(ID_cliente),
    FOREIGN KEY (ID_sucursal) REFERENCES sucursales(ID_sucursales),
    FOREIGN KEY (ID_empleado) REFERENCES empleados(ID_empleado),
    FOREIGN KEY (ID_producto) REFERENCES productos(ID_producto)
);
/* 2024-12-24 10:30:19 [6623 ms] */ 
LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Venta.csv'
INTO TABLE venta
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_venta, fecha_venta, fecha_entrega_venta, ID_canal_vta, ID_cliente, ID_sucursal, ID_empleado, ID_producto, precio_venta, cantidad_venta);
/* 2024-12-24 10:53:33 [7 ms] */ 
SELECT * FROM venta LIMIT 100;
/* 2024-12-24 18:09:19 [3 ms] */ 
USE depto_ventas;
/* 2025-01-02 11:03:55 [62 ms] */ 
USE depto_ventas;
/* 2025-01-02 11:04:21 [2500 ms] */ 
SELECT * FROM venta LIMIT 100;
/* 2025-01-02 11:07:05 [56 ms] */ 
SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
FROM venta GROUP BY fecha_venta LIMIT 100;
/* 2025-01-02 11:17:55 [3 ms] */ 
SELECT * FROM venta LIMIT 100;
/* 2025-01-02 11:24:43 [55 ms] */ 
SELECT v.fecha_venta, v.precio_venta * v.cantidad_venta AS Venta_Total, v2.Promedio_Vtas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta) LIMIT 100;
/* 2025-01-02 11:32:16 [25 ms] */ 
SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
FROM venta GROUP BY fecha_venta LIMIT 100;
/* 2025-01-02 11:32:20 [24 ms] */ 
SELECT v.fecha_venta, v.precio_venta * v.cantidad_venta AS Venta_Total, v2.Promedio_Vtas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta) LIMIT 100;
/* 2025-01-02 11:35:05 [177 ms] */ 
SELECT v.fecha_venta, v.precio_venta * v.cantidad_venta AS Venta_Total, ROUND(v2.Promedio_Vtas)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta) LIMIT 100;
/* 2025-01-02 11:35:12 [24 ms] */ 
SELECT v.fecha_venta, v.precio_venta * v.cantidad_venta AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta) LIMIT 100;
/* 2025-01-02 11:35:33 [26 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta) LIMIT 100;
/* 2025-01-02 11:43:13 [103 ms] */ 
SELECT v.fecha_venta,
v.precio_venta * v.cantidad_venta AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v LIMIT 100;
/* 2025-01-02 11:43:22 [25 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta) LIMIT 100;
/* 2025-01-02 11:43:25 [40 ms] */ 
SELECT v.fecha_venta,
v.precio_venta * v.cantidad_venta AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v LIMIT 100;
/* 2025-01-02 11:43:58 [36 ms] */ 
SELECT v.fecha_venta,
v.precio_venta * v.cantidad_venta AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta LIMIT 100;
/* 2025-01-02 11:44:05 [25 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta) LIMIT 100;
/* 2025-01-02 11:44:08 [38 ms] */ 
SELECT v.fecha_venta,
v.precio_venta * v.cantidad_venta AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta LIMIT 100;
/* 2025-01-02 11:44:18 [45 ms] */ 
SELECT v.fecha_venta,
v.precio_venta * v.cantidad_venta AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:49:24 [40 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:06 [40 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:09 [40 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:11 [40 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:17 [45 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:20 [41 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:23 [41 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:38 [46 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:50:43 [39 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:51:32 [41 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:51:35 [39 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:51:37 [40 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3)
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:52:06 [41 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, ROUND(v2.Promedio_Vtas, 3) AS Promedio_Ventas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 11:52:11 [41 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 12:01:00 [46 ms] */ 
SELECT DISTINCT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 12:01:18 [38 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 12:02:00 [40 ms] */ 
SELECT v.fecha_venta, ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, 
ROUND(v2.Promedio_Vtas, 3) AS Promedio_Ventas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 12:02:19 [38 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:19:16 [42 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v

ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:19:20 [75 ms] */ 
SELECT v.fecha_venta, 
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, 
ROUND(v2.Promedio_Vtas, 3) AS Promedio_Ventas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:19:22 [48 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v

ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:19:28 [45 ms] */ 
SELECT v.fecha_venta, 
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, 
ROUND(v2.Promedio_Vtas, 3) AS Promedio_Ventas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:19:30 [40 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v

ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:19:33 [41 ms] */ 
SELECT v.fecha_venta, 
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total, 
ROUND(v2.Promedio_Vtas, 3) AS Promedio_Ventas
FROM venta v
JOIN (SELECT fecha_venta, AVG(precio_venta * cantidad_venta) AS Promedio_Vtas
    FROM venta GROUP BY fecha_venta) v2
ON (v.fecha_venta = v2.fecha_venta)
ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:19:34 [41 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Venta_Total,
AVG(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta) AS Promedio_Venta
FROM venta v

ORDER BY fecha_venta DESC LIMIT 100;
/* 2025-01-02 13:35:02 [1039 ms] */ 
SELECT v.fecha_venta,
v.precio_venta * v.cantidad_venta AS Total_Venta,
SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Total_Ventas_Acumulado
FROM venta v LIMIT 100;
/* 2025-01-02 13:36:46 [35 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 2) AS Total_Venta,
SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Total_Ventas_Acumulado
FROM venta v LIMIT 100;
/* 2025-01-02 13:38:05 [60 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 2) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS Total_Ventas_Acumulado
FROM venta v LIMIT 100;
/* 2025-01-02 13:38:43 [43 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 2) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS Total_Venta_Acumulado
FROM venta v LIMIT 100;
/* 2025-01-02 13:39:20 [43 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 3) AS Total_Venta_Acumulado
FROM venta v LIMIT 100;
/* 2025-01-02 14:00:11 [50 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ORDER BY v.ID_venta), 3) AS Total_Venta_Acum
FROM venta v LIMIT 100;
/* 2025-01-02 14:00:14 [45 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 3) AS Total_Venta_Acumulado
FROM venta v LIMIT 100;
/* 2025-01-02 14:00:18 [50 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ORDER BY v.ID_venta), 3) AS Total_Venta_Acum
FROM venta v LIMIT 100;
/* 2025-01-02 14:00:23 [46 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 3) AS Total_Venta_Acumulado
FROM venta v LIMIT 100;
/* 2025-01-02 14:00:25 [49 ms] */ 
SELECT v.fecha_venta,
ROUND(v.precio_venta * v.cantidad_venta, 3) AS Total_Venta,
ROUND(SUM(v.precio_venta * v.cantidad_venta) OVER (PARTITION BY v.fecha_venta ORDER BY v.ID_venta), 3) AS Total_Venta_Acum
FROM venta v LIMIT 100;
/* 2025-01-02 14:08:38 [60 ms] */ 
SELECT RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
(v.precio_venta * v.cantidad_venta) AS Venta
FROM venta v LIMIT 100;
/* 2025-01-02 14:15:31 [42 ms] */ 
SELECT RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
(v.precio_venta * v.cantidad_venta) AS Gasto_Cliente
FROM venta v LIMIT 100;
/* 2025-01-02 14:15:48 [48 ms] */ 
SELECT RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta),3) AS Gasto_Cliente
FROM venta v LIMIT 100;
/* 2025-01-02 14:15:55 [51 ms] */ 
SELECT RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta), 2) AS Gasto_Cliente
FROM venta v LIMIT 100;
/* 2025-01-02 14:22:09 [46 ms] */ 
SELECT DENSE_RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta), 2) AS Gasto_Cliente
FROM venta v LIMIT 100;
/* 2025-01-02 14:35:25 [79 ms] */ 
SELECT *
FROM (SELECT DENSE_RANK() OVER (PARTITION BY v.fecha_venta ORDER BY v.precio_venta * v.cantidad_venta DESC) AS Ranking_Venta,
v.fecha_venta,
v.ID_cliente,
v.precio_venta,
v.cantidad_venta,
ROUND((v.precio_venta * v.cantidad_venta), 2) AS Gasto_Cliente
FROM venta v) ventas
WHERE Ranking_Venta < 4 LIMIT 100;
