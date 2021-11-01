CREATE DATABASE QuickStrike
go

Use QuickStrike
go
CREATE TABLE CATEGORIAS(
	ID bigint primary key identity (1,1),
	Nombre varchar(50)
)
go
CREATE TABLE MARCAS(
	ID bigint primary key identity (1,1),
	Nombre varchar(50)
)
go
CREATE TABLE PRODUCTOS(
	ID bigint primary key identity (1,1),
	IDCategoria bigint not null foreign key references CATEGORIAS(ID),
	IDMarca bigint not null foreign key references MARCAS(ID),
	Nombre varchar(100) not null,
	Descripcion varchar(150) not null,
	Precio money not null check (Precio > 0),
	URL_Imagen varchar(300) not null,
	Stock tinyint not null,
	Estado bit not null default (1)
)