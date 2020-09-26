create database locadoraventureira;

use locadoraventureira;

create table cliente(
	codCliente smallint primary key not null auto_increment,
    nome varchar(50),
    rg varchar(15),
    cpf varchar(15),
    email varchar(40),
    endereco varchar(50),
    telefone varchar(30),
    idade int,
    sexo char,
		 CONSTRAINT chk_sexo CHECK ( sexo = 'F' or sexo = 'M') 
);
create table filme(
	codFilme int primary key auto_increment,
    nomeFilme varchar(100),
    classificacaoIndicativa int,
    sinopse varchar(300),
    genero char,
    qtdAlugado int,
    qtdDisponivel int,
    capa longblob,
		CONSTRAINT genero CHECK ( genero = 'A' or genero = 'V' or genero = 'C' or genero = 'T' 
			or genero = 'R' or genero = 'F' or genero = 'S' or genero = 'D' or genero = 'N') 
);

create table locacao(
	codLocacao int primary key not null auto_increment,
    nomeCliente varchar(50),
    nomeFilme varchar(50),
    valor int,
    entregue char,
    dataEntrega DATE 
);