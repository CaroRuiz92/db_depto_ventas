-- Active: 1734956459041@@127.0.0.1@3306@depto_ventas

-- Se normalizan los datos de la tabla Sucursales
UPDATE sucursales
SET localidad_sucursal = 'Ciudad de Buenos Aires'
WHERE localidad_sucursal IN ('CABA', 'Capital', 'Capital Federal', 'CapFed', 'Cap. Fed.', 'Cap.   Federal', 'Cdad de Buenos Aires');

UPDATE sucursales
SET localidad_sucursal = 'Córdoba'
WHERE localidad_sucursal = 'Coroba';

UPDATE sucursales
SET provincia_sucursal = 'Ciudad de Buenos Aires'
WHERE provincia_sucursal IN ('CABA', 'C deBuenos Aires');

UPDATE sucursales
SET provincia_sucursal = 'Buenos Aires'
WHERE provincia_sucursal IN ('Bs As', 'Bs.As.', 'B. Aires', 'B.Aires', 'Provincia de Buenos Aires', 'Prov de Bs As.', 'Pcia Bs AS');

-- Se cambian nombres de columnas en tabla Proveedores
ALTER TABLE proveedores
CHANGE COLUMN departamento_proveedor pais_proveed VARCHAR(255);

ALTER TABLE proveedores
CHANGE COLUMN pais_proveedor departamento_proveedor VARCHAR(255);

-- Se borran columnas innecesarias de la tabla Clientes

ALTER TABLE clientes
DROP COLUMN x_cliente,
DROP COLUMN y_cliente,
DROP COLUMN fecha_alta_cliente,
DROP COLUMN usuario_alta_cliente,
DROP COLUMN usuario_ultima_modific_cliente,
DROP COLUMN col10_cliente;

ALTER TABLE clientes
DROP COLUMN fecha_ultima_modific_cliente;

-- Se discretizan las edades de los clientes
ALTER TABLE clientes
ADD COLUMN RangoEdad VARCHAR(50);

UPDATE clientes
SET RangoEdad = CASE
WHEN edad_cliente BETWEEN 0 AND 17 THEN 'Menor de edad'
    WHEN edad_cliente BETWEEN 18 AND 25 THEN 'Joven'
    WHEN edad_cliente BETWEEN 26 AND 45 THEN 'Adulto'
    ELSE 'Mayor'
END;

-- Se normaliza la información sobre localidades y provincias que comparten las tablas Clientes, Proveedores y Sucursales
CREATE TABLE localidades (
    ID_localidad INT AUTO_INCREMENT PRIMARY KEY,
    localidad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL
);

-- Se insertan valores en crudo en la tabla localidades
INSERT INTO localidades (localidad, provincia)
SELECT DISTINCT localidad_cliente AS localidad, provincia_cliente AS provincia
FROM clientes
UNION
SELECT DISTINCT ciudad_proveedor AS localidad, provincia_proveedor AS provincia
FROM proveedores
UNION
SELECT DISTINCT localidad_sucursal AS localidad, provincia_sucursal AS provincia
FROM sucursales;

-- Se agregan columnas para unir localidades con clientes, sucursales y proveedores
ALTER TABLE clientes ADD COLUMN id_localidad INT;
ALTER TABLE sucursales ADD COLUMN id_localidad INT;
ALTER TABLE proveedores ADD COLUMN id_localidad INT;

UPDATE clientes c
JOIN localidades l
ON c.localidad_cliente = l.localidad AND
c.provincia_cliente = l.provincia
SET c.id_localidad = l.ID_localidad;

UPDATE sucursales s
JOIN localidades l
ON s.localidad_sucursal = l.localidad AND
s.provincia_sucursal = l.provincia
SET s.id_localidad = l.ID_localidad;

UPDATE proveedores p
JOIN localidades l
ON p.ciudad_proveedor = l.localidad AND
p.provincia_proveedor = l.provincia
SET p.id_localidad = l.ID_localidad;

-- Queda la corrección de datos en localidades según se disponga desde otro departamentos

-- Eliminación de columnas innecesarias en tablas clientes, proveedores y sucursales

ALTER TABLE clientes
DROP COLUMN localidad_cliente,
DROP COLUMN provincia_cliente,
DROP COLUMN marca_baja_cliente;

ALTER TABLE proveedores
DROP COLUMN ciudad_proveedor,
DROP COLUMN pais_proveed,
DROP COLUMN provincia_proveedor,
DROP COLUMN departamento_proveedor;

ALTER TABLE sucursales
DROP COLUMN localidad_sucursal,
DROP COLUMN provincia_sucursal;

-- Se indexan otras tablas con conectadas entre sí

ALTER TABLE venta
ADD COLUMN ID_fecha_venta INT;

ALTER TABLE venta
ADD CONSTRAINT fk_fecha
FOREIGN KEY (ID_fecha_venta) REFERENCES calendario(ID_fecha);

UPDATE venta v
JOIN calendario c
ON v.fecha_venta = c.fecha
SET v.ID_fecha_venta = c.ID_fecha; 

ALTER TABLE venta
DROP COLUMN fecha_venta;

ALTER TABLE venta
ADD COLUMN ID_fecha_entrega_venta INT;

ALTER TABLE venta
ADD CONSTRAINT fk_fecha_entrega
FOREIGN KEY (ID_fecha_entrega_venta) REFERENCES calendario(ID_fecha);

UPDATE venta v
JOIN calendario c
ON v.fecha_entrega_venta = c.fecha
SET v.ID_fecha_entrega_venta = c.ID_fecha; 

ALTER TABLE venta
DROP COLUMN fecha_entrega_venta;

-- Venta ya está preparada para ser una tabla fact dentro de un modelo estrella
-- Se distingue Venta como stg_venta previo a la construcción de la fact
RENAME TABLE venta TO stg_venta;

-- Se hace lo mismo para las primeras dimensiones del futuro modelo estrella

RENAME TABLE clientes TO stg_clientes;
RENAME TABLE productos TO stg_productos;
RENAME TABLE empleados TO stg_empleados;

-- Se cambian nombres en la tabla Calendario que están en inglés

UPDATE calendario
SET dia_nombre = CASE 
    WHEN dia_nombre = 'Monday' THEN 'Lunes'
    WHEN dia_nombre = 'Tuesday' THEN 'Martes'
    WHEN dia_nombre = 'Wednesday' THEN 'Miércoles'
    WHEN dia_nombre = 'Thursday' THEN 'Jueves'
    WHEN dia_nombre = 'Friday' THEN 'Viernes'
    WHEN dia_nombre = 'Saturday' THEN 'Sábado'
    WHEN dia_nombre = 'Sunday' THEN 'Domingo'
END
WHERE dia_nombre IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- Se corrigen retornos \r en el campo mes_nombre
UPDATE calendario
SET mes_nombre = TRIM(TRAILING CHAR(13) FROM mes_nombre);
UPDATE calendario
SET mes_nombre = CASE 
    WHEN TRIM(mes_nombre) = 'January' THEN 'Enero'
    WHEN TRIM(mes_nombre) = 'February' THEN 'Febrero'
    WHEN TRIM(mes_nombre) = 'March' THEN 'Marzo'
    WHEN TRIM(mes_nombre) = 'April' THEN 'Abril'
    WHEN TRIM(mes_nombre) = 'May' THEN 'Mayo'
    WHEN TRIM(mes_nombre) = 'June' THEN 'Junio'
    WHEN TRIM(mes_nombre) = 'July' THEN 'Julio'
    WHEN TRIM(mes_nombre) = 'August' THEN 'Agosto'
    WHEN TRIM(mes_nombre) = 'September' THEN 'Septiembre'
    WHEN TRIM(mes_nombre) = 'October' THEN 'Octubre'
    WHEN TRIM(mes_nombre) = 'November' THEN 'Noviembre'
    WHEN TRIM(mes_nombre) = 'December' THEN 'Diciembre'
END
WHERE TRIM(mes_nombre) IN ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

-- Se ajustan los nombres de los canales de venta
UPDATE canal_venta
SET descrip_canal_vta = 'Telefónica'
WHERE ID_canal_vta = 1;

UPDATE canal_venta
SET descrip_canal_vta = 'Online'
WHERE ID_canal_vta = 2;

-- Se actualizan los datos de empleados relacionados a sucursales

UPDATE stg_empleados
INNER JOIN sucursales
ON stg_empleados.sucursal_empleado = sucursales.nombre_sucursal
SET stg_empleados.sucursal_empleado = sucursales.ID_sucursales;
