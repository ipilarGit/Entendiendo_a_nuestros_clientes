-- Desafio - Entendiendo como se comportan nuestros clientes

-- Req.1. Cargar el respaldo de la base de datos unidad2.sql.


CREATE DATABASE compras;
CREATE DATABASE
pizzeria=# \c compras;
Ahora está conectado a la base de datos «compras» con el usuario «postgres».

compras=# CREATE TABLE cliente (id SERIAL, nombre VARCHAR(50), email VARCHAR(30), PRIMARY KEY(id) );
CREATE TABLE

compras=# CREATE TABLE compra(id SERIAL, fecha TIMESTAMP DEFAULT now(), PRIMARY KEY(id), cliente_id INT REFERENCES cliente(id) );
CREATE TABLE

compras=# CREATE TABLE producto(id SERIAL, descripcion VARCHAR(50), stock INT CHECK (stock>=0), precio INT CHECK (precio>0), PRIMARY KEY(id));
CREATE TABLE

compras=# CREATE TABLE detalle_compra(id SERIAL, producto_id INT REFERENCES producto(id), compra_id INT REFERENCES compra(id), cantidad INT CHECK(cantidad>0),  PRIMARY KEY(id) );
CREATE TABLE


compras=# INSERT INTO cliente (nombre, email) VALUES('usuario01', 'usuario01@gmail.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario02', 'usuario02@yahoo.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario03', 'usuario03@hotmail.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario04', 'usuario04@hotmail.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario05', 'usuario05@yahoo.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario06', 'usuario06@hotmail.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario07', 'usuario07@yahoo.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario08', 'usuario08@yahoo.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario09', 'usuario09@hotmail.com');
INSERT 0 1
compras=# INSERT INTO cliente (nombre, email) VALUES('usuario10', 'usuario010@hotmail.com');
INSERT 0 1

compras=# select * from cliente;
 id |  nombre   |         email
----+-----------+------------------------
  1 | usuario01 | usuario01@gmail.com
  2 | usuario02 | usuario02@yahoo.com
  3 | usuario03 | usuario03@hotmail.com
  4 | usuario04 | usuario04@hotmail.com
  5 | usuario05 | usuario05@yahoo.com
  6 | usuario06 | usuario06@hotmail.com
  7 | usuario07 | usuario07@yahoo.com
  8 | usuario08 | usuario08@yahoo.com
  9 | usuario09 | usuario09@hotmail.com
 10 | usuario10 | usuario010@hotmail.com
(10 filas)


compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 1', 6, 9107);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 2', 5, 1760);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 3', 9, 9449);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 4', 8, 194);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 5', 10, 3764);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 6', 6, 8655);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 7', 4, 2875);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 8', 0, 8923);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 9', 4, 4219);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 10', 1, 3001);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 11', 9, 7993);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 12', 3, 8504);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 13', 10, 2415);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 14', 5, 3824);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 15', 10, 7358);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 16', 7, 3631);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 17', 3, 4467);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 18', 2, 9383);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 19', 6, 1140);
INSERT 0 1
compras=# INSERT INTO producto (descripcion, stock, precio) VALUES ('Producto 20', 4, 102);
INSERT 0 1

compras=# select * from producto;
 id | descripcion | stock | precio
----+-------------+-------+--------
  1 | Producto 1  |     6 |   9107
  2 | Producto 2  |     5 |   1760
  3 | Producto 3  |     9 |   9449
  4 | Producto 4  |     8 |    194
  5 | Producto 5  |    10 |   3764
  6 | Producto 6  |     6 |   8655
  7 | Producto 7  |     4 |   2875
  8 | Producto 8  |     0 |   8923
  9 | Producto 9  |     4 |   4219
 10 | Producto 10 |     1 |   3001
 11 | Producto 11 |     9 |   7993
 12 | Producto 12 |     3 |   8504
 13 | Producto 13 |    10 |   2415
 14 | Producto 14 |     5 |   3824
 15 | Producto 15 |    10 |   7358
 16 | Producto 16 |     7 |   3631
 17 | Producto 17 |     3 |   4467
 18 | Producto 18 |     2 |   9383
 19 | Producto 19 |     6 |   1140
 20 | Producto 20 |     4 |    102
(20 filas)

-- Req.2. 2. El cliente usuario01 ha realizado la siguiente compra:
-- ● producto: producto9
-- ● cantidad: 5
-- ● fecha: fecha del sistema
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta 
-- la tabla producto para validar si fue efectivamente descontado en el stock.

compras=# BEGIN;
BEGIN
compras=*# select * from compra;
 id | fecha | cliente_id
----+-------+------------
(0 filas)


compras=*# INSERT INTO compra (fecha,cliente_id) VALUES ('2020-11-25',1);
INSERT 0 1
compras=*# select * from compra;
 id |   fecha    | cliente_id
----+------------+------------
  1 | 2020-11-25 |          1
(1 fila)


compras=*# INSERT INTO detalle_compra(producto_id,compra_id,cantidad) VALUES(9,1,5);
INSERT 0 1
compras=*# select *  from detalle_compra;
 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
  1 |           9 |         1 |        5
(1 fila)


compras=*# UPDATE producto SET stock = stock - 5 WHERE id = 9;
ERROR:  el nuevo registro para la relación «producto» viola la restricción «check» «producto_stock_check»
DETALLE:  La fila que falla contiene (9, Producto 9, -1, 4219).

compras=!# ROLLBACK;
ROLLBACK
compras=# SELECT * FROM producto;
 id | descripcion | stock | precio
----+-------------+-------+--------
  1 | Producto 1  |     6 |   9107
  2 | Producto 2  |     5 |   1760
  3 | Producto 3  |     9 |   9449
  4 | Producto 4  |     8 |    194
  5 | Producto 5  |    10 |   3764
  6 | Producto 6  |     6 |   8655
  7 | Producto 7  |     4 |   2875
  8 | Producto 8  |     0 |   8923
  9 | Producto 9  |     4 |   4219
 10 | Producto 10 |     1 |   3001
 11 | Producto 11 |     9 |   7993
 12 | Producto 12 |     3 |   8504
 13 | Producto 13 |    10 |   2415
 14 | Producto 14 |     5 |   3824
 15 | Producto 15 |    10 |   7358
 16 | Producto 16 |     7 |   3631
 17 | Producto 17 |     3 |   4467
 18 | Producto 18 |     2 |   9383
 19 | Producto 19 |     6 |   1140
 20 | Producto 20 |     4 |    102
(20 filas)

compras=# SELECT * FROM detalle_compra;
 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
(0 filas)

compras=# select * from compra;
 id | fecha | cliente_id
----+-------+------------
(0 filas)

compras=#


--Req. 3. El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8
-- ● cantidad: 3 de cada producto
-- ● fecha: fecha del sistema
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este
-- requerimiento y luego consulta la tabla producto para validar que si alguno de ellos
-- se queda sin stock, no se realice la compra.

compras=# ALTER SEQUENCE compra_id_seq RESTART WITH 1;
ALTER SEQUENCE
compras=# ALTER SEQUENCE detalle_compra_id_seq RESTART WITH 1;
ALTER SEQUENCE
compras=#

compras=# BEGIN;
compras=*# INSERT INTO compra(cliente_id) VALUES(2); --inserta compra para usuario02 = 2
INSERT
compras=*# select * from compra;
 id |           fecha            | cliente_id
----+----------------------------+------------
  1 | 2020-11-25 20:55:13.387624 |          2
(1 fila)


compras=*# INSERT INTO detalle_compra(producto_id,compra_id,cantidad) VALUES(1,1,3); --inserta detalle producto1 = 1 de la compra con id = 1 cantidad = 3
INSERT 0 1
compras=*# select * from detalle_compra;
 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
  1 |           1 |         1 |        3
(1 fila)

compras=*# UPDATE producto SET stock = stock - 3 WHERE id = 1; --actualiza producto1 = 1 y se rebaja al stock 3
UPDATE 1
compras=*# select * from producto;
 id | descripcion | stock | precio
----+-------------+-------+--------
  2 | Producto 2  |     5 |   1760
  3 | Producto 3  |     9 |   9449
  4 | Producto 4  |     8 |    194
  5 | Producto 5  |    10 |   3764
  6 | Producto 6  |     6 |   8655
  7 | Producto 7  |     4 |   2875
  8 | Producto 8  |     0 |   8923
  9 | Producto 9  |     4 |   4219
 10 | Producto 10 |     1 |   3001
 11 | Producto 11 |     9 |   7993
 12 | Producto 12 |     3 |   8504
 13 | Producto 13 |    10 |   2415
 14 | Producto 14 |     5 |   3824
 15 | Producto 15 |    10 |   7358
 16 | Producto 16 |     7 |   3631
 17 | Producto 17 |     3 |   4467
 18 | Producto 18 |     2 |   9383
 19 | Producto 19 |     6 |   1140
 20 | Producto 20 |     4 |    102
  1 | Producto 1  |     3 |   9107
(20 filas)


compras=*# INSERT INTO detalle_compra(producto_id,compra_id,cantidad) VALUES(2,1,3); --inserta detalle producto2 = 2 de la compra con id = 2 cantidad = 3
INSERT 0 1
compras=*# select * from detalle_compra;
 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
  1 |           1 |         1 |        3
  2 |           2 |         1 |        3
(2 filas)


compras=*# UPDATE producto SET stock = stock - 3 WHERE id = 2;  --actualiza producto2 = 2 y se rebaja al stock 3
UPDATE 1
compras=*# select * from producto;
 id | descripcion | stock | precio
----+-------------+-------+--------
  3 | Producto 3  |     9 |   9449
  4 | Producto 4  |     8 |    194
  5 | Producto 5  |    10 |   3764
  6 | Producto 6  |     6 |   8655
  7 | Producto 7  |     4 |   2875
  8 | Producto 8  |     0 |   8923
  9 | Producto 9  |     4 |   4219
 10 | Producto 10 |     1 |   3001
 11 | Producto 11 |     9 |   7993
 12 | Producto 12 |     3 |   8504
 13 | Producto 13 |    10 |   2415
 14 | Producto 14 |     5 |   3824
 15 | Producto 15 |    10 |   7358
 16 | Producto 16 |     7 |   3631
 17 | Producto 17 |     3 |   4467
 18 | Producto 18 |     2 |   9383
 19 | Producto 19 |     6 |   1140
 20 | Producto 20 |     4 |    102
  1 | Producto 1  |     3 |   9107
  2 | Producto 2  |     2 |   1760
(20 filas)


compras=*# INSERT INTO detalle_compra(producto_id,compra_id,cantidad) VALUES(8,1,3);
INSERT 0 1
compras=*# select * from detalle_compra;
 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
  1 |           1 |         1 |        3
  2 |           2 |         1 |        3
  3 |           8 |         1 |        3
(3 filas)


compras=*# UPDATE producto SET stock = stock - 3 WHERE id = 8;
ERROR:  el nuevo registro para la relación «producto» viola la restricción «check» «producto_stock_check»
DETALLE:  La fila que falla contiene (8, Producto 8, -3, 8923).
compras=!# ROLLBACK;
ROLLBACK
compras=# SELECT * FROM compra;
 id | fecha | cliente_id
----+-------+------------
(0 filas)

compras=# SELECT * FROM detalle_compra;
 id | producto_id | compra_id | cantidad
----+-------------+-----------+----------
(0 filas)

compras=# SELECT * FROM producto;
 id | descripcion | stock | precio
----+-------------+-------+--------
  3 | Producto3   |     9 |   9449
  4 | Producto4   |     8 |    194
  5 | Producto5   |    10 |   3764
  6 | Producto6   |     6 |   8655
  7 | Producto7   |     4 |   2875
  9 | Producto9   |     4 |   4219
 10 | Producto10  |     1 |   3001
 11 | Producto11  |     9 |   7993
 12 | Producto12  |     3 |   8504
 13 | Producto13  |    10 |   2415
 14 | Producto14  |     5 |   3824
 15 | Producto15  |    10 |   7358
 16 | Producto16  |     7 |   3631
 17 | Producto17  |     3 |   4467
 18 | Producto18  |     2 |   9383
 19 | Producto19  |     6 |   1140
 20 | Producto20  |     4 |    102
  1 | Producto1   |     6 |   9107
  2 | Producto2   |     5 |   1760
  8 | Producto8   |     0 |   8923
(20 filas)

-- 4. Realizar las siguientes consultas:
-- a. Deshabilitar el AUTOCOMMIT

compras=# \set AUTOCOMMIT off
compras=# \echo :AUTOCOMMIT;
off;

-- b. Insertar un nuevo cliente

compras=# SELECT * FROM CLIENTE;
 id |  nombre   |         email
----+-----------+------------------------
  1 | usuario01 | usuario01@gmail.com
  2 | usuario02 | usuario02@yahoo.com
  3 | usuario03 | usuario03@hotmail.com
  4 | usuario04 | usuario04@hotmail.com
  5 | usuario05 | usuario05@yahoo.com
  6 | usuario06 | usuario06@hotmail.com
  7 | usuario07 | usuario07@yahoo.com
  8 | usuario08 | usuario08@yahoo.com
  9 | usuario09 | usuario09@hotmail.com
 10 | usuario10 | usuario010@hotmail.com
(10 filas)

compras=*# INSERT INTO CLIENTES (nombre,email) VALUES('usuario11','usuario011@gmail.com');
ERROR:  no existe la relación «clientes»
LÍNEA 1: INSERT INTO CLIENTES (nombre,email) VALUES('usuario11','usua...
                     ^
compras=!# ROLLBACK;
ROLLBACK
compras=# INSERT INTO CLIENTE(nombre,email) VALUES('usuario11','usuario011@gmail.com');
INSERT 0 1

-- c. Confirmar que fue agregado en la tabla cliente


compras=*# SELECT * FROM cliente;
 id |  nombre   |         email
----+-----------+------------------------
  1 | usuario01 | usuario01@gmail.com
  2 | usuario02 | usuario02@yahoo.com
  3 | usuario03 | usuario03@hotmail.com
  4 | usuario04 | usuario04@hotmail.com
  5 | usuario05 | usuario05@yahoo.com
  6 | usuario06 | usuario06@hotmail.com
  7 | usuario07 | usuario07@yahoo.com
  8 | usuario08 | usuario08@yahoo.com
  9 | usuario09 | usuario09@hotmail.com
 10 | usuario10 | usuario010@hotmail.com
 11 | usuario11 | usuario011@gmail.com
(11 filas)

-- d. Realizar un ROLLBACK

compras=*# ROLLBACK;
ROLLBACK

-- e. Confirmar que se restauró la información, sin considerar la inserción del punto b

compras=# SELECT * FROM cliente;
 id |  nombre   |         email
----+-----------+------------------------
  1 | usuario01 | usuario01@gmail.com
  2 | usuario02 | usuario02@yahoo.com
  3 | usuario03 | usuario03@hotmail.com
  4 | usuario04 | usuario04@hotmail.com
  5 | usuario05 | usuario05@yahoo.com
  6 | usuario06 | usuario06@hotmail.com
  7 | usuario07 | usuario07@yahoo.com
  8 | usuario08 | usuario08@yahoo.com
  9 | usuario09 | usuario09@hotmail.com
 10 | usuario10 | usuario010@hotmail.com
(10 filas)

-- f. Habilitar de nuevo el AUTOCOMMIT

compras=*# \set AUTOCOMMIT on;
valor «on;» no reconocido para «AUTOCOMMIT»: se esperaba booleano
compras=*# \set AUTOCOMMIT on
compras=*# \echo :AUTOCOMMIT
on
compras=*#


















































