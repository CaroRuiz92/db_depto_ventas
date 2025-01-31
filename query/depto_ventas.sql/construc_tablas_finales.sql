-- Dimensiones
CREATE TABLE dim_canal_vta (
    ID_canal_vta INT PRIMARY KEY AUTO_INCREMENT,
    descrip_canal_vta VARCHAR(50)
);

INSERT INTO dim_canal_vta(descrip_canal_vta)
SELECT descrip_canal_vta FROM canal_venta;

CREATE TABLE dim_clientes (
    ID_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo_cliente VARCHAR(70),
    domicilio_cliente VARCHAR(70),
    ID_localidad_cliente INT,
    edad_cliente INT,
    rangoedad_cliente VARCHAR(70),
    telefono_cliente VARCHAR(70),
    FOREIGN KEY (ID_localidad_cliente) REFERENCES localidades(ID_localidad)
);

INSERT INTO dim_clientes (nombre_completo_cliente, domicilio_cliente, 
ID_localidad_cliente, edad_cliente, rangoedad_cliente, telefono_cliente)
SELECT nombre_apellido_cliente, domicilio_cliente, id_localidad, edad_cliente, RangoEdad, telefono_cliente FROM stg_clientes;

CREATE TABLE dim_sucursales (
    ID_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    nombre_sucursal VARCHAR(70),
    direccion_sucursal VARCHAR(70),
    ID_localidad INT,
    FOREIGN KEY (ID_localidad) REFERENCES localidades(ID_localidad)
);

INSERT INTO dim_sucursales (nombre_sucursal, direccion_sucursal, ID_localidad)
SELECT nombre_sucursal, direccion_sucursal, ID_localidad FROM sucursales;

CREATE TABLE dim_empleados (
    ID_empleado INT PRIMARY KEY AUTO_INCREMENT,
    apellido_empleado VARCHAR(70),
    nombre_empleado VARCHAR(70),
    sector_empleado VARCHAR(70),
    cargo_empleado VARCHAR(70),
    salario_empleado INT);

INSERT INTO dim_empleados (apellido_empleado, nombre_empleado, sector_empleado, 
cargo_empleado, salario_empleado)
SELECT apellido_empleado, nombre_empleado, sector_empleado, cargo_empleado, salario_empleado FROM stg_empleados;
-- Nota: se opta por dejar el dato sobre la sucursal en la futura fact_ventas por considerar 
-- que los empleados podrían cambiar de sucursal con cierta frecuencia

CREATE TABLE dim_productos (
    ID_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(70),
    tipo_producto VARCHAR(80),
    precio_producto FLOAT
);

INSERT INTO dim_productos (nombre_producto, tipo_producto, precio_producto)
SELECT concepto_producto, tipo_producto, precio_producto FROM stg_productos;

CREATE TABLE dim_calendario (
    ID_fecha INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    dia INT,
    semana INT,
    mes INT,
    trimestre INT,
    anio INT,
    dia_nombre VARCHAR(20),
    mes_nombre VARCHAR(30)
);

INSERT INTO dim_calendario (fecha, dia, semana, mes, trimestre, anio, dia_nombre, mes_nombre)
SELECT fecha, dia, semana, mes, trimestre, anio, dia_nombre, mes_nombre FROM calendario;