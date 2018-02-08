create database biblioteca_central;
use biblioteca_central; 

create table usuario (
	id int not null auto_increment primary key,
	nombre varchar(50) not null,
	apellidos varchar(50) not 0null,
	usuario varchar(50) not null,
	email varchar(255) not null,
	contraseña varchar(60) not null,
	esta_activo boolean not null default 1,
	es_admin boolean not null default 0,
	fecha_creacion datetime not null
);

insert into usuario (nombre,usuario,contraseña,esta_activo,es_admin,fecha_creacion) value ("Administrador","admin",sha1(md5("admin")),1,1,NOW());

create table universitario (
	id int not null auto_increment primary key,
	nombre varchar(50) not null,
	apellidos varchar(50) not null,
	email varchar(255) not null,
	direccion varchar(60) not null,
	telefono varchar(60) not null,
	esta_activo boolean not null default 1,
	fecha_creacion datetime not null
);

create table autor (
	id int not null auto_increment primary key,
	nombre varchar(200) not null,
	apellidos varchar(1000) not null
);

create table editorial (
	id int not null auto_increment primary key,
	nombre varchar(200) not null);

create table categoria (
	id int not null auto_increment primary key,
	nombre varchar(200) not null
);

create table estado (
	id int not null auto_increment primary key,
	nombre varchar(200) not null
);

insert into estado (nombre) values ("Disponible"),("Ocupado"),("No disponible");

create table libro (
	id int not null auto_increment primary key,
	isbn varchar(100),
	titulo varchar(200) not null,
	subtitulo varchar(1000) not null,
	descripcion varchar(1000) not null,
	año int,
	num_pag int,
	id_autor int,
	id_editorial int,
	id_categoria int,
	foreign key (id_autor) references autor(id),
	foreign key (id_editorial) references editorial(id),
	foreign key (id_categoria) references categoria(id)
);

create table ejemplar(
	id int not null auto_increment primary key,
	codigo varchar(100),
	id_estado int not null,
	foreign key (id_estado) references estado(id),
	id_libro int not null,
	foreign key (id_libro) references libro(id)
);

create table prestamo(
	id int not null auto_increment primary key,
	id_ejemplar int not null,
	id_universitario int not null,
	fecha_inicio date not null,
	fecha_fin date not null,
	fecha_retorno date,
	id_usuario int not null,
	id_receptor int ,
	foreign key (id_universitario) references universitario(id),
	foreign key (id_usuario) references usuario(id),
	foreign key (id_receptor) references usuario(id),
	foreign key (id_ejemplar) references ejemplar(id)
);
