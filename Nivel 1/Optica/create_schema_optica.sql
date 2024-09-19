SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema de base de datos para  Optica Culo de Botella
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OpticaCuloBotella` DEFAULT CHARACTER SET utf8mb4 ;
USE `OpticaCuloBotella` ;

-- -----------------------------------------------------
-- Tabla Clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticaCuloBotella`.`clientes` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `piso` INT NULL,
  `puerta` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(5) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `teléfono` VARCHAR(9) NOT NULL,
  `email` VARCHAR(45) NULL,
  `fecha_registro` DATE NOT NULL,
  `refererido` INT NULL,
  PRIMARY KEY (`cliente_id`),
  INDEX `fk_refereridos_idx` (`refererido` ASC) VISIBLE,
  CONSTRAINT `fk_refereridos`
    FOREIGN KEY (`refererido`)
    REFERENCES `OpticaCuloBotella`.`clientes` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla Empleados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticaCuloBotella`.`empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla Ventas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticaCuloBotella`.`ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` INT NOT NULL,
  `fecha_transaccion` DATETIME NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_ventas_empleados1_idx` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_empleados1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `OpticaCuloBotella`.`empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla Proveedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticaCuloBotella`.`proveedores` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(9) NOT NULL,
  `fax` VARCHAR(9) NULL,
  `nif` VARCHAR(9) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `piso` VARCHAR(45) NULL,
  `puerta` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Marcas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticaCuloBotella`.`marcas` (
  `marca` VARCHAR(45) NULL,
  `id_proveedor` INT NULL,
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_marcas_proveedores1_idx` (`id_proveedor` ASC) VISIBLE,
  PRIMARY KEY (`id_marca`),
  CONSTRAINT `fk_marcas_proveedores1`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `OpticaCuloBotella`.`proveedores` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Gafas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticaCuloBotella`.`gafas` (
  `id_gafa` INT NOT NULL AUTO_INCREMENT,
  `id_marca` INT NOT NULL,
  `grad_ojo_derecho` DECIMAL(5,2) NOT NULL,
  `grad_ojo_izquierdo` DECIMAL(5,2) NOT NULL,
  `montura` ENUM('flotante', 'pasta', 'metalica') NOT NULL,
  `color_montura` VARCHAR(45) NULL,
  `color_lente_derecho` VARCHAR(45) NULL,
  `color_lente_izquierdo` VARCHAR(45) NULL,
  `precio` DECIMAL(7,2) NOT NULL,
  `id_venta` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  INDEX `fk_gafas_ventas1_idx` (`id_venta` ASC) VISIBLE,
  INDEX `fk_gafas_clientes2_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_gafas_marcas1_idx` (`id_marca` ASC) VISIBLE,
  PRIMARY KEY (`id_gafa`),
  CONSTRAINT `fk_gafas_ventas1`
    FOREIGN KEY (`id_venta`)
    REFERENCES `OpticaCuloBotella`.`ventas` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gafas_clientes2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `OpticaCuloBotella`.`clientes` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gafas_marcas1`
    FOREIGN KEY (`id_marca`)
    REFERENCES `OpticaCuloBotella`.`marcas` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
