drop database if exists banco;
create database banco;
use banco;
drop table if exists cliente;
create table cliente(
	id int not null auto_increment primary key,
    nome varchar(45),
    cpf varchar(45),
    endereco varchar(45)
);

insert into cliente(nome, cpf, endereco) values ("Larry", "11111111", "Avenida");
insert into cliente(nome, cpf, endereco) values ("Darry", "00000000", "Centro");

alter table cliente add column ano_nasc varchar(45);

update cliente set ano_nasc = '01/01/2000' where id = 1;
update cliente set ano_nasc = '31/12/2000' where id = 2;

delete from cliente where id = 1;

select * from cliente;