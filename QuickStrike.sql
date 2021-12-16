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

USE QuickStrike

INSERT INTO USUARIOS (NOMBRE, Apellido, DNI, Email, Telefono, Pass, Perfil, Estado)values('Gonzalo', 'Murias', '37786097', 'gonzalomurias@gmail.com', '1130918975', 'adminadmin', 2, 1)

INSERT INTO USUARIOS (NOMBRE, Apellido, DNI, Email, Telefono, Pass, Perfil, Estado)values('Agustina Magali', 'Moreno', '40222046', 'agustinamagalimoreno@gmail.com', '3489680985', 'adminadmin', 2, 1)


INSERT INTO FORMASPAGO (Nombre) VALUES ('EFECTIVO')
INSERT INTO FORMASPAGO (Nombre) VALUES ('TRANSFERENCIA BANCARIA')
INSERT INTO FORMASPAGO (Nombre) VALUES ('MERCADO PAGO')


