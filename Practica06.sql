DROP SCHEMA IF EXISTS public CASCADE; -- Borrar todo

CREATE SCHEMA public; -- Creamos el esquema publico
/*
 * Definición de tablas 
 */
 
 -- Tablas llave primaria 
 -- Tablas llave foranea
 CREATE TABLE producto(
	 idProducto CHAR(10) NOT NULL UNIQUE CHECK(CHAR_LENGTH(idProducto) = 10),
	 idEstetica BIGINT CHECK(idEstetica <> 0),
	 idRecibo INT CHECK(idRecibo <> 0),
	 nombreImagen VARCHAR(30) NOT NULL CHECK(nombreImagen <> ''),
	 precio INT CHECK(precio <> 0),
	 nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	 cantidad INT CHECK(cantidad <> 0),
	 descripcion VARCHAR(200) NOT NULL CHECK(descripcion <> ''),
	 tipo VARCHAR(30) NOT NULL CHECK(tipo <> ''),
	 caducidad VARCHAR(30) NOT NULL CHECK(caducidad <> ''),
	 esProductoCaducable BOOLEAN NOT NULL
 );
 
 CREATE TABLE caja(
	 noCaja INT CHECK(noCaja <> 0),
	 idEstetica BIGINT CHECK(idEstetica <> 0)
 );
 
 CREATE TABLE recibo(
	 idRecibo INT CHECK(idRecibo <> 0),
	 idEstetica BIGINT CHECK(idEstetica <> 0),
	 noCaja INT CHECK(noCaja <> 0),
	 esFisico BOOLEAN NOT NULL,
	 esOnline BOOLEAN NOT NULL
 );
/*
 * Llaves producto
 */ 
 ALTER TABLE producto ADD CONSTRAINT producto_pkey PRIMARY KEY(idProducto);
 /*ALTER TABLE producto ADD CONSTRAINT producto_fkeyEstetica FOREIGN KEY(idEstetica)
REFERENCES estetica(idEstetica);
 ALTER TABLE producto ADD CONSTRAINT producto_fkeyRecibo FOREIGN KEY(idRecibo)
REFERENCES recibo(idRecibo);*/

/*
 * Llaves caja
 */ 
 ALTER TABLE caja ADD CONSTRAINT caja_pkey PRIMARY KEY(noCaja);
 /*ALTER TABLE caja ADD CONSTRAINT caja_fkey FOREIGN KEY(idEstetica)
REFERENCES estetica(idEstetica);*/

/*
 * Llaves recibo
 */
 ALTER TABLE recibo ADD CONSTRAINT recibo_pkey PRIMARY KEY(idRecibo); 
 /*ALTER TABLE recibo ADD CONSTRAINT recibo_fkeyRecibo FOREIGN KEY(idEstetica)
REFERENCES estetica(idEstetica);
 ALTER TABLE recibo ADD CONSTRAINT recibo_fkeycaja FOREIGN KEY(noCaja)
REFERENCES caja(noCaja);*/