-- QUESTAO 1
-- A chave primária tem como objetivo enumerar as linhas da tabela e, portanto, facilitar a busca de dados específicos


-- QUESTAO 2
create table if not exists pessoa(
	id int not null auto_increment primary key,
    nome varchar(45),
    endereco varchar(45),
    cargo varchar(45)
);

-- RESPOSNDA A QUESTÂO 2 AQUI
-- a
INSERT INTO pessoa(nome, endereco, cargo) VALUES ("Larry", "Centro", "Gerente");
INSERT INTO pessoa(nome, endereco, cargo) VALUES ("Darry", "Avenida", "Técnico");
INSERT INTO pessoa(nome, endereco, cargo) VALUES ("Merry", "Alameda", "Supervisor");

-- b
UPDATE pessoa SET cargo = 'Gerente Geral' WHERE id = 1;

-- c
SELECT nome, endereco FROM pessoa;

-- d
DELETE FROM pessoa WHERE id = 3;


-- QUESTAO 3
create table empresa(
	matricula int not null auto_increment primary key,
    nome varchar(45),
    cpf varchar(45),
    cargo varchar(45),
    nProjetos int
);

--a
INSERT INTO empresa(nome, cpf, cargo, nProjetos) VALUES ("Junior", "000.000.000.000", "GP", 2);
INSERT INTO empresa(nome, cpf, cargo, nProjetos) VALUES ("Maria", "111.111.111.111", "Dev", 3);
INSERT INTO empresa(nome, cpf, cargo, nProjetos) VALUES ("Carlos", "222.222.222.222", "Tester", 4);
INSERT INTO empresa(nome, cpf, cargo, nProjetos) VALUES ("Julia", "333.333.333.333", "Dev", 5);

--b
SELECT * FROM empresa WHERE nProjetos > 3;

--c
SELECT MIN(nProjetos) AS menor_N_de_Projetos FROM empresa;
SELECT MAX(nProjetos) AS maior_N_de_Projetos FROM empresa;

--d
SELECT AVG(nProjetos) FROM empresa WHERE cargo != "Gerente de Projetos";

--e
SELECT DISTINCT cargo from empresa;

--f
SELECT nome, cpf, nProjetos FROM empresa WHERE cargo = "Dev";


-- QUESTAO 4
CREATE TABLE if NOT EXISTS pessoa(
    nome varchar(45),
    matricula int not null auto_increment primary key,
    endereco varchar(45),
    ano_nasc varchar(45),
    curso varchar(45)
);
-- APENAS AS LETRA B E C ESTÃO CORRETAS, POIS ESTÃO COM OS ARGUMENTOS NA ORDEM 
-- CERTA E COM PARAMENTROS IDEAIS PARA A PRIMERY_KEY

--f
SELECT * FROM aluno WHERE nome LIKE 'Jan____%';

--g
SELECT aluno, curso FROM aluno WHERE nome LIKE 'L%a';

--h
SELECT DISTINCT ano_nasc, curso FROM aluno;

--i
SELECT nome, ano_nasc, curso WHERE ano_nasc <= 1998;

--j
SELECT * FROM aluno LIMIT 3;

--k
UPDATE aluno SET endereco = 'Novo Endereço' WHERE curso = 'GEB';

--l
DELETE FROM aluno WHERE curso = 'GEB';

