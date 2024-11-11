CREATE DATABASE concesionaria_autos;

USE concesionaria_autos;

CREATE TABLE `Vehiculo` (
	`id` INTEGER NOT NULL,
	`modelo` TINYINT NOT NULL,
	`descripcion` VARCHAR(255) NOT NULL,
	`precio` DOUBLE NOT NULL,
	`nombre` VARCHAR(100) NOT NULL
);


CREATE TABLE `Usuario` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(50) NOT NULL,
	`telefono` INTEGER NOT NULL,
	`direccion` TEXT(65535) NOT NULL,
	`codigo_postal` SMALLINT NOT NULL,
	`correo` VARCHAR(100) NOT NULL,
	`contrasena` VARCHAR(16) NOT NULL,
	`cedula` VARCHAR(250) NOT NULL,
	`estado` CHAR(1) NOT NULL,
	PRIMARY KEY(`id`)
);



CREATE TABLE `Admin` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`usuario_id` INTEGER,
	PRIMARY KEY(`id`)
);


CREATE TABLE `Vendedor` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`usuario_id` INTEGER NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE `Venta` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`subTotal` FLOAT NOT NULL,
	`Total` FLOAT NOT NULL,
	`fecha` DATETIME NOT NULL,
	`cliente_id` INTEGER NOT NULL,
	`vendedor_id` INTEGER NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE `Detalle_venta` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`cantidad` INTEGER NOT NULL,
	`subtotal` FLOAT NOT NULL,
	`venta_id` INTEGER NOT NULL,
	`vehiculo_id` INTEGER NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE `Cliente` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`usuario_id` INTEGER NOT NULL,
	PRIMARY KEY(`id`)
);


CREATE TABLE `Solicitiud` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`cliente_id` INTEGER NOT NULL,
	`vehiculo_id` INTEGER NOT NULL,
	`fecha` DATETIME NOT NULL,
	`estado` CHAR(1) NOT NULL,
	PRIMARY KEY(`id`)
);


ALTER TABLE `Venta`
ADD FOREIGN KEY(`id`) REFERENCES `Detalle_venta`(`venta_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Vehiculo`
ADD FOREIGN KEY(`id`) REFERENCES `Detalle venta`(`vehiculo_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Usuario`
ADD FOREIGN KEY(`usuario_idid`) REFERENCES `Cliente`(`usuario_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Venta`
ADD FOREIGN KEY(`cliente_id`) REFERENCES `Cliente`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Usuario`
ADD FOREIGN KEY(`id`) REFERENCES `Vendedor`(`usuario_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Vendedor`
ADD FOREIGN KEY(`id`) REFERENCES `Venta`(`vendedor_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Admin`
ADD FOREIGN KEY(`usuario_id`) REFERENCES `Usuario`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Solicitiud`
ADD FOREIGN KEY(`cliente_id`) REFERENCES `Cliente`(`usuario_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Solicitiud`
ADD FOREIGN KEY(`vehiculo_id`) REFERENCES `Vehiculo`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;



INSERT INTO `Usuario` (`id`, `nombre`, `telefono`, `direccion`, `codigo_postal`, `correo`, `contrasena`, `cedula`, `estado`) VALUES
(1, 'Juan', '12345678', 'Av. de la República, 1', '28001', 'juan@gmail.com', '123456', '123456789', 'A');

INSERT INTO `Admin` (`id`, `usuario_id`) VALUES
(1, 1);