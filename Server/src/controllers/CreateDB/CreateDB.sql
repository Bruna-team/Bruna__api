-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_madre_rafols
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_madre_rafols
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_madre_rafols` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci ;
USE `bd_madre_rafols` ;

-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`año`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`año` (
  `idAño` INT NOT NULL AUTO_INCREMENT,
  `Año` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idAño`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`mencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`mencion` (
  `idMencion` INT NOT NULL AUTO_INCREMENT,
  `Mencion` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idMencion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`secciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`secciones` (
  `idSecciones` INT NOT NULL AUTO_INCREMENT,
  `Seccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSecciones`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`alumnos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(150) NOT NULL,
  `Apellido` VARCHAR(150) NOT NULL,
  `Cedula` INT NOT NULL,
  `Fecha_de_Nacimiento` DATE NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `Año` INT NOT NULL,
  `Telefono_Representante` VARCHAR(45) NOT NULL,
  `Seccion` INT NOT NULL,
  `Mencion` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_año_idx` (`Año` ASC) VISIBLE,
  INDEX `fk_seccion` (`Seccion` ASC) VISIBLE,
  INDEX `fk_mencion` (`Mencion` ASC) VISIBLE,
  CONSTRAINT `fk_año`
    FOREIGN KEY (`Año`)
    REFERENCES `bd_madre_rafols`.`año` (`idAño`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_mension`
    FOREIGN KEY (`Mencion`)
    REFERENCES `bd_madre_rafols`.`mencion` (`idMencion`),
  CONSTRAINT `fk_seccion`
    FOREIGN KEY (`Seccion`)
    REFERENCES `bd_madre_rafols`.`secciones` (`idSecciones`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`cargos` (
  `idCargos` INT NOT NULL AUTO_INCREMENT,
  `Cargo` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`idCargos`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`pases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`pases` (
  `idPases` INT NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Motivo` VARCHAR(45) NOT NULL,
  `Periodo` VARCHAR(45) NOT NULL,
  `Lapso` VARCHAR(45) NOT NULL,
  `Estatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPases`),
  CONSTRAINT `fk_pases`
    FOREIGN KEY (`idPases`)
    REFERENCES `bd_madre_rafols`.`alumnos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`semaneros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`semaneros` (
  `idSemaneros` INT NOT NULL AUTO_INCREMENT,
  `Cedula` INT NOT NULL,
  `Estatus` VARCHAR(150) NOT NULL,
  `Año` VARCHAR(45) NOT NULL,
  `Mension` VARCHAR(45) NOT NULL,
  `Seccion` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  PRIMARY KEY (`idSemaneros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(150) NOT NULL,
  `Apellido` VARCHAR(150) NOT NULL,
  `Cargo` INT NOT NULL,
  `Cedula` INT NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_cargo_idx` (`Cargo` ASC) VISIBLE,
  CONSTRAINT `fk_cargo`
    FOREIGN KEY (`Cargo`)
    REFERENCES `bd_madre_rafols`.`cargos` (`idCargos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish2_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Ingreso de Años
-- -----------------------------------------------------

INSERT INTO `bd_madre_rafols`.`año` (`Año`) VALUES ('Primero');
INSERT INTO `bd_madre_rafols`.`año` (`Año`) VALUES ('Segundo');
INSERT INTO `bd_madre_rafols`.`año` (`Año`) VALUES ('Tercero');
INSERT INTO `bd_madre_rafols`.`año` (`Año`) VALUES ('Cuarto');
INSERT INTO `bd_madre_rafols`.`año` (`Año`) VALUES ('Quinto');
INSERT INTO `bd_madre_rafols`.`año` (`Año`) VALUES ('Sexto');

-- -----------------------------------------------------
-- Ingreso de Secciones
-- -----------------------------------------------------

INSERT INTO `bd_madre_rafols`.`secciones` (`Seccion`) VALUES ('A');
INSERT INTO `bd_madre_rafols`.`secciones` (`Seccion`) VALUES ('B');

-- -----------------------------------------------------
-- Ingreso de Mencion
-- -----------------------------------------------------

INSERT INTO `bd_madre_rafols`.`mencion` (`Mencion`) VALUES ('Telematica');
INSERT INTO `bd_madre_rafols`.`mencion` (`Mencion`) VALUES ('Contaduria');
INSERT INTO `bd_madre_rafols`.`mencion` (`Mencion`) VALUES ('Administracion');

-- -----------------------------------------------------
-- Ingreso de Cargos
-- -----------------------------------------------------

INSERT INTO `bd_madre_rafols`.`cargos` (`Cargo`) VALUES ('Coordinacion I');
INSERT INTO `bd_madre_rafols`.`cargos` (`Cargo`) VALUES ('Coordinacion II');