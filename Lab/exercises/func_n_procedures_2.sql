drop database if exists aula12;
create database aula12;
use aula12;

create table aluno(
	id int not null auto_increment primary key,
    nome varchar(50),
    idade int,
    email varchar(100)
);
create table compra(
	id int not null auto_increment primary key,
    nome varchar(50),
    preco float,
    pagamento float
);

-- inserir alunos
DELIMITER $$
DROP PROCEDURE IF EXISTS inserir_alunos $$
CREATE PROCEDURE inserir_alunos(nome varchar(50), idade int, email varchar(100)) 
BEGIN
  insert into aluno values (default, nome, idade, email);
END $$
DELIMITER ;

-- set de idade = 20 no ultimo ID
DELIMITER $$
DROP PROCEDURE IF EXISTS set_idade_20 $$
CREATE PROCEDURE set_idade_20(num int)
BEGIN
	if (select max(id) from aluno) = num then
		update aluno set idade = 20 where id = num;
	end if;
END $$
DELIMITER ;

-- deletar IDs pares
DELIMITER $$
DROP PROCEDURE IF EXISTS deletar_pares $$
CREATE PROCEDURE deletar_pares(id int) 
BEGIN
  if id % 2 = 0 then
	delete from aluno where aluno.id = id;
  end if;
END $$
DELIMITER ;

-- Calcular troco
DELIMITER $$
DROP FUNCTION IF EXISTS troco $$
CREATE FUNCTION troco(preco float, pagamento float) RETURNS varchar(45)
DETERMINISTIC
BEGIN
	if (pagamento - preco) < 0.05 then
		return "Sem troco";
	end if;
    if (pagamento - preco) <= 1 then
		return "Balinhas de café";
	else
		return "Em dinheiro";
	end if;
END $$
DELIMITER ;

-- Testes Stored Procedures
call inserir_alunos("Larry", 25, "larry@ges.inatel.br");
call inserir_alunos("Larry", 17, "harry@gel.inatel.br");
call inserir_alunos("Larry", 30, "darry@geb.inatel.br");
call inserir_alunos("Larry", 30, "garry@gea.inatel.br");

call deletar_pares(1);
call deletar_pares(2);
call deletar_pares(3);
call deletar_pares(4);

call set_idade_20(3);

select troco(preco, pagamento) from compra;