-- MySQL Script generated by MySQL Workbench
-- Mon Jun 10 11:11:50 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema reservacionesbar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema reservacionesbar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reservacionesbar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `reservacionesbar` ;

-- -----------------------------------------------------
-- Table `reservacionesbar`.`carta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservacionesbar`.`carta` (
  `idMenus` INT NOT NULL AUTO_INCREMENT,
  `nombreMenu` VARCHAR(45) NULL DEFAULT NULL,
  `descripcionMenu` VARCHAR(45) NULL DEFAULT NULL,
  `imgaenPromociones` VARCHAR(2083) NULL,
  PRIMARY KEY (`idMenus`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reservacionesbar`.`bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservacionesbar`.`bebidas` (
  `idBebidas` INT NOT NULL AUTO_INCREMENT,
  `clasificacionBebidas` VARCHAR(45) NULL DEFAULT NULL,
  `idMenus` INT NOT NULL,
  `precioBebida` INT NULL,
  `nombreBebida` VARCHAR(45) NULL,
  `imagenBebida` VARCHAR(2083) NULL,
  PRIMARY KEY (`idBebidas`),
  INDEX `fk_bebidas_carta1_idx` (`idMenus` ASC) VISIBLE,
  CONSTRAINT `fk_bebidas_carta1`
    FOREIGN KEY (`idMenus`)
    REFERENCES `reservacionesbar`.`carta` (`idMenus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reservacionesbar`.`comidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservacionesbar`.`comidas` (
  `idComida` INT NOT NULL AUTO_INCREMENT,
  `nombreComida` VARCHAR(45) NULL DEFAULT NULL,
  `descripcionComida` VARCHAR(45) NULL DEFAULT NULL,
  `idMenus` INT NOT NULL,
  `precioComida` INT NULL,
  `imgaenComdia` VARCHAR(2083) NULL,
  PRIMARY KEY (`idComida`),
  INDEX `fk_comidas_carta1_idx` (`idMenus` ASC) VISIBLE,
  CONSTRAINT `fk_comidas_carta1`
    FOREIGN KEY (`idMenus`)
    REFERENCES `reservacionesbar`.`carta` (`idMenus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reservacionesbar`.`reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservacionesbar`.`reservaciones` (
  `idReservacion` INT NOT NULL AUTO_INCREMENT,
  `nombreReservacion` VARCHAR(45) NULL DEFAULT NULL,
  `apellidoReservacion` VARCHAR(45) NULL DEFAULT NULL,
  `mailReservacion` VARCHAR(45) NULL DEFAULT NULL,
  `fechaReservacion` DATE NULL DEFAULT NULL,
  `cantidadlPersonas` INT NULL,
  PRIMARY KEY (`idReservacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reservacionesbar`.`sectores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservacionesbar`.`sectores` (
  `idSector` INT NOT NULL AUTO_INCREMENT,
  `nombreSector` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idSector`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reservacionesbar`.`mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservacionesbar`.`mesas` (
  `idMesas` INT NOT NULL AUTO_INCREMENT,
  `capacidadMesas` INT NULL DEFAULT NULL,
  `estadoMesas` VARCHAR(15) NULL DEFAULT NULL,
  `idSectores` INT NOT NULL,
  `idReservacion` INT NOT NULL,
  PRIMARY KEY (`idMesas`),
  INDEX `idSectores` (`idSectores` ASC) VISIBLE,
  INDEX `fk_idReservacion_idx` (`idReservacion` ASC) VISIBLE,
  CONSTRAINT `fk_idReservacion`
    FOREIGN KEY (`idReservacion`)
    REFERENCES `reservacionesbar`.`reservaciones` (`idReservacion`),
  CONSTRAINT `fk_idSectores`
    FOREIGN KEY (`idSectores`)
    REFERENCES `reservacionesbar`.`sectores` (`idSector`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reservacionesbar`.`mozos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservacionesbar`.`mozos` (
  `idMozo` INT NOT NULL AUTO_INCREMENT,
  `nombreMozo` VARCHAR(45) NULL DEFAULT NULL,
  `apellidoMozo` VARCHAR(45) NULL DEFAULT NULL,
  `telefonoMozo` VARCHAR(15) NULL DEFAULT NULL,
  `mailMozo` VARCHAR(100) NULL DEFAULT NULL,
  `idSector` INT NOT NULL,
  PRIMARY KEY (`idMozo`),
  INDEX `fk_mozos_sectores1_idx` (`idSector` ASC) VISIBLE,
  CONSTRAINT `fk_mozos_sectores1`
    FOREIGN KEY (`idSector`)
    REFERENCES `reservacionesbar`.`sectores` (`idSector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
