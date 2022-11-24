-- Isaque Hollanda Gonçaves - 166 - GES
-- 1
insert into Departamento(DNome, Dnumero, SSNEmpregado) values("Setor 5", "Avenida", 987654321);
insert into Departamento(DNome, Dnumero, DataInicio) values("Setor 9", "Avenida", 04-05-1999);

-- 2
insert into Departamento(Dnome, DNumero) values("Setor A", 123456789);

-- 3
insert into Empregado(PNome, endereco, Sexo, Salario, UNome) values("Merry", "Avenida", "M", 4567.00, "Darry");
insert into Empregado(PNome, endereco, Sexo, Salario, UNome) values("Perry", "Centro", "H", 3520.50, "Garry");

insert into Empregado values("Larry", "MInicial", "Darry", 01-02-2003, "Centro", "H", 7888.22, 789456123, 25);
insert into Empregado values("Garry", "MInicial2", "Harry", 11-08-2005, "Alameda", "H", 7888.22, 71593572, 09);

-- 4
insert into Projeto(PNome, PNumero) values("P1", 48);
insert into Projeto(PNome, PNumero) values("P4", 12);

-- 5
update Empregado set SSN_Supervisor = 423128496 where PNome = "Larry";
update Empregado set SSN_Supervisor = 528639182 where PNome = "Garry";
update Empregado set SSN_Supervisor = 741852946 where PNome = "Merry";

-- 6
update Departamento set DGerente = 2456231887 where DNome = "Setor 5";
update Departamento set DGerente = 7711231887 where DNome = "Setor 9";

-- 7
update Projeto set PLocalizacao = "Almoxerifado", DNumero_Departamento = 123456789 where PNome = "P1";
update Projeto set PLocalizacao = "Almoxerifado", DNumero_Departamento = 987654321 where PNome = "P4";

-- 8
delete from Projeto where DNumero_Departamento = 123456789;
