-- Exercício Proposto Cap4 Pt.4 C207
-- Isaque Hollanda Gonçalves 166 GES
use empresabd;

-- 1
select distinct Parentesco from dependente;

-- 2
 select UNome, DataNasc from empregado where Sexo = 1 order by DataNasc desc;

-- 3
select d.Nome_Dependente as Dependente, e.PNome as Responsavel from empregado as e, dependente as d;

-- 4
select avg(e.Salario) as Salario_Medio from empregado as e, depto_localizacoes as dl, departamento as d 
where e.DNumero_Departamento = dl.DNumero_Departamento and dl.DLocalizacao = "Sao Paulo" and d.DNome = "Engenharia";

-- 5
select s.PNome as Nome_Sup, e.PNome as Nome_Emp, (s.Salario - e.Salario) as Dif_Sal
from empregado as s, empregado as e where s.SSN = e.SSN_Supervisor;

-- 6
select e.PNome as Nome, p.PNome as NomeProj, te.Horas as HorasProj 
from empregado as e, projeto as p, trabalha_em as te
where e.SSN = te.SSN_Empregado and p.PNumero = te.PNumero_Projeto;