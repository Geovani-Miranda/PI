create database BuildEase;
use BuildEase;
create table cliente(
id_cliente int auto_increment primary key,
nome varchar(45) not null,
email varchar(60) unique not null,
senha varchar(45) not null,
cep varchar(10) not null
);
create table pedreiro(
id_pedreiro int auto_increment primary key,
nome varchar(45) not null,
especialidade varchar(25) not null,
valor_medio decimal(10, 2) not null,
inclui_material boolean not null default false,
telefone varchar(20) not null,
cep varchar(10) not null
);
create table obra(
id_obra int auto_increment primary key,
titulo varchar(50) not null,
descricao varchar(100) not null,
url_foto varchar(255) not null,
data_postagem datetime default current_timestamp,
id_pedreiro int not null,
constraint fk_obra_pedreiro foreign key (id_pedreiro) references pedreiro (id_pedreiro)
);
create table avaliacao(
id_avaliacao int auto_increment primary key,
nota decimal(3, 2) not null,
comentario_dica varchar(100) not null,
data_ datetime default current_timestamp,
id_obra int not null,
id_cliente int,
id_pedreiro int,
constraint fk_avaliacao_obra foreign key (id_obra) references obra (id_obra),
constraint fk_avaliacao_cliente foreign key (id_cliente) references cliente (id_cliente),
constraint fk_avaliacao_pedreiro foreign key (id_pedreiro) references pedreiro (id_pedreiro)
);
create table orcamento(
id_orcamento int auto_increment primary key,
descricao_servico varchar(100) not null,
com_material boolean not null default false,
valor_estimado decimal(10, 2) not null,
status_ enum('Em Aberto', 'Pendente', 'Aceito', 'Em Andamento', 'Concluido', 'Cancelado') not null default 'Em Aberto', 
id_cliente int not null,
id_pedreiro int not null,
constraint fk_orcamento_cliente foreign key (id_cliente) references cliente (id_cliente),
constraint fk_orcamento_pedreiro foreign key (id_pedreiro) references pedreiro (id_pedreiro)
);
create table mensagem(
id_mensagem int auto_increment primary key,
texto_mensagem varchar(1000),
data_hora_envio datetime default current_timestamp,
tipo_remetente enum('Cliente', 'Pedreiro') not null default 'Cliente',
id_orcamento int not null,
constraint fk_mensagem_orcamento foreign key (id_orcamento) references orcamento (id_orcamento)
);
create table distribuidora_parceira(
id_distribuidora int auto_increment primary key,
nome_empresa varchar(50) not null,
descricao_servicos varchar(255) not null,
whatsapp_contato varchar(20) not null,
link_site varchar(255) not null,
url_logo varchar(255) not null,
cep varchar(10) not null
);