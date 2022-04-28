DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE cliente(
    curp CHAR(18) NOT NULL UNIQUE,
    apellidoM VARCHAR(30) NOT NULL,
    apellidoP VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    calle VARCHAR(50) NOT NULL,
    numero SMALLINT NOT NULL,
    cp INT NOT NULL,
    telefono BIGINT NOT NULL,
    cumpleanios DATE,
    email VARCHAR(100),
    esFrecuente BOOLEAN NOT NULL
);

CREATE TABLE tarjeta(
    numTarjeta VARCHAR(19) NOT NULL UNIQUE,
    curpCliente CHAR(18) NOT NULL,
    vencimiento DATE NOT NULL,
    titular VARCHAR(100),
);

CREATE TABLE mascota(
    nomMascota VARCHAR(50) NOT NULL,
    curpCliente CHAR(18) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    edad SMALLINT NOT NULL
);

/*
 * Llaves cliente
 */
 ALTER TABLE cliente ADD CONSTRAINT cliente_pkey PRIMARY KEY(curp);

 /*
 * Llaves tarjeta
 */
  ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_pkey PRIMARY KEY(numTarjeta);
  ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_fkeyCliente FOREIGN KEY(curp)
REFERENCES cliente(curp);

/*
 * Llaves mascota
 */
ALTER TABLE mascota ADD CONSTRAINT mascota_pkey PRIMARY KEY(nomMascota, curpCliente);