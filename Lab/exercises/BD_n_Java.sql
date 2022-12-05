-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `numero` INT NOT NULL,
  `dnome` VARCHAR(45) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `Empregado_ssn` INT NOT NULL,
  PRIMARY KEY (`numero`),
  CONSTRAINT `fk_Departamento_Empregado1`
    FOREIGN KEY (`Empregado_ssn`)
    REFERENCES `mydb`.`Empregado` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `mydb`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empregado` (
  `ssn` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `salario` VARCHAR(45) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `m_inicial` VARCHAR(45) NOT NULL,
  `Supervisor_ssn` INT NOT NULL,
  `Departamento_numero` INT NOT NULL,
  PRIMARY KEY (`ssn`),
  CONSTRAINT `fk_Empregado_Empregado1`
    FOREIGN KEY (`Supervisor_ssn`)
    REFERENCES `mydb`.`Empregado` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Empregado_Departamento1`
    FOREIGN KEY (`Departamento_numero`)
    REFERENCES `mydb`.`Departamento` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `mydb`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projeto` (
  `idProjeto` INT NOT NULL,
  `pnome` VARCHAR(45) NOT NULL,
  `localizacao` VARCHAR(45) NOT NULL,
  `Departamento_numero` INT NOT NULL,
  PRIMARY KEY (`idProjeto`),
  CONSTRAINT `fk_Projeto_Departamento1`
    FOREIGN KEY (`Departamento_numero`)
    REFERENCES `mydb`.`Departamento` (`numero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `mydb`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependente` (
  `depnome` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `data_nasc` VARCHAR(45) NOT NULL,
  `parentesco` VARCHAR(45) NOT NULL,
  `Empregado_ssn` INT NOT NULL,
  PRIMARY KEY (`depnome`),
  CONSTRAINT `fk_Dependente_Empregado`
    FOREIGN KEY (`Empregado_ssn`)
    REFERENCES `mydb`.`Empregado` (`ssn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `mydb`.`Depto_Localizacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Depto_Localizacoes` (
  `idDepto_Localizacoes` INT NOT NULL,
  `localizacao` VARCHAR(45) NOT NULL,
  `Departamento_numero` INT NOT NULL,
  PRIMARY KEY (`idDepto_Localizacoes`),
  CONSTRAINT `fk_Depto_Localizacoes_Departamento1`
    FOREIGN KEY (`Departamento_numero`)
    REFERENCES `mydb`.`Departamento` (`numero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `mydb`.`Trabalha_em`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trabalha_em` (
  `Projeto_idProjeto` INT NOT NULL,
  `Empregado_ssn` INT NOT NULL,
  `horas` INT NOT NULL,
  PRIMARY KEY (`Projeto_idProjeto`, `Empregado_ssn`),
  CONSTRAINT `fk_Projeto_has_Empregado_Projeto1`
    FOREIGN KEY (`Projeto_idProjeto`)
    REFERENCES `mydb`.`Projeto` (`idProjeto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Projeto_has_Empregado_Empregado1`
    FOREIGN KEY (`Empregado_ssn`)
    REFERENCES `mydb`.`Empregado` (`ssn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);