drop database if exists loja;
create database loja;
use loja;

create table compra(
	id int not null auto_increment primary key,
    preco float,
    pagamento float
);

insert into compra values (id, 9.5, 10.25);
insert into compra values (id, 40.9, 50.0);
insert into compra values (id, 14.7, 14.7);
insert into compra values (id, 15.0, 15.3);

-- 1)
create view qnt_compras as (
	select * from compra where preco >= 10.0
);
select * from qnt_compras;

-- 2)
create view qtde as (
	select i.qtd as "Quantidade solicitada", e.qtd_disponivel as "Podem vender" 
    from itens_solicitacao as i, estoque as e where i.nome like "%Resistor%"
);