-- Active: 1734956459041@@127.0.0.1@3306@depto_ventas
USE depto_ventas;

-- SUCURSALES
CREATE TABLE sucursales (
ID_sucursales INT KEY,
nombre_sucursal VARCHAR(100),
direccion_sucursal VARCHAR(100),
localidad_sucursal VARCHAR(50),
provincia_sucursal VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Sucursales.csv'
INTO TABLE sucursales
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_sucursales, nombre_sucursal, direccion_sucursal, localidad_sucursal, provincia_sucursal);

-- PROVEEDORES
CREATE TABLE proveedores (
ID_proveedor INT KEY,
nombre_proveedor VARCHAR(50),
direccion_proveedor VARCHAR(70),
ciudad_proveedor VARCHAR(40),
departamento_proveedor VARCHAR(25),
provincia_proveedor VARCHAR(40),
pais_proveedor VARCHAR(25)
);

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Proveedores.csv'
INTO TABLE proveedores
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_proveedor, nombre_proveedor, direccion_proveedor, ciudad_proveedor, provincia_proveedor, departamento_proveedor, pais_proveedor);

-- PRODUCTOS
CREATE TABLE productos (
ID_producto INT KEY,
concepto_producto VARCHAR(100),
tipo_producto VARCHAR(100),
precio_producto FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Productos_limp.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_producto, concepto_producto, tipo_producto, @precio_producto)
SET precio_producto = CAST(REPLACE(@precio_producto, ',', '.') AS DECIMAL(10,2));

-- EMPLEADOS
CREATE TABLE empleados (
ID_empleado INT KEY,
apellido_empleado VARCHAR(100),
nombre_empleado VARCHAR(100),
sucursal_empleado VARCHAR(50),
sector_empleado VARCHAR(30),
cargo_empleado VARCHAR(30),
salario_empleado INT
);

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Empleados.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_empleado, apellido_empleado, nombre_empleado, sucursal_empleado, sector_empleado, cargo_empleado, salario_empleado);

-- CANAL DE VENTA
CREATE TABLE canal_venta (
    ID_canal_vta INT KEY,
    descrip_canal_vta VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/CanalDeVenta.csv'
INTO TABLE canal_venta
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_canal_vta, descrip_canal_vta);

-- TIPOS DE GASTO
CREATE TABLE tipos_gastos (
    ID_tipo_gasto INT KEY,
    descrip_gasto VARCHAR(50),
    monto_aprox_gasto INT
);

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/TiposDeGasto.csv'
INTO TABLE tipos_gastos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_tipo_gasto, descrip_gasto, monto_aprox_gasto);

-- CALENDARIO
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

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Calendario.csv'
INTO TABLE calendario
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_fecha, fecha, anio, mes, dia, trimestre, semana, dia_nombre, mes_nombre);

-- COMPRAS
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

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Compra.csv'
INTO TABLE compra
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_compra, fecha_compra, ID_producto, cantidad, precio_compra, ID_proveedor);

-- GASTO
CREATE TABLE gasto (
    ID_gasto INT KEY,
    ID_sucursal INT,
    ID_tipo_gasto INT,
    fecha_gasto DATE,
    monto_gasto FLOAT,
    FOREIGN KEY (ID_sucursal) REFERENCES sucursales(ID_sucursales),
    FOREIGN KEY (ID_tipo_gasto) REFERENCES tipos_gastos(ID_tipo_gasto)
);

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Gasto.csv'
INTO TABLE gasto
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_gasto, ID_sucursal, ID_tipo_gasto, fecha_gasto, monto_gasto);

-- CLIENTE
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

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Clientes_final.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_cliente, provincia_cliente, nombre_apellido_cliente, domicilio_cliente, telefono_cliente, edad_cliente, localidad_cliente, x_cliente, y_cliente, fecha_alta_cliente, usuario_alta_cliente, fecha_ultima_modific_cliente, usuario_ultima_modific_cliente, marca_baja_cliente, col10_cliente);

-- VENTA
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

LOAD DATA LOCAL INFILE 'C:/Users/icrui/Documents/DS-ML/pract_DE/Recursos/Venta.csv'
INTO TABLE venta
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_venta, fecha_venta, fecha_entrega_venta, ID_canal_vta, ID_cliente, ID_sucursal, ID_empleado, ID_producto, precio_venta, cantidad_venta);
