-- create user 'epiz_24797336'@'%' identified by 'vb0KOPl63P09E';
create database epiz_24797336_fedair;
-- grant all privileges on epiz_24797336_fedair.* to 'epiz_24797336'@'%';
use epiz_24797336_fedair;

/* Drop area */
drop table if exists FacturaDetalle;
drop table if exists FacturaEncabezado;
drop table if exists FormaPago;
drop table if exists Carrito;
drop table if exists Producto;
drop table if exists CategoriaProducto;
drop table if exists Perfil_Menu;
drop table if exists Usuario;
drop table if exists Perfil;
drop table if exists Menu;

/*
	Usuario
    Menu (Apartados)
    Perfil (Rol)
    Perfil-Menu (Permisos)
    -------------------------------------------------------------
    CategoriaProducto
    Producto
    -------------------------------------------------------------
    Carrito
    FormaPago
    FacturaEncabezado
    FacturaDetalle
*/

create table Menu(
	idMenu int primary key auto_increment,
    nombre varchar(35),
    url varchar(100),
    icono varchar(100),
    estado int(1), -- 1:activo , 0:deshabilitado
    accPublic int(1), -- 1:si , 0:no
    accPriv int(1), -- 1:si , 0:no
    accBoth int(1), -- 1:si , 0:no
    logNeeded int(1) -- 1:si , 0:no
);

create table Perfil(
	idPerfil int primary key auto_increment,
    nombre varchar(50)
);

create table Perfil_Menu(
	idPerfil int not null,
    idMenu int not null,
    constraint idPerfil_idMenu_pk primary key(idPerfil,idMenu),
    constraint idPerfil_Perfil_Menu_fk foreign key(idPerfil) references Perfil(idPerfil),
    constraint idMenu_Perfil_Menu_fk foreign key(idMenu) references Menu(idMenu)
);

create table Usuario(
	idUsuario int primary key auto_increment,
    cedula varchar(11),
    usuario varchar(50) not null,
    contra varchar(250) not null,
    nombre varchar(50),
    telefono varchar(15),
    idPerfil int(11) default 0,
    constraint idPerfil_Usuario_fk foreign key (idPerfil) references Perfil(idPerfil)
);

-- -------------------------------------------------------------------------------
create table CategoriaProducto(
	idCategoriaProducto int primary key auto_increment,
    descripcion varchar(75)
);

create table Producto(
	idProducto int primary key auto_increment,
    nombre varchar(75),
    descripcion varchar(150),
    -- Se tiene que correr de nuevo
    precio decimal(12,2) not null,
    cantidadDisponible int,
    cantCompras int,
    urlImg varchar(250),
    idCategoriaProducto int not null,
    constraint idCategoriaProducto_Producto_fk foreign key(idCategoriaProducto) references CategoriaProducto(idCategoriaProducto)
);

-- -------------------------------------------------------------------------------

create table Carrito(
	idLineaCarrito int primary key auto_increment,
    idProducto int not null,
    idUsuario int not null,
    cant int(4),
    constraint idProducto_Carrito_fk foreign key(idProducto) references Producto(idProducto),
    constraint idUsuario_Carrito_fk foreign key(idUsuario) references Usuario (idUsuario)
);

create table FormaPago (
  idFormaPago int primary key auto_increment,
  idUsuario int not null,
  numerotarjeta varchar(100) not null,
  tipo varchar(50) not null,
  constraint idUsuario_FormaPago_fk foreign key(idUsuario) references Usuario(idUsuario)
);
  
create table FacturaEncabezado(
    idFacturaEncabezado int primary key auto_increment,
    fecha date,
    subTotal decimal(12,2),
    total decimal(12,2),
    impuesto decimal(12,2),
    idUsuario int not null,
    idFormapago int null,
    referencia varchar(15),
    constraint idCliente_FacturaEncabezado_fk foreign key(idUsuario) references Usuario(idUsuario),
    constraint idFormapago_FacturaEncabezado_fk foreign key(idFormapago) references FormaPago(idFormapago)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

create table FacturaDetalle(
	idFacturaEncabezado int not null,
    idFaturaDetalle int primary key auto_increment,
    cant int(4),
    idProducto int not null,
    constraint idProducto_FacturaDetalle_fk foreign key(idProducto) references Producto(idProducto),
    constraint idFacturaEncabezado_FaturaDetalle_fk foreign key(idFacturaEncabezado) references FacturaEncabezado(idFacturaEncabezado)
);

