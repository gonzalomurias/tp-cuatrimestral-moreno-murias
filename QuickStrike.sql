DROP DATABASE QuickStrike

CREATE DATABASE QuickStrike
go
Use QuickStrike
CREATE TABLE CATEGORIAS(
	ID int primary key identity(1,1),
	Nombre varchar(50) not null,
	Estado bit not null default(1)
)
go
CREATE TABLE MARCAS(
	ID int primary key identity(1,1),
	Nombre varchar(50) not null,
	Estado bit not null default(1)
)
go

CREATE TABLE TALLES(
	ID int primary key identity(1,1),
	Numero int not null check (Numero >= 34 AND Numero <= 47),
	Estado bit not null default(1),
)

go
CREATE TABLE PRODUCTOS(
	ID int primary key identity(1,1),
	IDCategoria int not null foreign key references CATEGORIAS(ID),
	IDMarca int not null foreign key references MARCAS(ID),
	Nombre varchar(100) not null,
	Descripcion varchar(150) not null,
	Precio money not null check (Precio>0),
	URL_Imagen varchar(300) not null,
	Estado bit not null default(1)
)
go
CREATE TABLE STOCK_X_TALLE(
	ID int primary key identity(1,1),
	IDProducto int not null foreign key references PRODUCTOS(ID),
	IDTalle int not null foreign key references TALLES(ID),
	Cantidad int not null default(0) check (Cantidad >= 0) 
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

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 1, 'NIKE AIR FORCE 1 07', 'Zapatillas Nike Air Force 1 07 Low White', 17499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw9ee36128/products/NI_315115-112/NI_315115-112-6.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 1, 'NIKE AIR MAX 270 REACT', 'Zapatillas Nike Air Max 270 React', 25199.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwac06058d/products/NI_CT1264-101/NI_CT1264-101-6.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 2, 'ADIDAS FORUM EXHIBIT LOW', 'Zapatillas Adidas Forum Exhibit Low', 12999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw2629f743/products/AD_GZ5391/AD_GZ5391-6.JPG')



go
CREATE TRIGGER TR_CARGAR_STOCK ON STOCK_x_TALLE
INSTEAD OF INSERT 
AS BEGIN
	declare @IDProducto int
	declare @IDTalle int 
	declare @Cantidad int
	SELECT @IDProducto = IDProducto, @IDTalle = IDTalle, @Cantidad = Cantidad from inserted

IF @IDTalle not in (Select IDTalle from STOCK_X_TALLE WHERE IDProducto=@IDProducto)
BEGIN 
INSERT INTO STOCK_X_TALLE(IDProducto, IDTalle, Cantidad) VALUES (@IDProducto, @IDTalle, @Cantidad)
END
ELSE BEGIN
UPDATE STOCK_X_TALLE SET IDProducto=@IDProducto, IDTalle=@IDTalle, Cantidad=@Cantidad WHERE @IDProducto=IDProducto and @IDTalle=IDTalle
END
END

