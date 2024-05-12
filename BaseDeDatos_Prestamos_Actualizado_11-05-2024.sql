-- Schema sistema_prestamos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_prestamos` DEFAULT CHARACTER SET utf8mb3 ;
USE `sistema_prestamos` ;

-- -----------------------------------------------------
-- Table `sistema_prestamos`.`usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `password` varchar(15) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `celular` varchar(9)  NULL,
  `email` varchar(40)  NULL,
    `usureg` int not NULL,
  PRIMARY KEY (`idusuario`)
) ;



CREATE TABLE `zona` (
  `idzona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`idzona`)
) ;


CREATE TABLE IF NOT EXISTS `sistema_prestamos`.`detalle_tipo_zona` (
  `idUsuario` INT NOT NULL,
  `idZona` INT NOT NULL,
  INDEX `fk_idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_idZona_idx` (`idZona` ASC) VISIBLE,
  CONSTRAINT `fk_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `sistema_prestamos`.`usuario` (`idUsuario`),
  CONSTRAINT `fk_idZona`
    FOREIGN KEY (`idZona`)
    REFERENCES `sistema_prestamos`.`zona` (`idZona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


CREATE TABLE `opcion` (
  `idopcion` int NOT NULL AUTO_INCREMENT,
  `estado` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta` varchar(100) DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  PRIMARY KEY (`idopcion`)
) ;



CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `estado` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idrol`)
);



CREATE TABLE `rol_has_opcion` (
  `idOpcion` int NOT NULL,
  `idRol` int NOT NULL,
  KEY `fkrol_idx` (`idRol`),
  KEY `fkopcion_idx` (`idOpcion`),
  CONSTRAINT `fkopcion` FOREIGN KEY (`idOpcion`) REFERENCES `opcion` (`idopcion`),
  CONSTRAINT `fkrol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idrol`)
);



CREATE TABLE `usuario_has_rol` (
  `idusuario` int DEFAULT NULL,
  `idrol` int DEFAULT NULL,
  KEY `fkusuario_idx` (`idusuario`),
  KEY `fkrol_idx` (`idrol`),
  CONSTRAINT `fkrolusuario` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `fkusuariorol` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
);


CREATE TABLE `solicitudprestamos` (
  `idSolicitudPrestamos` int NOT NULL AUTO_INCREMENT,
  `monto` CHAR(9) NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `dias` INT NULL,
  `pagodiario` VARCHAR(45) NOT NULL,
  `estado` INT NULL,
  `usureg` INT NULL,
   PRIMARY KEY (`idSolicitudPrestamos`)
    );
    
CREATE TABLE `solicitud_has_Estado` (
  `idSolicitudPrestamos` int DEFAULT NULL,
  `descripcion` int DEFAULT NULL,
  KEY `fksolipres_idx` (`idSolicitudPrestamos`),
  CONSTRAINT `fksolides` FOREIGN KEY (`idSolicitudPrestamos`) REFERENCES `solicitudprestamos` (`idSolicitudPrestamos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Insert de tablas
-- -----------------------------------------------------

INSERT INTO `usuario` VALUES (1,'77777777','77777777','Inversionista','Inversionista','123456789','inver@email.com',1);
INSERT INTO `opcion` VALUES (1,1,'Crud Jefe de Prestamista','verCrudJefe',1);
INSERT INTO `opcion` VALUES (2,2,'Crud Prestamista','verCrudPrestamistas',1);
INSERT INTO `opcion` VALUES (3,2,'Crud Prestatario','verCrudPrestatarios',1);
INSERT INTO `opcion`  VALUES ('4', '2', 'SolicitudPrestamo', 'verSolicitudPrestamo', '1');
INSERT INTO  `usuario_has_rol` VALUES (1,1);
INSERT INTO `rol_has_opcion` VALUES (1,1);
INSERT INTO `rol_has_opcion` VALUES (2,2);
INSERT INTO `rol_has_opcion` VALUES (3,3);
INSERT INTO `rol_has_opcion` VALUES (4,4);
INSERT INTO `rol` VALUES (1,1,'Invercionista'),(2,1,'Jefe de Prestamista'),(3,1,'Prestamista'),(4,1,'Prestatario');

   