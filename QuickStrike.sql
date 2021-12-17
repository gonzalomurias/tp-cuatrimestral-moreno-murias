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

go
CREATE TABLE DIRECCIONES(
	ID int not null primary key identity(1,1),
	Calle varchar(200) not null,
	Numero varchar(10) not null,
	CP varchar(5) not null,
	Ciudad varchar(50) not null,
	Provincia varchar(50) not null,
	Pais varchar(50) not null,
)

go
CREATE TABLE USUARIOS(
	ID int primary key identity(1,1),
	Nombre varchar(20) not null,
	Apellido varchar(20) not null,
	DNI varchar(8) not null,
	Email varchar(50) not null unique,
	Telefono varchar(20) not null,
	Pass varchar(50) not null,
	Perfil int not null default(1),
	Estado bit not null default(1)
)

go
CREATE TABLE FORMASPAGO(
	ID int primary key identity(1,1),
	Nombre varchar(30) not null,
	Estado bit not null default(1)
)
go
CREATE TABLE ITEMCARRITO(
	ID int not null primary key identity(1,1),
	IDProducto int not null foreign key references PRODUCTOS(ID),
	Cantidad int not null check(Cantidad>0),
	Talle varchar(2) not null
)

go
CREATE TABLE PEDIDOS(
	ID int not null primary key identity(1,1),
	IDDireccion int not null foreign key references DIRECCIONES(ID), 
	IDUsuario int not null foreign key references USUARIOS(ID),
	IDFormaPago int not null foreign key references FORMASPAGO(ID),
	FechaPedido DateTime not null, 
	Total money not null,
	Despachado bit not null default(0),
	Estado bit not null default(1)
	)

go
CREATE TABLE CARRITO(
	 ID int not null identity(1,1),
	 IDItemCarrito int not null foreign key references ITEMCARRITO(ID),
	 IDPedido int not null foreign key references PEDIDOS(ID)
)

---------------------------------------------------------------------------- triggers

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



go
CREATE TRIGGER TR_NUEVA_DIRECCION ON DIRECCIONES
INSTEAD OF INSERT
AS BEGIN	
	declare @Calle varchar(200) 
	declare @Numero varchar(10) 
	declare @CP varchar(5) 
	declare @Ciudad varchar(50) 
	declare @Provincia varchar(50) 
	declare @Pais varchar(50) 
	Select  @Calle = Calle, @Numero = Numero, @CP = CP, @Ciudad = Ciudad, @Provincia = Provincia, @Pais = Pais from INSERTED

	IF @Numero not in (Select Numero from DIRECCIONES WHERE Calle = @Calle AND CP = @CP AND Ciudad = @Ciudad AND Provincia = @Provincia AND Pais = @Pais)
		BEGIN 
			INSERT INTO DIRECCIONES(Calle, Numero, CP, Ciudad, Provincia, Pais) VALUES (@Calle, @Numero, @CP, @Ciudad, @Provincia, @Pais)
		END
	ELSE BEGIN
			declare @ID int
			SET @ID = (Select ID FROM DIRECCIONES WHERE Calle = @Calle AND @Numero = Numero AND CP = @CP AND Ciudad = @Ciudad AND Provincia = @Provincia AND Pais = @Pais)
			UPDATE DIRECCIONES SET Calle = @Calle, Numero=@Numero, CP = @CP,Ciudad = @Ciudad, Provincia = @Provincia, Pais = @Pais WHERE ID=@ID
		END
END

---------------------------------------------------------------------------- inserts

--MARCAS--

INSERT INTO MARCAS (Nombre) VALUES ('NIKE')
INSERT INTO MARCAS (Nombre) VALUES ('ADIDAS')
INSERT INTO MARCAS (Nombre) VALUES ('PUMA')
INSERT INTO MARCAS (Nombre) VALUES ('CONVERSE')
INSERT INTO MARCAS (Nombre) VALUES ('VANS')
INSERT INTO MARCAS (Nombre) VALUES ('REEBOK')
INSERT INTO MARCAS (Nombre) VALUES ('FILA')
INSERT INTO MARCAS (Nombre) VALUES ('NEW BALANCE')

--TALLES--

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

--CATEGORIAS--

INSERT INTO CATEGORIAS (Nombre) VALUES ('ZAPATILLAS')
INSERT INTO CATEGORIAS (Nombre) VALUES ('OJOTAS')

--PRODUCTOS--

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 1, 'NIKE AIR FORCE 1 07', 'Zapatillas Nike Air Force 1 07 Low White', 17499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw90e5bb38/products/NI_DD8959-100/NI_DD8959-100-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 1, 'NIKE AIR MAX 270 REACT', 'Zapatillas Nike Air Max 270 React', 25199.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw721f9e89/products/NI_CT1264-101/NI_CT1264-101-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 2, 'ADIDAS FORUM MID', 'Zapatillas Adidas Forum Mid', 22399.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwe35f28c2/products/AD_FY4976/AD_FY4976-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 1, 'NIKE WAFFLE ONE', 'Zapatillas Nike Waffle One', 20999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw6ea3a724/products/NI_DA7995-001/NI_DA7995-001-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 3, 'PUMA RS-X3 SUPER', 'Zapatillas Puma RS-X3 Super', 13399.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw2975ce9a/products/PU_372884-08/PU_372884-08-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 3, 'PUMA RS-X MIX', 'Zapatillas Puma Rs-X Mix', 16399.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw03c0538c/products/PU_380462-01/PU_380462-01-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 5, 'VANS SK8-HI', 'Zapatillas Vans Sk8-Hi', 13900.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwb33c8991/products/VA_VN000D5IB8C/VA_VN000D5IB8C-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 5, 'VANS U SK8-HI', 'Zapatillas Vans U SK8-Hi', 13900.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwfc11df5a/products/VA_VN0A32QG4G5/VA_VN0A32QG4G5-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 4, 'CONVERSE CHUCK TAYLOR CORE HI', 'Zapatillas Converse Chuck Taylor Core Hi', 7599.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwe8985c5d/products/CO_156999C/CO_156999C-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (2, 1, 'NIKE OFFCOURT SLIDE', 'Ojotas Nike Offcourt Slide', 6499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwcf30d2d0/products/NI_BQ4632-010/NI_BQ4632-010-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 7, 'FILA ARCHIVE RJV', 'Zapatillas Fila Archive RJV', 17699.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw5a2d1a13/products/FI_1RM01543-014/FI_1RM01543-014-1.JPG')
INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (2, 3, 'PUMA POPCAT 20 ADIPRENE', 'Ojotas Puma Popcat 20 Adiprene', 6499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwb83236dc/products/PU_385033-02/PU_385033-02-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 1, 'NIKE AIR HUARACHE', 'Zapatillas Nike Air Huarache', 23999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw628b52cc/products/NI_DH4439-001/NI_DH4439-001-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 7, 'FILA UPROOT', 'Zapatillas Fila Uproot', 12999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw3ef97f1f/products/FI_1BM00642-014/FI_1BM00642-014-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 5, 'VANS ULTRA RANGE RAPIDWELD ', 'Zapatillas Vans Ultra Range Rapidweld', 17200.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw04a52bdc/products/VA_VN0A3MVUY28/VA_VN0A3MVUY28-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 4, 'CONVERSE NET STAR OK ', 'Zapatillas Converse Net Star Ox', 9999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw5b626950/products/CO_169993C/CO_169993C-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 4, 'CONVERSE CHUCK TAYLOR CORE HI ', 'Zapatillas Converse Chuck Taylor Core Hi', 7799.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw677c0c25/products/CO_157005C/CO_157005C-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 2, 'ADIDAS SUPERSTAR ', 'Zapatillas adidas Superstar', 23499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw1e1cd6b9/products/AD_EG4958/AD_EG4958-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 2, 'ADIDAS STAN SMITH ', 'Zapatillas adidas Stan Smith', 17999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwbd757438/products/AD_FZ2707/AD_FZ2707-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 4, 'CONVERSE STOKE ', 'Zapatillas Converse Stoke', 9499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwaad42f4d/products/CO_166610C/CO_166610C-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 3, 'PUMA MIRAGE SPORT REMIX', 'Zapatillas Puma Mirage Sport Remix', 17299.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw230a4cff/products/PU_381051-02/PU_381051-02-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 1, 'NIKE SB AIR MAX JANOSKI 2', 'Zapatillas Nike SB Air Max Janoski 2', 10399.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw3e929987/products/NI_631303-200/NI_631303-200-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 6, 'REEBOK CLASSIC LEGACY', 'Zapatillas Reebok Classic Legacy', 14499.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw4cdfd7c3/products/RE_FZ2924/RE_FZ2924-1.JPG')

INSERT INTO PRODUCTOS (IDCategoria, IDMarca, Nombre, Descripcion, Precio, URL_Imagen) 
VALUES (1, 6, 'REEBOK CLUB C REVENGE', 'Zapatillas Reebok Club C Revenge', 12999.00,
'https://www.moovbydexter.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw0e05f68b/products/RE_FY7514/RE_FY7514-1.JPG')

SELECT * FROM MARCAS
SELECT * FROM CATEGORIAS

--USUARIOS--

INSERT INTO USUARIOS (NOMBRE, Apellido, DNI, Email, Telefono, Pass, Perfil, Estado)values('Gonzalo', 'Murias', '37786097', 'gonzalomurias@gmail.com', '1130918975', 'adminadmin', 2, 1)
INSERT INTO USUARIOS (NOMBRE, Apellido, DNI, Email, Telefono, Pass, Perfil, Estado)values('Agustina Magali', 'Moreno', '40222046', 'agustinamagalimoreno@gmail.com', '3489680985', 'adminadmin', 2, 1)
INSERT INTO USUARIOS (NOMBRE, Apellido, DNI, Email, Telefono, Pass, Perfil, Estado)values('Test', 'Test', '1111111', 'test@gmail.com', '3489680985', 'test', 1, 1)

--FORMAS DE PAGO--

INSERT INTO FORMASPAGO (Nombre) VALUES ('EFECTIVO')
INSERT INTO FORMASPAGO (Nombre) VALUES ('TRANSFERENCIA BANCARIA')
INSERT INTO FORMASPAGO (Nombre) VALUES ('MERCADO PAGO')

--STOCK--

INSERT INTO STOCK_X_TALLE(IDProducto, IDTalle, Cantidad) VALUES (1, 1, 20)
INSERT INTO STOCK_X_TALLE(IDProducto, IDTalle, Cantidad) VALUES (1, 2, 10)
INSERT INTO STOCK_X_TALLE(IDProducto, IDTalle, Cantidad) VALUES (2, 1, 20)
INSERT INTO STOCK_X_TALLE(IDProducto, IDTalle, Cantidad) VALUES (3, 1, 20)



