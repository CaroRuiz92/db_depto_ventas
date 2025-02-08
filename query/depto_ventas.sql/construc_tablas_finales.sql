-- Dimensiones
CREATE TABLE dim_canal_vta (
    ID_canal_vta INT PRIMARY KEY AUTO_INCREMENT,
    stg_ID_canal_vta INT,
    descrip_canal_vta VARCHAR(50)
);

INSERT INTO dim_canal_vta(stg_ID_canal_vta, descrip_canal_vta)
SELECT ID_canal_vta, descrip_canal_vta FROM canal_venta;

CREATE TABLE dim_clientes (
    ID_cliente INT PRIMARY KEY AUTO_INCREMENT,
    stg_ID_cliente INT,
    nombre_completo_cliente VARCHAR(70),
    domicilio_cliente VARCHAR(70),
    ID_localidad_cliente INT,
    edad_cliente INT,
    rangoedad_cliente VARCHAR(70),
    telefono_cliente VARCHAR(70),
    FOREIGN KEY (ID_localidad_cliente) REFERENCES localidades(ID_localidad)
);

INSERT INTO dim_clientes (stg_ID_cliente, nombre_completo_cliente, domicilio_cliente, 
ID_localidad_cliente, edad_cliente, rangoedad_cliente, telefono_cliente)
SELECT ID_cliente, nombre_apellido_cliente, domicilio_cliente, id_localidad, 
edad_cliente, RangoEdad, telefono_cliente FROM stg_clientes;

CREATE TABLE dim_sucursales (
    ID_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    stg_ID_sucursal INT,
    nombre_sucursal VARCHAR(70),
    direccion_sucursal VARCHAR(70),
    ID_localidad INT,
    FOREIGN KEY (ID_localidad) REFERENCES localidades(ID_localidad)
);

INSERT INTO dim_sucursales (stg_ID_sucursal, nombre_sucursal, direccion_sucursal, ID_localidad)
SELECT ID_sucursales, nombre_sucursal, direccion_sucursal, ID_localidad FROM sucursales;

CREATE TABLE dim_empleados (
    ID_empleado INT PRIMARY KEY AUTO_INCREMENT,
    stg_ID_empleado INT,
    apellido_empleado VARCHAR(70),
    nombre_empleado VARCHAR(70),
    sector_empleado VARCHAR(70),
    cargo_empleado VARCHAR(70),
    salario_empleado INT);

INSERT INTO dim_empleados (stg_ID_empleado, apellido_empleado, nombre_empleado, sector_empleado, 
cargo_empleado, salario_empleado)
SELECT ID_empleado, apellido_empleado, nombre_empleado, sector_empleado, cargo_empleado, salario_empleado FROM stg_empleados;
-- Nota: se opta por dejar el dato sobre la sucursal en la futura fact_ventas por considerar 
-- que los empleados podrían cambiar de sucursal con cierta frecuencia

CREATE TABLE dim_productos (
    ID_producto INT PRIMARY KEY AUTO_INCREMENT,
    stg_ID_producto INT,
    nombre_producto VARCHAR(70),
    tipo_producto VARCHAR(80),
    precio_producto FLOAT
);

INSERT INTO dim_productos (stg_ID_producto, nombre_producto, tipo_producto, precio_producto)
SELECT ID_producto, concepto_producto, tipo_producto, precio_producto FROM stg_productos;

CREATE TABLE dim_calendario (
    ID_fecha INT PRIMARY KEY AUTO_INCREMENT,
    stg_ID_fecha INT,
    fecha DATE,
    dia INT,
    semana INT,
    mes INT,
    trimestre INT,
    anio INT,
    dia_nombre VARCHAR(20),
    mes_nombre VARCHAR(30)
);

INSERT INTO dim_calendario (stg_ID_fecha, fecha, dia, semana, mes, trimestre, anio, dia_nombre, mes_nombre)
SELECT ID_fecha, fecha, dia, semana, mes, trimestre, anio, dia_nombre, mes_nombre FROM calendario;

-- TABLA FACT VENTAS

CREATE TABLE fact_ventas (
    ID_venta INT PRIMARY KEY AUTO_INCREMENT,
    ID_cliente INT,
    ID_empleado INT,
    ID_canal_venta INT,
    ID_sucursal INT,
    ID_fecha_venta INT,
    ID_fecha_entrega INT,
    ID_producto INT,
    cantidad_venta INT,
    precio_venta FLOAT,

    FOREIGN KEY (ID_cliente) REFERENCES dim_clientes(ID_cliente),
    FOREIGN KEY (ID_empleado) REFERENCES dim_empleados(ID_empleado),
    FOREIGN KEY (ID_canal_venta) REFERENCES dim_canal_vta(ID_canal_vta),
    FOREIGN KEY (ID_sucursal) REFERENCES dim_sucursales(ID_sucursal),
    FOREIGN KEY (ID_fecha_venta) REFERENCES dim_calendario(ID_fecha),
    FOREIGN KEY (ID_fecha_entrega) REFERENCES dim_calendario(ID_fecha),
    FOREIGN KEY (ID_producto) REFERENCES dim_productos(ID_producto)
);

INSERT INTO fact_ventas (ID_cliente,
    ID_empleado,
    ID_canal_venta,
    ID_sucursal,
    ID_fecha_venta,
    ID_fecha_entrega,
    ID_producto,
    cantidad_venta,
    precio_venta)
SELECT cl.ID_cliente, e.ID_empleado, 
cv.ID_canal_vta, s.ID_sucursal, 
c1.ID_fecha, c2.ID_fecha, p.ID_producto, 
v.cantidad_venta, v.precio_venta
FROM stg_venta v
LEFT JOIN dim_clientes cl ON cl.stg_ID_cliente = v.ID_cliente
LEFT JOIN dim_empleados e ON e.stg_ID_empleado = v.ID_empleado
LEFT JOIN dim_canal_vta cv ON cv.stg_ID_canal_vta = v.ID_canal_vta
LEFT JOIN dim_sucursales s ON s.stg_ID_sucursal = v.ID_sucursal
LEFT JOIN dim_calendario c1 ON c1.stg_ID_fecha = v.fecha_venta
LEFT JOIN dim_calendario c2 ON c2.stg_ID_fecha = v.fecha_entrega_venta
LEFT JOIN dim_productos p ON p.stg_ID_producto = v.ID_producto;

-- Se agregan datos a dim_calendario que impedian la carga de datos
INSERT INTO dim_calendario (stg_ID_fecha)
SELECT DISTINCT fecha_entrega_venta
FROM stg_venta
WHERE fecha_entrega_venta NOT IN (SELECT stg_ID_fecha FROM dim_calendario);

--
