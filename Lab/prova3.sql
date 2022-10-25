DROP DATABASE IF EXISTS artesanato;
CREATE DATABASE artesanato;
USE artesanato;

CREATE TABLE IF NOT EXISTS Cliente(
cpf VARCHAR(14) NOT NULL PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
telefone VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Produto(
codigo INT NOT NULL PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
tipo_madeira VARCHAR(45) NOT NULL,
preco INT NOT NULL,
qtd_estoque INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Compra(
Cliente_cpf VARCHAR(14) NOT NULL,
Produto_codigo INT NOT NULL,
data_compra DATE NOT NULL,
qtd_comprada INT NOT NULL,
taxa_entrega FLOAT NOT NULL,
PRIMARY KEY (Cliente_cpf, Produto_codigo),
CONSTRAINT Cliente_cpf_fk
FOREIGN KEY (Cliente_cpf) REFERENCES Cliente(cpf) ON DELETE NO ACTION
ON UPDATE CASCADE,
CONSTRAINT Produto_codigo_fk
FOREIGN KEY (Produto_codigo) REFERENCES Produto(codigo) ON DELETE NO ACTION
ON UPDATE CASCADE
);

alter table Cliente add column cep varchar(9);
alter table Produto modify preco float(2) not null;
alter table Compra drop column taxa_entrega;

insert into Cliente(cpf, nome, telefone) values('492.441.760-25','Luciano','(35)99875-5572');
insert into Cliente(cpf, nome, telefone) values('456.841.862-03','Flavio','(35)3473-8562');
insert into Cliente(cpf, nome, telefone) values('192.041.526-14','Paola','(35)3471-1519');
insert into Cliente(cpf, nome, telefone) values('556.851.862-88','Aline','(11)99822-9639');

insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0300,'Baleia Azul','Carvalho',29.90,3);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0301,'Moinho de Vento','Ipê',24.90,2);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0400,'Conjunto de Banquinhos','Carvalho',42,4);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0500,'Porta-chaves','Goiabão',8.90,7);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0501,'Mini Avião','Mogno',27.90,4);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0502,'Tronco Esculpido','Goiabão',69.90,2);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0503,'Vaso de Flores','Aroeira',9.90,4);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0504,'Urso Pardo','Aroeira',28.90,2);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0505,'Peixe Dourado','Ipê',37.90,2);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0800,'Galinha Pintada','Carvalho',11.90,4);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0801,'Flauta','Mogno',18.90,2);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0802,'Guitarra', 'Alder', 1000, 5);
insert into Produto(codigo, nome, tipo_madeira, preco, qtd_estoque) values(0900,'Tábua de Corte','Carvalho',8.90,4);

insert into Compra(Cliente_cpf, Produto_codigo, data_compra, qtd_comprada) values('492.441.760-25', '0301', '2018-08-20', '1');
insert into Compra(Cliente_cpf, Produto_codigo, data_compra, qtd_comprada) values('556.851.862-88', '0503', '2020-11-12', '2');
insert into Compra(Cliente_cpf, Produto_codigo, data_compra, qtd_comprada) values('456.841.862-03', '0802', '2020-10-30', '1');

select Cliente.nome, Produto.nome, Compra.data_compra, Compra.qtd_comprada from Cliente join Compra, Produto;

create user "Rodrigo" identified by "123456789";
grant all privileges on * to "Rodrigo";

create user "Secretaria" identified by "987654321";
grant SELECT, UPDATE, DELETE, INSERT, ALTER on artesanato.* to "Secretaria";

revoke alter on artesanato.* from "Secretaria";

drop user "Secretaria";
