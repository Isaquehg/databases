create database c207;
use c207;

create table alunos(
	matricula int,
    curso varchar(20),
    nome varchar(60),
    periodo int,
    primary key(matricula, curso)
);

create user "Monitor";
create user "Professor";

grant create, remove, update, delete on c207.alunos to "Monitor";
grant all privileges on c207.* to "Professor";

revoke insert on c207.alunos from "Monitor";
revoke create, drop on c207.* from "Professor";
