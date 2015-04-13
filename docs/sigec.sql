SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `sigec` ;
CREATE SCHEMA IF NOT EXISTS `sigec` DEFAULT CHARACTER SET utf8 ;
USE `sigec` ;

-- -----------------------------------------------------
-- Table `sigec`.`GRUPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`GRUPO` (
  `ID` INT NOT NULL,
  `DESC_GRUPO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigec`.`FAMILIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`FAMILIA` (
  `ID` INT NOT NULL,
  `DESC_FAMILIA` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigec`.`LOCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`LOCAL` (
  `ID` INT NOT NULL,
  `DESC_LOCAL` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigec`.`FORNECEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`FORNECEDOR` (
  `ID` INT NOT NULL,
  `RAZAO` VARCHAR(45) NULL,
  `NOME_FANTASIA` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(14) NULL,
  `IE` VARCHAR(45) NULL,
  `END` VARCHAR(45) NULL,
  `BAIRRO` VARCHAR(45) NULL,
  `ESTADO` VARCHAR(45) NULL,
  `TEL` VARCHAR(11) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `CONTATO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigec`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`PRODUTO` (
  `ID` INT NOT NULL,
  `DESC_PROD` VARCHAR(45) NULL,
  `ESTOQ_MIN` INT NULL,
  `ESTOQ_MAX` INT NULL,
  `VALOR_CUSTO` INT NULL,
  `VALOR_VENDA` INT NULL,
  `OBS` VARCHAR(100) NULL,
  `QTDE` INT NULL,
  `GRUPO_ID` INT NOT NULL,
  `FAMILIA_ID` INT NOT NULL,
  `LOCAL_ID` INT NOT NULL,
  `FORNECEDOR_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_PRODUTO_GRUPO1_idx` (`GRUPO_ID` ASC),
  INDEX `fk_PRODUTO_FAMILIA1_idx` (`FAMILIA_ID` ASC),
  INDEX `fk_PRODUTO_LOCAL1_idx` (`LOCAL_ID` ASC),
  INDEX `fk_PRODUTO_FORNECEDOR1_idx` (`FORNECEDOR_ID` ASC),
  CONSTRAINT `fk_PRODUTO_GRUPO1`
    FOREIGN KEY (`GRUPO_ID`)
    REFERENCES `sigec`.`GRUPO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_FAMILIA1`
    FOREIGN KEY (`FAMILIA_ID`)
    REFERENCES `sigec`.`FAMILIA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_LOCAL1`
    FOREIGN KEY (`LOCAL_ID`)
    REFERENCES `sigec`.`LOCAL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_FORNECEDOR1`
    FOREIGN KEY (`FORNECEDOR_ID`)
    REFERENCES `sigec`.`FORNECEDOR` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigec`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`CLIENTE` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(45) NULL,
  `NOME_MAE` VARCHAR(45) NULL,
  `END` VARCHAR(45) NULL,
  `TEL` VARCHAR(11) NULL,
  `CPF_CNPJ` VARCHAR(14) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `ESTADO` VARCHAR(45) NULL,
  `BAIRRO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigec`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`USUARIO` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(45) NULL,
  `LOGIN` VARCHAR(45) NULL,
  `SENHA` VARCHAR(45) NULL,
  `PERFIL_USUARIO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sigec`.`VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigec`.`VENDA` (
  `ID` INT NOT NULL,
  `TOTAL` FLOAT NULL,
  `QTDE_PRODUTO` INT NULL,
  `APRAZO` INT NULL,
  `AVISTA` INT NULL,
  `CLIENTE_ID` INT NOT NULL,
  `USUARIO_ID` INT NOT NULL,
  `PRODUTO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `CLIENTE_ID`, `USUARIO_ID`, `PRODUTO_ID`),
  INDEX `fk_VENDA_CLIENTE1_idx` (`CLIENTE_ID` ASC),
  INDEX `fk_VENDA_USUARIO1_idx` (`USUARIO_ID` ASC),
  INDEX `fk_VENDA_PRODUTO1_idx` (`PRODUTO_ID` ASC),
  CONSTRAINT `fk_VENDA_CLIENTE1`
    FOREIGN KEY (`CLIENTE_ID`)
    REFERENCES `sigec`.`CLIENTE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_USUARIO1`
    FOREIGN KEY (`USUARIO_ID`)
    REFERENCES `sigec`.`USUARIO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_PRODUTO1`
    FOREIGN KEY (`PRODUTO_ID`)
    REFERENCES `sigec`.`PRODUTO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

