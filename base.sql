drop database if exists dfr2s9cf55jjgs;
create database  dfr2s9cf55jjgs;
use  dfr2s9cf55jjgs;

CREATE TABLE IF NOT EXISTS Cliente (
  idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT
 );


CREATE TABLE IF NOT EXISTS Poliza (
  idPoliza INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  costoBasico INT NULL,
  porcentajeBonificaion INT NULL,
  tipo VARCHAR(45) NULL,
  cobertura INT NULL,
  numeroCuotas INT NULL)
;

CREATE TABLE IF NOT EXISTS RegistroSiniestro (
  idRegistroSiniestro INT PRIMARY KEY NOT NULL);

CREATE TABLE IF NOT EXISTS Vehiculo (
  idVehiculo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  matricula VARCHAR(45) NULL,
  cilindraje VARCHAR(45) NULL,
  marca VARCHAR(45) NULL,
  color VARCHAR(45) NULL,
  Cliente_idCliente INT NOT NULL,
  Poliza_idPoliza INT NOT NULL,
  RegistroSiniestro_idRegistroSiniestro INT NOT NULL,
FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente (idCliente),
FOREIGN KEY (Poliza_idPoliza) REFERENCES Poliza (idPoliza),
FOREIGN KEY (RegistroSiniestro_idRegistroSiniestro) REFERENCES RegistroSiniestro (idRegistroSiniestro))
;

CREATE TABLE IF NOT EXISTS Asegurado (
  idAsegurado INT PRIMARY KEY NOT NULL,
  Vehiculo_idVehiculo INT NOT NULL,
  Vehiculo_Cliente_idCliente INT NOT NULL,
  Vehiculo_Poliza_idPoliza INT NOT NULL,
  Vehiculo_RegistroSiniestro_idRegistroSiniestro INT NOT NULL,
  FOREIGN KEY(Vehiculo_idVehiculo) REFERENCES Vehiculo (idVehiculo),
  FOREIGN KEY(Vehiculo_Cliente_idCliente) REFERENCES Vehiculo (Cliente_idCliente),
  FOREIGN KEY(Vehiculo_Poliza_idPoliza) REFERENCES Vehiculo (Poliza_idPoliza), 
  FOREIGN KEY(Vehiculo_RegistroSiniestro_idRegistroSiniestro) REFERENCES Vehiculo (RegistroSiniestro_idRegistroSiniestro)
);

CREATE TABLE IF NOT EXISTS Tomador (
  documento INT NULL,
  tipoDocumento VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  telefono INT NULL,
  fechanacimiento DATE NULL,
  idTomador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  edadT INT NULL,
  Cliente_idCliente INT NOT NULL,
  FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente (idCliente));

CREATE TABLE IF NOT EXISTS Siniestro (
  idSiniestro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  lugar VARCHAR(45) NULL,
  fecha VARCHAR(45) NULL,
  hora INT NULL,
  RegistroSiniestro_idRegistroSiniestro INT NOT NULL,
FOREIGN KEY (RegistroSiniestro_idRegistroSiniestro) REFERENCES RegistroSiniestro (idRegistroSiniestro));

CREATE TABLE IF NOT EXISTS ClienteAsegurado (
  documento INT NULL,
  tipoDocumento VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  telefono INT NULL,
  fechanacimiento DATE NULL,
  idClienteAsegurado INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  edadA INT NULL,
  Cliente_idCliente INT NOT NULL,
  FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente (idCliente)
);

CREATE TABLE IF NOT EXISTS NoAasegurado (
  documento INT NULL,
  tipoDocumento VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  telefono INT NULL,
  fechanacimiento DATE NULL,
  idNoAasegurado INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Vehiculo_idVehiculo INT NOT NULL,
  Vehiculo_Cliente_idCliente INT NOT NULL,
  Vehiculo_Poliza_idPoliza INT NOT NULL,
  Vehiculo_RegistroSiniestro_idRegistroSiniestro INT NOT NULL,
  FOREIGN KEY (Vehiculo_idVehiculo) REFERENCES Vehiculo (idVehiculo),
  FOREIGN KEY (Vehiculo_Cliente_idCliente) REFERENCES Vehiculo (Cliente_idCliente),
  FOREIGN KEY (Vehiculo_Poliza_idPoliza) REFERENCES Vehiculo (Poliza_idPoliza),
  FOREIGN KEY (Vehiculo_RegistroSiniestro_idRegistroSiniestro) REFERENCES Vehiculo (RegistroSiniestro_idRegistroSiniestro)
);

CREATE TABLE IF NOT EXISTS Concepto (
  idConcepto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  Poliza_idPoliza INT NOT NULL,
  FOREIGN KEY (Poliza_idPoliza) REFERENCES Poliza (idPoliza));
