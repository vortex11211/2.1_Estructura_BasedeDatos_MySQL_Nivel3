
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8mb4 ;
USE `Pizzeria` ;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(255) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `piso` VARCHAR(45) NULL DEFAULT NULL,
  `puerta` VARCHAR(45) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(5) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`tienda` (
  `id_tienda` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tienda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `id_tienda` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(9) NOT NULL,
  `telefono` VARCHAR(9) NOT NULL,
  `puesto` ENUM('cocinero', 'repartidor') NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `fk_Empleados_tienda_idx` (`id_tienda` ASC) VISIBLE,
  CONSTRAINT `fk_Empleados_tienda`
    FOREIGN KEY (`id_tienda`)
    REFERENCES `Pizzeria`.`tienda` (`id_tienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`categorias` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `descripcion` TEXT(200) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `tipo` ENUM('pizza', 'hamburguesa', 'bebida') NOT NULL,
  `imagen` BLOB NULL,
  `id_categoria` INT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_productos_categorias1_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `Pizzeria`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `id_tienda` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `entrega` ENUM('domicilio', 'local') NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_Clientes1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_pedidos_tienda1_idx` (`id_tienda` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_Clientes1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `Pizzeria`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_tienda1`
    FOREIGN KEY (`id_tienda`)
    REFERENCES `Pizzeria`.`tienda` (`id_tienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`repartos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`repartos` (
  `id_reparto` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `fecha_entrega` DATETIME NOT NULL,
  PRIMARY KEY (`id_reparto`),
  INDEX `fk_repartos_Empleados1_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `fk_repartos_pedidos1_idx` (`id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_repartos_Empleados1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `Pizzeria`.`Empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_repartos_pedidos1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `Pizzeria`.`pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`detalle_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`detalle_pedido` (
  `id_detalle_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  INDEX `fk_detalle_pedido_productos1_idx` (`id_producto` ASC) VISIBLE,
  INDEX `fk_detalle_pedido_pedidos1_idx` (`id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_pedido_productos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `Pizzeria`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_pedidos1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `Pizzeria`.`pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
