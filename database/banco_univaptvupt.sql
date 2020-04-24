-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `post_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `post_tipo` (
  `idpost_tipo` INT NOT NULL AUTO_INCREMENT,
  `post_nome_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idpost_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` BIGINT NOT NULL AUTO_INCREMENT,
  `senha` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `post` (
  `idpost` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_momento` DATETIME NULL,
  `post_conteudo` VARCHAR(1024) NULL,
  `post_tipo_idpost_tipo` INT NOT NULL,
  `usuario_idusuario` BIGINT NOT NULL,
  PRIMARY KEY (`idpost`),
  UNIQUE INDEX `idpost_UNIQUE` (`idpost` ASC),
  INDEX `fk_post_post_tipo_idx` (`post_tipo_idpost_tipo` ASC),
  INDEX `fk_post_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_post_post_tipo`
    FOREIGN KEY (`post_tipo_idpost_tipo`)
    REFERENCES `post_tipo` (`idpost_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `like` (
  `post_idpost` BIGINT UNSIGNED NOT NULL,
  `like_momento` DATETIME NULL,
  `usuario_idusuario` BIGINT NOT NULL,
  INDEX `fk_like_post1_idx` (`post_idpost` ASC),
  PRIMARY KEY (`usuario_idusuario`),
  CONSTRAINT `fk_like_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` INT NOT NULL AUTO_INCREMENT,
  `curso_nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `faculdade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faculdade` (
  `idfaculdade` INT NOT NULL AUTO_INCREMENT,
  `faculdade_nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idfaculdade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `perfil` (
  `usuario_idusuario` BIGINT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `bio` VARCHAR(45) NULL,
  `curso_idcurso` INT NOT NULL,
  `faculdade_idfaculdade` INT NOT NULL,
  `foto` VARCHAR(45) NULL,
  INDEX `fk_perfil_usuario1_idx` (`usuario_idusuario` ASC),
  UNIQUE INDEX `usuario_idusuario_UNIQUE` (`usuario_idusuario` ASC),
  INDEX `fk_perfil_curso1_idx` (`curso_idcurso` ASC),
  INDEX `fk_perfil_faculdade1_idx` (`faculdade_idfaculdade` ASC),
  CONSTRAINT `fk_perfil_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_curso1`
    FOREIGN KEY (`curso_idcurso`)
    REFERENCES `curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_faculdade1`
    FOREIGN KEY (`faculdade_idfaculdade`)
    REFERENCES `faculdade` (`idfaculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amizadade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amizadade` (
  `usuario_idusuario_solicitante` BIGINT NOT NULL,
  `usuario_idusuario_solicitado` BIGINT NOT NULL,
  `status_data_aceite` DATETIME NULL,
  INDEX `fk_amizadade_usuario1_idx` (`usuario_idusuario_solicitante` ASC),
  INDEX `fk_amizadade_usuario2_idx` (`usuario_idusuario_solicitado` ASC),
  CONSTRAINT `fk_amizadade_usuario1`
    FOREIGN KEY (`usuario_idusuario_solicitante`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_amizadade_usuario2`
    FOREIGN KEY (`usuario_idusuario_solicitado`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mensagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mensagem` (
  `idmensagem` INT NOT NULL AUTO_INCREMENT,
  `mensagem_date_time` DATETIME NULL,
  `mensagem_conteudo` VARCHAR(1024) NULL,
  `visto` TINYINT(1) NULL,
  `usuario_idusuario_remetente` BIGINT NOT NULL,
  `usuario_idusuario_destinatario` BIGINT NOT NULL,
  PRIMARY KEY (`idmensagem`),
  INDEX `fk_mensagem_usuario1_idx` (`usuario_idusuario_remetente` ASC),
  INDEX `fk_mensagem_usuario2_idx` (`usuario_idusuario_destinatario` ASC),
  CONSTRAINT `fk_mensagem_usuario1`
    FOREIGN KEY (`usuario_idusuario_remetente`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensagem_usuario2`
    FOREIGN KEY (`usuario_idusuario_destinatario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
