#banco de dados Pesquisador
drop database if exists pesquisador;
create database if not exists pesquisador;
use pesquisador;

#tabela instituição
create table if not exists instituicao(
idInstituicao int(4) not null auto_increment,
nome varchar(10) not null,
primary key (idInstituicao)
)engine innodb;

#tabela pesquisadores
create table if not exists pesquisadores(
idPesquisadores int(4) not null auto_increment,
nome varchar(45) not null,
nomeInstituicao varchar(45) not null,
idInstituicao int(10) not null,
primary key (idPesquisadores),
foreign key (idInstituicao) references instituicao(idInstituicao)
)engine innodb;

#tabela veiculo
create table if not exists veiculo(
idVeiculo int(4) not null,
título varchar(45) not null,
tipo varchar(45) not null,
primary key (idVeiculo)
)engine innodb;

#tabela artigos
create table if not exists artigos(
idArtigo int(15) not null auto_increment,
titulo varchar(45) not null,
pagInicial int(5) not null,
pagFinal int(5) not null,
idInstituicao int(6) not null,
idPesquisadores int(04) not null,
idVeiculo int(4) not null,
primary key (idArtigo),
foreign key (idPesquisadores) references pesquisadores(idPesquisadores),
foreign key (idVeiculo)  references veiculo(idVeiculo),
foreign key (idInstituicao)  references instituicao(idInstituicao)
)engine innodb;

# Inserir dados instituicao
insert into instituicao values
(idInstituicao, 'IFSP'),
(idInstituicao, 'UFRJ'),
(idInstituicao, 'USP'),
(idInstituicao, 'UNESP');

#select * from instituicao;

# Inserir dados pesquisadores
insert into pesquisadores values
(idPesquisadores, 'Luciana L. V.', 'UNESP', 0004),
(idPesquisadores, 'Adriano D. R.', 'IFSP', 0001),
(idPesquisadores, 'Vicente F.', 'UNESP', 0004),
(idPesquisadores, 'Geã D. P. B.', 'USP', 0003),
(idPesquisadores, 'Bruno R.', 'UFRJ', 0002);

/*drop table pesquisadores;
select * from pesquisadores;*/

# Inserir dados veiculo
insert into veiculo values
(0001, 'Science', 'Revista de artigos'),
(0002, 'Artigos Ciêntificos Brasileiros', 'Site');

# Inserir dados artigo
insert into artigos values
(idArtigo, 'Desenvolvimento Infantil', 4, 300,  0004, 0001, 0002),
(idArtigo, 'Beneficios Medicinais da Flora da Caatinga', 340, 1900,  0004, 0003, 0001),
(idArtigo, 'Antibioticos', 20, 190, 0001, 0002, 0001),
(idArtigo, 'Suínos', 301, 600, 0003, 0004, 0002),
(idArtigo, 'Estatística', 601, 1059,0002, 0005, 0002),
(idArtigo, 'Estatísticad', 601, 1059, 0002, 0005, 0002);

select * from artigos;

#excluir registro
delete from artigos where titulo='Estatísticad';
select * from artigos;

#alterar dado
update veiculo set tipo='Revista' where idVeiculo=0001;
select * from veiculo;

#seleções
select *from artigos where idPesquisadores between 0001 and 0003;
select *from artigos where idVeiculo<2; 
select *from artigos where idInstituicao=4; 
