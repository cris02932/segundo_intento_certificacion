-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ViajeroFrecuente
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ViajeroFrecuente
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ViajeroFrecuente` DEFAULT CHARACTER SET utf8 ;
USE `ViajeroFrecuente` ;

-- -----------------------------------------------------
-- Table `ViajeroFrecuente`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ViajeroFrecuente`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL,
  `apellido` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ViajeroFrecuente`.`viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ViajeroFrecuente`.`viajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `destino` VARCHAR(255) NULL,
  `fecha_inicio` DATETIME NULL,
  `fecha_termino` DATETIME NULL,
  `itinerario` TEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ViajeroFrecuente`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ViajeroFrecuente`.`comentarios` (
  `usuarios_id` INT NOT NULL,
  `viajes_id` INT NOT NULL,
  PRIMARY KEY (`usuarios_id`, `viajes_id`),
  INDEX `fk_usuarios_has_viajes_viajes1_idx` (`viajes_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_viajes_usuarios_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_viajes_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `ViajeroFrecuente`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_viajes_viajes1`
    FOREIGN KEY (`viajes_id`)
    REFERENCES `ViajeroFrecuente`.`viajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
