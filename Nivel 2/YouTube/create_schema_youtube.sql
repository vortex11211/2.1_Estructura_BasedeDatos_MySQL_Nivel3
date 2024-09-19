
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema miniYoutube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema miniYoutube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miniYoutube` DEFAULT CHARACTER SET utf8 ;
USE `miniYoutube` ;

-- -----------------------------------------------------
-- Table `miniYoutube`.`canales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`canales` (
  `idcanal` INT NOT NULL AUTO_INCREMENT,
  `nombrecanal` VARCHAR(45) NOT NULL,
  `descripcion` MEDIUMTEXT NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  PRIMARY KEY (`idcanal`),
  INDEX `fk_canales_usuarios_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_canales_usuarios`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `miniYoutube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`videos_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`videos_playlist` (
  `id_playlist` INT NOT NULL,
  `id_video` INT NOT NULL,
  PRIMARY KEY (`id_video`, `id_playlist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`videos` (
  `id_video` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `tamaño` INT NOT NULL,
  `nombre_archivo` VARCHAR(45) NOT NULL,
  `duracion` TIME NOT NULL,
  `miniatura` BLOB NULL,
  `numero_reproducciones` INT NOT NULL DEFAULT 0,
  `numero_likes` INT NOT NULL DEFAULT 0,
  `numero_dislikes` INT NOT NULL DEFAULT 0,
  `estado` ENUM('publico', 'oculto', 'privado') NOT NULL,
  `usuarioquepublica` VARCHAR(45) NOT NULL,
  `fechapublicacion` DATETIME NOT NULL,
  `canales_idcanal` INT NOT NULL,
  `videos_playlist_id_video` INT NOT NULL,
  `videos_playlist_id_playlist` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `fk_videos_publicados_canales1_idx` (`canales_idcanal` ASC) VISIBLE,
  INDEX `fk_videos_publicados_videos_playlist1_idx` (`videos_playlist_id_video` ASC, `videos_playlist_id_playlist` ASC) VISIBLE,
  UNIQUE INDEX `id_video_UNIQUE` (`id_video` ASC) VISIBLE,
  CONSTRAINT `fk_videos_publicados_canales1`
    FOREIGN KEY (`canales_idcanal`)
    REFERENCES `miniYoutube`.`canales` (`idcanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_publicados_videos_playlist1`
    FOREIGN KEY (`videos_playlist_id_video` , `videos_playlist_id_playlist`)
    REFERENCES `miniYoutube`.`videos_playlist` (`id_video` , `id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`videos_like_dislike`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`videos_like_dislike` (
  `id_video` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `tipo_like_dislike` ENUM('like', 'dislike') NOT NULL,
  `fechayhora` DATETIME NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`id_video`, `id_usuario`),
  UNIQUE (`id_usuario`),
  INDEX `fk_videos_like_dislike_videos1_idx` (`videos_id_video` ASC) VISIBLE,
  CONSTRAINT `fk_videos_like_dislike_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `miniYoutube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_like_dislike_videos2`
    FOREIGN KEY (`id_video`)
    REFERENCES `miniYoutube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('masculino', 'femenino') NULL,
  `pais` VARCHAR(45) NOT NULL,
  `codigopostal` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `fk_usuarios_videos_like_dislike1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `miniYoutube`.`videos_like_dislike` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`etiquetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`etiquetas` (
  `id_etiquetas` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_etiquetas`),
  UNIQUE INDEX `id_etiquetas_UNIQUE` (`id_etiquetas` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `nombre_playlist` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `estado` ENUM('publica', 'privada') NOT NULL,
  `videos_playlist_id_video` INT NOT NULL,
  `videos_playlist_id_playlist` INT NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_playlist_videos_playlist1_idx` (`videos_playlist_id_video` ASC, `videos_playlist_id_playlist` ASC) VISIBLE,
  INDEX `fk_playlist_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_videos_playlist1`
    FOREIGN KEY (`videos_playlist_id_video` , `videos_playlist_id_playlist`)
    REFERENCES `miniYoutube`.`videos_playlist` (`id_video` , `id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `miniYoutube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`Comentarios` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `texto` MEDIUMTEXT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `videos_publicados_id_video` INT NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  PRIMARY KEY (`id_comentario`),
  INDEX `fk_Comentarios_videos_publicados1_idx` (`videos_publicados_id_video` ASC) VISIBLE,
  INDEX `fk_Comentarios_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_videos_publicados1`
    FOREIGN KEY (`videos_publicados_id_video`)
    REFERENCES `miniYoutube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `miniYoutube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`etiquetas_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`etiquetas_video` (
  `id_video` INT NOT NULL,
  `id_etiquetas` INT NOT NULL,
  `videos_publicados_id_video` INT NOT NULL,
  `etiquetas_id_etiquetas` INT NOT NULL,
  INDEX `fk_etiquetas_video_videos_publicados1_idx` (`videos_publicados_id_video` ASC) VISIBLE,
  INDEX `fk_etiquetas_video_etiquetas1_idx` (`etiquetas_id_etiquetas` ASC) VISIBLE,
  CONSTRAINT `fk_etiquetas_video_videos_publicados1`
    FOREIGN KEY (`videos_publicados_id_video`)
    REFERENCES `miniYoutube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_etiquetas_video_etiquetas1`
    FOREIGN KEY (`etiquetas_id_etiquetas`)
    REFERENCES `miniYoutube`.`etiquetas` (`id_etiquetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`suscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`suscripciones` (
  `idcanal` INT NOT NULL,
  `fecha_suscripcion` DATETIME NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  INDEX `fk_suscripciones_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  INDEX `fk_suscripciones_canales1_idx` (`idcanal` ASC) VISIBLE,
  PRIMARY KEY (`idcanal`),
  CONSTRAINT `fk_suscripciones_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `miniYoutube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suscripciones_canales1`
    FOREIGN KEY (`idcanal`)
    REFERENCES `miniYoutube`.`canales` (`idcanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniYoutube`.`likes_dislikes_comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniYoutube`.`likes_dislikes_comentarios` (
  `id_comentario` INT NOT NULL,
  `tipolike` ENUM('like', 'dislike') NOT NULL,
  `fecha` DATETIME NOT NULL,
  `Comentarios_id_comentario` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  INDEX `fk_likes_dislikes_comentarios_Comentarios1_idx` (`Comentarios_id_comentario` ASC) VISIBLE,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `fk_likes_dislikes_comentarios_Comentarios1`
    FOREIGN KEY (`Comentarios_id_comentario`)
    REFERENCES `miniYoutube`.`Comentarios` (`id_comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_dislikes_comentarios_usuarios1`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `miniYoutube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
