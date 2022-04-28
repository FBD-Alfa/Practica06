DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public;
CREATE TABLE consemergencialeve(
	idConsulta INT NOT NULL UNIQUE,
	curpCliente CHAR(18) NOT NULL,
	nomMascota VARCHAR(50) NOT NULL CHECK(nomMascota <> ''),
	curpVeterinario CHAR(18) NOT NULL,
	idEstetica INT NOT NULL,
	precioEmergencia INT NOT NULL,
	procedimiento CHAR(100) CHECK(procedimiento <> '')
);
CREATE TABLE consemergenciaconsiderable(
	idConsulta INT NOT NULL UNIQUE,
	curpCliente CHAR(18) NOT NULL,
	nomMascota VARCHAR(50) NOT NULL CHECK(nomMascota <> ''),
	curpVeterinario CHAR(18) NOT NULL,
	idEstetica INT NOT NULL,
	precioEmergencia INT NOT NULL,
	procedimiento CHAR(100) CHECK(procedimiento <> '')
);
CREATE TABLE consemergenciagrave(
	idConsulta INT NOT NULL UNIQUE,
	curpCliente CHAR(18) NOT NULL,
	nomMascota VARCHAR(50) NOT NULL CHECK(nomMascota <> ''),
	curpVeterinario CHAR(18) NOT NULL,
	idEstetica INT NOT NULL,
	precioEmergencia INT NOT NULL,
	procedimiento CHAR(100) CHECK(procedimiento <> '')
);
CREATE TABLE consnormal(
	idConsulta INT NOT NULL UNIQUE,
	curpCliente CHAR(18) NOT NULL,
	nomMascota VARCHAR(50) NOT NULL CHECK(nomMascota <> ''),
	curpVeterinario CHAR(18) NOT NULL,
	idEstetica INT NOT NULL,
	precioNormal INT NOT NULL,
	estadoSalud VARCHAR(20) CHECK(estadoSalud <> ''),
	motivo VARCHAR(50) CHECK(motivo <> ''),
	fecha DATE NOT NULL
);
CREATE TABLE medicamentos(
	idConsulta INT NOT NULL,
	medicamentos VARCHAR(50) NOT NULL
);
CREATE TABLE sintomaleve (
	idConsulta INT NOT NULL UNIQUE,
	sintoma VARCHAR (50)
);
CREATE TABLE sintomaconsiderable (
	idConsulta INT NOT NULL UNIQUE,
	sintoma VARCHAR (50)
);
CREATE TABLE sintomagrave (
	idConsulta INT NOT NULL UNIQUE,
	sintoma VARCHAR (50)
);
CREATE TABLE generarconsemergencialeve(
	idConsulta INT NOT NULL,
	idRecibo INT NOT NULL UNIQUE
);
CREATE TABLE generarconsemergenciaconsiderable(
	idConsulta INT NOT NULL,
	idRecibo INT NOT NULL UNIQUE
);
CREATE TABLE generarconsemergenciagrave(
	idConsulta INT NOT NULL,
	idRecibo INT NOT NULL UNIQUE
);
CREATE TABLE generarconsnormal(
	idConsulta INT NOT NULL,
	idRecibo INT NOT NULL UNIQUE
);

/*
LLAVES PRIMARIAS
*/

/*
LLAVES COMPUESTAS
*/
ALTER TABLE medicamentos ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (idConsulta,medicamentos);
ALTER TABLE sintomaleve ADD CONSTRAINT sintomaleve_pkey PRIMARY KEY (idConsulta,sintoma);
ALTER TABLE sintomaconsiderable ADD CONSTRAINT sintomaconsiderable_pkey PRIMARY KEY (idConsulta,sintoma);
ALTER TABLE sintomagrave ADD CONSTRAINT sintomagrave_pkey PRIMARY KEY (idConsulta,sintoma);

/*
LLAVES FORANEAS
*/
ALTER TABLE consemergencialeve ADD CONSTRAINT consemergencialeve_pkey PRIMARY KEY (idConsulta);
-- ALTER TABLE consemergencialeve ADD CONSTRAINT consemergencialeve_fkey FOREIGN KEY (curpCliente) REFERENCES cliente(curp);
-- ALTER TABLE consemergencialeve ADD CONSTRAINT consemergencialeve_fkey FOREIGN KEY (nomMascota) REFERENCES mascota(curp, nommascota);
-- ALTER TABLE consemergencialeve ADD CONSTRAINT consemergencialeve_fkey FOREIGN KEY (curpVeterinario) REFERENCES veterinario(curp);
-- ALTER TABLE consemergencialeve ADD CONSTRAINT consemergencialeve_fkey FOREIGN KEY (idEstetica) REFERENCES estetica(idEstetica);
ALTER TABLE consemergenciaconsiderable ADD CONSTRAINT consemergenciaconsiderable_pkey PRIMARY KEY (idConsulta);
-- ALTER TABLE consemergenciaconsiderable ADD CONSTRAINT consemergenciaconsiderable_fkey FOREIGN KEY (curpCliente) REFERENCES cliente(curp);
-- ALTER TABLE consemergenciaconsiderable ADD CONSTRAINTconsemergenciaconsiderable_fkey FOREIGN KEY (nomMascota) REFERENCES mascota(curp, nommascota);
-- ALTER TABLE consemergenciaconsiderable ADD CONSTRAINT consemergenciaconsiderable_fkey FOREIGN KEY (curpVeterinario) REFERENCES veterinario(curp);
-- ALTER TABLE consemergenciaconsiderable ADD CONSTRAINT consemergenciaconsiderable_fkey FOREIGN KEY (idEstetica) REFERENCES estetica(idEstetica);
ALTER TABLE consemergenciagrave ADD CONSTRAINT consemergenciagrave_pkey PRIMARY KEY (idConsulta);
-- ALTER TABLE consemergenciagrave ADD CONSTRAINT consemergenciagrave_fkey FOREIGN KEY (curpCliente) REFERENCES cliente(curp);
-- ALTER TABLE consemergenciagrave ADD CONSTRAINT consemergenciagrave_fkey FOREIGN KEY (nomMascota) REFERENCES mascota(curp, nommascota);
-- ALTER TABLE consemergenciagrave ADD CONSTRAINT consemergenciagrave_fkey FOREIGN KEY (curpVeterinario) REFERENCES veterinario(curp);
-- ALTER TABLE consemergenciagrave ADD CONSTRAINT consemergenciagrave_fkey FOREIGN KEY (idEstetica) REFERENCES estetica(idEstetica);
ALTER TABLE consnormal ADD CONSTRAINT consnormal_pkey PRIMARY KEY (idConsulta);
-- ALTER TABLE consnormal ADD CONSTRAINT consnormal_fkey FOREIGN KEY (curpCliente) REFERENCES cliente(curp);
-- ALTER TABLE consnormal ADD CONSTRAINT consnormal_fkey FOREIGN KEY (nomMascota) REFERENCES mascota(curp, nommascota);
-- ALTER TABLE consnormal ADD CONSTRAINT consnormal_fkey FOREIGN KEY (curpVeterinario) REFERENCES veterinario(curp);
-- ALTER TABLE consnormal ADD CONSTRAINT consnormal_fkey FOREIGN KEY (idEstetica) REFERENCES estetica(idEstetica);
/*
ALTER TABLE generarconsemergencialeve ADD CONSTRAINT generarconsemergencialeve_fkey FOREIGN KEY (idRecibo) REFERENCES recibo(idRecibo);
ALTER TABLE generarconsemergencialeve ADD CONSTRAINT generarconsemergencialeve_fkey FOREIGN KEY (idConsulta ) REFERENCES consemergencialeve (idConsulta);
ALTER TABLE generarconsemergencialeve ADD CONSTRAINT generarconsemergenciaconsiderable_fkey FOREIGN KEY (idConsulta ) recibo(idRecibo);
ALTER TABLE generarconsemergencialeve ADD CONSTRAINT generarconsemergenciaconsiderable_fkey FOREIGN KEY (idConsulta ) REFERENCES consemergenciaconsiderable (idConsulta);
ALTER TABLE generarconsemergenciagrave ADD CONSTRAINT generarconsemergenciagrave_fkey FOREIGN KEY (idConsulta ) recibo(idRecibo);
ALTER TABLE generarconsemergenciagrave ADD CONSTRAINT generarconsemergenciagrave_fkey FOREIGN KEY (idConsulta ) REFERENCES consemergenciagrave (idConsulta);
ALTER TABLE generarconsnormal ADD CONSTRAINT generarconsnormal_fkey FOREIGN KEY (idConsulta ) recibo(idRecibo);
ALTER TABLE generarconsnormal ADD CONSTRAINT generarconsnormal_fkey FOREIGN KEY (idConsulta ) REFERENCES consnormal (idConsulta);

*/