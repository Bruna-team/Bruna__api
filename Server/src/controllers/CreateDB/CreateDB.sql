-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_madre_rafols
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_madre_rafols
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_madre_rafols` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci ;
USE `bd_madre_rafols` ;

-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Año`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Año` (
  `idAño` INT NOT NULL AUTO_INCREMENT,
  `Año` VARCHAR(60) NOT NULL,
  `Mension` INT NOT NULL,
  PRIMARY KEY (`idAño`),
  INDEX `Mension` (`Mension` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Alumnos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(150) NOT NULL,
  `Apellido` VARCHAR(150) NOT NULL,
  `Cedula` INT(100) NOT NULL,
  `Fecha_de_Nacimiento` DATE NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `Año` INT NOT NULL,
  `Telefono_Representante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_año_idx` (`Año` ASC) VISIBLE,
  CONSTRAINT `fk_año`
    FOREIGN KEY (`Año`)
    REFERENCES `bd_madre_rafols`.`Año` (`idAño`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Pases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Pases` (
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
    REFERENCES `bd_madre_rafols`.`Alumnos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Mencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Mencion` (
  `idMencion` INT NOT NULL AUTO_INCREMENT,
  `Mencion` VARCHAR(150) NOT NULL,
  `Seccion` INT NOT NULL,
  PRIMARY KEY (`idMencion`),
  INDEX `Seccion` (`Seccion` ASC) VISIBLE,
  CONSTRAINT `fk_mencion`
    FOREIGN KEY (`idMencion`)
    REFERENCES `bd_madre_rafols`.`Año` (`Mension`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Semaneros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Semaneros` (
  `idSemaneros` INT NOT NULL AUTO_INCREMENT,
  `Cedula` INT NOT NULL,
  `Estatus` VARCHAR(150) NOT NULL,
  `Año` VARCHAR(45) NOT NULL,
  `Mension` VARCHAR(45) NOT NULL,
  `Seccion` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  PRIMARY KEY (`idSemaneros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Cargos` (
  `idCargos` INT NOT NULL AUTO_INCREMENT,
  `Cargo` VARCHAR(150) NULL,
  PRIMARY KEY (`idCargos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Usuarios` (
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
    REFERENCES `bd_madre_rafols`.`Cargos` (`idCargos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_madre_rafols`.`Secciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_madre_rafols`.`Secciones` (
  `idSecciones` INT NOT NULL AUTO_INCREMENT,
  `Seccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSecciones`),
  CONSTRAINT `fkk_seccion`
    FOREIGN KEY (`idSecciones`)
    REFERENCES `bd_madre_rafols`.`Mencion` (`Seccion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
