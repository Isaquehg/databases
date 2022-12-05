CREATE SCHEMA IF NOT EXISTS `Aula09` DEFAULT CHARACTER SET utf8 ;
USE `Aula09`;
-- DROP DATABASE `Aula09`;
CREATE TABLE IF NOT EXISTS `Aula09`.`Agente` (
  `idAgente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `nascimento` VARCHAR(45) NOT NULL,
  `habilidade` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAgente`)
);

CREATE TABLE IF NOT EXISTS `Aula09`.`Vilao` (
  `idVilao` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `numCrimes` INT NOT NULL,
  PRIMARY KEY (`idVilao`)
);

CREATE TABLE IF NOT EXISTS `Aula09`.`Missao` (
  `idMissao` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `dat` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `duracao` INT NOT NULL,
  `Vilao_idVilao` INT NOT NULL,
  PRIMARY KEY (`idMissao`),
  CONSTRAINT `fk_Missao_Vilao`
  FOREIGN KEY (`Vilao_idVilao`)
  REFERENCES `Aula09`.`Vilao` (`idVilao`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `Aula09`.`Agente_has_missao` (
	`Agente_idAgente` INT NOT NULL,
    `Missao_idMissao` INT NOT NULL,
	PRIMARY KEY (`Agente_idAgente`, `Missao_idMissao`),
	CONSTRAINT `fk_Agente_has_missao_Agente`
    FOREIGN KEY (`Agente_idAgente`)
    REFERENCES `Aula09`.`Agente` (`idAgente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT `fk_Agente_has_missao_Missao`
    FOREIGN KEY (`Missao_idMissao`)
    REFERENCES `Aula09`.`Missao` (`idMissao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
    
INSERT INTO Agente() values 
(default, 'Larry', 'Centro', "01-01-20", 'Pistola', 'M', 'larry@gmail.com'),
(default, 'Darry', 'Centro', "31-12-20", 'Faca', 'M', 'darry@gmail.com'),
(default, 'Merry', 'Centro', "01-01-20", 'Fuzil', 'F', 'merry@gmail.com'),
(default, 'Harry', 'Centro', "31-12-20", 'Veneno', 'M', 'darry@gmail.com'),
(default, 'Jerry', 'Centro', "01-01-20", 'Machado', 'M', 'merry@gmail.com');
    
INSERT INTO Vilao() values 
(default, 'Perry', 1),
(default, 'Garry', 2),
(default, 'Terry', 4),
(default, 'Ferry', 5),
(default, 'Kerry', 3);

INSERT INTO Missao() VALUES
(default, "Missao Impossivel", "14-08-99", "Roma", "35", 5),
(default, "Missao possivel", "25-01-99", "Berlim", "35", 2),
(default, "Missao Impossivel", "12-05-99", "Madrid", "35", 4),
(default, "Missao Impossivel", "03-07-99", "Paris", "35", 3),
(default, "Missao Possivel", "31-12-99", "Londres", "12", 1);

INSERT INTO Agente_has_missao() values 
(4, 2),
(4, 1),
(5, 2),
(2, 5),
(3, 3);

SELECT Agente.nome, Agente.email, Missao.nome, Missao.dat from Agente join Agente_has_missao 
on Agente.idAgente = Agente_has_missao.Agente_idAgente join Missao on Missao.idMissao = Agente_has_missao.Missao_idMissao;

SELECT Missao.nome, Missao.dat, Missao.duracao, Vilao.Nome FROM Missao join Vilao;

SELECT Agente.nome, Missao.nome, Vilao.Nome FROM Agente join Agente_has_missao 
on Agente.idAgente = Agente_has_missao.Agente_idAgente join Missao on Missao.idMissao = Agente_has_missao.Missao_idMissao;