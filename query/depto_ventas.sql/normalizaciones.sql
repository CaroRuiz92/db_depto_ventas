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
DROP col10_cliente;

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