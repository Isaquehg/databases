-- FOREIGN KEY = PRIMARY KEY
-- Produto cartesiano e JOIN sem restrição com WHERE
use empresabd;
select empregado.pnome, departamento.dnome from empregado, departamento 
where departamento.dnumero = empregado.dnumero_departamento;

select empregado.pnome, departamento.dnome from empregado 
inner join departamento on empregado.dnumero_departamento = departamento.dnumero;

-- SELECT com autorelacionamento
-- Diferenciar a mesma tabela com AS
-- Renomear colunas com AS também
select e.PNome as 'Empregado', s.PNome as 'Supervisor' from empregado as e, empregado as s 
where e.SSN_Supervisor = s.SSN;

-- SELECT com 3 tabelas
select e.PNome, p.PNome from empregado as e, projeto as p, trabalha_em as te
where e.SSN = te.SSN_empregado and p.PNumero = te.PNumero_Projeto;

-- DISTINCT
select distinct SSN_Supervisor from empregado;

-- LIKE
-- % significa que podemos ter qualquer texto antes/depois dele
select * from projeto where PNome = "Projeto X";
select PNome from empregado where Endereco like "%Santa Rita%";

-- funções: MIN, MAX, COUNT
select min(horas), max(horas) from trabalha_em where PNumero_Projeto = 5;
select count(distinct PLocalizacao) from projeto;
