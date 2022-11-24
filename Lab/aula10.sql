drop database if exists aula10;
create database aula10;

use aula10;

create table aluno(
	id int not null auto_increment primary key,
	nome varchar(45),
    idade int,
    curso varchar(3),
    email varchar(45)
);

#CRIANDO A FUNCTION
DELIMITER $$
DROP FUNCTION IF EXISTS mult $$
CREATE FUNCTION criar_email(nome varchar(45), curso varchar(3)) RETURNS varchar(45)
DETERMINISTIC
BEGIN
	RETURN concat(nome, "@", curso, ".inatel.br");
END $$
DELIMITER ;
  
#CHAMANDO A FUNCTION
-- SELECT criar_email("larry", "ges");

#CRIANDO STORED PROCEDURE
DELIMITER $$
DROP PROCEDURE IF EXISTS soma $$
CREATE PROCEDURE inserir_dados(nome varchar(45), curso varchar(45), idade int) 
BEGIN
  insert into aluno values (default, nome, idade, curso, criar_email(nome, curso));
END $$
DELIMITER ;

#CHAMANDO STORED PROCEDURE
CALL inserir_dados("larry", "ges", 25);

select * from aluno;