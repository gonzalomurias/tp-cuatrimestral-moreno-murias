DROP DATABASE QuickStrike

CREATE DATABASE QuickStrike
go
Use QuickStrike
CREATE TABLE CATEGORIAS(
	ID bigint primary key identity(1,1),
	Nombre varchar(50) not null,
	Estado bit not null default(1)
)
go
CREATE TABLE MARCAS(
	ID bigint primary key identity(1,1),
	Nombre varchar(50) not null,
	Estado bit not null default(1)
)
go
CREATE TABLE TALLES(
	ID bigint primary key identity(1,1),
	Numero smallint not null check (Numero >= 34 AND Numero <= 47),
	Estado bit not null default(1)
)

go
CREATE TABLE PRODUCTOS(
	ID bigint primary key identity(1,1),
	IDCategoria bigint not null foreign key references CATEGORIAS(ID),
	IDMarca bigint not null foreign key references MARCAS(ID),
	IDTalle bigint not null foreign key references TALLES(ID),
	Nombre varchar(100) not null,
	Descripcion varchar(150) not null,
	Precio money not null check (Precio>0),
	URL_Imagen varchar(300) not null,
	Stock int not null,
	Estado bit not null default(1)
)

USE QuickStrike
INSERT INTO MARCAS (Nombre) VALUES ('NIKE')
INSERT INTO MARCAS (Nombre) VALUES ('ADIDAS')
INSERT INTO MARCAS (Nombre) VALUES ('PUMA')
INSERT INTO MARCAS (Nombre) VALUES ('CONVERSE')
INSERT INTO MARCAS (Nombre) VALUES ('VANS')
INSERT INTO MARCAS (Nombre) VALUES ('REEBOK')
INSERT INTO MARCAS (Nombre) VALUES ('FILA')
INSERT INTO MARCAS (Nombre) VALUES ('NEW BALANCE')
INSERT INTO MARCAS (Nombre) VALUES ('NEW BALANCE')

INSERT INTO TALLES (Numero) VALUES (34)
INSERT INTO TALLES (Numero) VALUES (35)
INSERT INTO TALLES (Numero) VALUES (36)
INSERT INTO TALLES (Numero) VALUES (37)
INSERT INTO TALLES (Numero) VALUES (38)
INSERT INTO TALLES (Numero) VALUES (39)
INSERT INTO TALLES (Numero) VALUES (40)
INSERT INTO TALLES (Numero) VALUES (41)
INSERT INTO TALLES (Numero) VALUES (42)
INSERT INTO TALLES (Numero) VALUES (43)
INSERT INTO TALLES (Numero) VALUES (44)
INSERT INTO TALLES (Numero) VALUES (45)
INSERT INTO TALLES (Numero) VALUES (46)
INSERT INTO TALLES (Numero) VALUES (47)

INSERT INTO CATEGORIAS (Nombre) VALUES ('ZAPATILLAS')
INSERT INTO CATEGORIAS (Nombre) VALUES ('OJOTAS')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, IDTalle, Nombre, Descripcion, Precio, URL_Imagen, Stock) 
VALUES (1, 1, 4, 'NIKE AIR FORCE 1 07', 'Zapatillas Nike Air Force 1 07 Low White', 17499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw8abed4db/products/NI_315115-112/NI_315115-112-1.JPG', 200)
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, IDTalle, Nombre, Descripcion, Precio, URL_Imagen, Stock) 
VALUES (1, 1, 5, 'NIKE DUNK HIGH "VARSITY PURPLE', 'Zapatillas Nike Dunk High Varsity Purple', 24499.00,
'https://cdn.shopify.com/s/files/1/0255/9429/8467/products/nike-dunk-hi-sp-varsity-purple-DC5382-100_1_y7sx0a_1800x1800.jpg', 15)
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, IDTalle, Nombre, Descripcion, Precio, URL_Imagen, Stock) 
VALUES (1, 2, 6, 'ADIDAS FORUM EXHIBIT LOW', 'Zapatillas Adidas Forum Exhibit Low', 12999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwa5f3d5b5/products/AD_GZ5391/AD_GZ5391-1.JPG', 170)



