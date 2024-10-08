-- MySQL Script generated by MySQL Workbench
-- Wed Sep 18 18:21:42 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Spotify` ;
USE `Spotify` ;

-- -----------------------------------------------------
-- Table `Spotify`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nombre_usuario` VARCHAR(255) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('Masculino', 'Femenino') NULL DEFAULT NULL,
  `pais` VARCHAR(100) NOT NULL,
  `codigo_postal` VARCHAR(20) NOT NULL,
  `tipo_usuario` ENUM('free', 'premium') NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `Spotify`.`Subscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Subscripciones` (
  `id_subscripcion` INT NOT NULL AUTO_INCREMENT,
  `email_usuario` VARCHAR(255) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_renovacion` DATE NOT NULL,
  `forma_pago` ENUM('Tarjeta', 'PayPal') NOT NULL,
  PRIMARY KEY (`id_subscripcion`),
  INDEX (`email_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_suscripcion`
    FOREIGN KEY (`email_usuario`)
    REFERENCES `Spotify`.`Usuarios` (`email`));


-- -----------------------------------------------------
-- Table `Spotify`.`Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Pagos` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `id_subscripcion` INT NOT NULL,
  `fecha_pago` DATE NOT NULL,
  `numero_orden` VARCHAR(50) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE INDEX (`numero_orden` ASC) VISIBLE,
  INDEX (`id_subscripcion` ASC) VISIBLE,
  CONSTRAINT `fk_pagos_suscripciones`
    FOREIGN KEY (`id_subscripcion`)
    REFERENCES `Spotify`.`Subscripciones` (`id_subscripcion`));


-- -----------------------------------------------------
-- Table `Spotify`.`TarjetasCredito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`TarjetasCredito` (
  `id_tarjeta` INT NOT NULL AUTO_INCREMENT,
  `id_subscripcion` INT NOT NULL,
  `numero_tarjeta` VARCHAR(16) NOT NULL,
  `mes_caducidad` INT NOT NULL,
  `ano_caducidad` INT NOT NULL,
  `codigo_seguridad` INT NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  INDEX (`id_subscripcion` ASC) VISIBLE,
  CONSTRAINT `fk_suscripcion_pagotarjeta`
    FOREIGN KEY (`id_subscripcion`)
    REFERENCES `Spotify`.`Subscripciones` (`id_subscripcion`));


-- -----------------------------------------------------
-- Table `Spotify`.`PayPal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`PayPal` (
  `id_paypal` INT NOT NULL AUTO_INCREMENT,
  `id_subscripcion` INT NOT NULL,
  `usuario_paypal` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_paypal`),
  INDEX (`id_subscripcion` ASC) VISIBLE,
  CONSTRAINT `fk_suscripcion_pagoPaypal`
    FOREIGN KEY (`id_subscripcion`)
    REFERENCES `Spotify`.`Subscripciones` (`id_subscripcion`));


-- -----------------------------------------------------
-- Table `Spotify`.`Playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Playlists` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `numero_canciones` INT NOT NULL DEFAULT 0,
  `fecha_creacion` DATE NOT NULL,
  `estado` ENUM('activa', 'eliminada') NOT NULL DEFAULT 'activa',
  `fecha_eliminacion` DATE NULL,
  `email_usuario` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX (`email_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_playlist`
    FOREIGN KEY (`email_usuario`)
    REFERENCES `Spotify`.`Usuarios` (`email`));


-- -----------------------------------------------------
-- Table `Spotify`.`Artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Artistas` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `imagen_artista` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id_artista`));


-- -----------------------------------------------------
-- Table `Spotify`.`Albumes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Albumes` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `ano_publicacion` YEAR NOT NULL,
  `portada_imagen` BLOB  NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  INDEX (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista`
    FOREIGN KEY (`id_artista`)
    REFERENCES `Spotify`.`Artistas` (`id_artista`));


-- -----------------------------------------------------
-- Table `Spotify`.`Canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Canciones` (
  `id_cancion` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `duracion` TIME NOT NULL,
  `veces_reproducida` INT NOT NULL DEFAULT 0,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`id_cancion`),
  INDEX (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_albunes`
    FOREIGN KEY (`id_album`)
    REFERENCES `Spotify`.`Albumes` (`id_album`));


-- -----------------------------------------------------
-- Table `Spotify`.`canciones_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`canciones_playlist` (
  `id_playlist` INT NOT NULL,
  `id_cancion` INT NOT NULL,
  `email_usuario_que_agrego` VARCHAR(255) NOT NULL,
  `fecha_agregado` DATE NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_cancion`),
  INDEX (`id_cancion` ASC) VISIBLE,
  INDEX (`email_usuario_que_agrego` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_cancionagregada`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `Spotify`.`Playlists` (`id_playlist`),
  CONSTRAINT `fk_playlist_cancionesplaylist`
    FOREIGN KEY (`id_cancion`)
    REFERENCES `Spotify`.`Canciones` (`id_cancion`),
  CONSTRAINT `fk_canciones_cancionesplaylist`
    FOREIGN KEY (`email_usuario_que_agrego`)
    REFERENCES `Spotify`.`Usuarios` (`email`));


-- -----------------------------------------------------
-- Table `Spotify`.`Artistas_Relacionados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Artistas_Relacionados` (
  `id_artista_relacionado` INT NOT NULL,
  `artistas_id_artista` INT NOT NULL,
  PRIMARY KEY (`id_artista_relacionado`, `artistas_id_artista`),
  INDEX (`id_artista_relacionado` ASC) VISIBLE,
  INDEX `fk_Artistas_Relacionados_Artistas1_idx` (`artistas_id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_artista_artistasrelacinados`
    FOREIGN KEY (`id_artista_relacionado`)
    REFERENCES `Spotify`.`Artistas` (`id_artista`),
  CONSTRAINT `fk_Artistas_Relacionados_Artistas1`
    FOREIGN KEY (`artistas_id_artista`)
    REFERENCES `Spotify`.`Artistas` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Spotify`.`Favoritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`Favoritos` (
  `email_usuario` VARCHAR(255) NOT NULL,
  `id_cancion` INT NOT NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`email_usuario`, `id_cancion`, `id_album`),
  INDEX (`id_cancion` ASC) VISIBLE,
  INDEX (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_favorito_album`
    FOREIGN KEY (`email_usuario`)
    REFERENCES `Spotify`.`Usuarios` (`email`),
  CONSTRAINT `fk_usuario_favoritos`
    FOREIGN KEY (`id_cancion`)
    REFERENCES `Spotify`.`Canciones` (`id_cancion`),
  CONSTRAINT `fk_favorito_cancion`
    FOREIGN KEY (`id_album`)
    REFERENCES `Spotify`.`Albumes` (`id_album`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
