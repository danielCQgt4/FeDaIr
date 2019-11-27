create schema FeDaIr;
use FeDaIr;

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
    estado int(1)
);

create table Perfil(
	idPerfil int primary key auto_increment,
    nombre varchar(50)
);

create table Perfil_Menu(
	idPerfil int not null,
    idMenu int not null,
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
);

create table FacturaDetalle(
	idFacturaEncabezado int not null,
    idFaturaDetalle int primary key auto_increment,
    cant int(4),
    idProducto int not null,
    constraint idProducto_FacturaDetalle_fk foreign key(idProducto) references Producto(idProducto)
);

insert into categoriaproducto (descripcion) values 
('Tecnologico'),('Hogar'),('Comida'),('Tecnologico'),('Comunicacion');


insert into producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('Computadora','Computadora todo en 1, monitor y componentes',450000,5,0,'temp_pc.png',1);
insert into producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('Bagels','Disfruta de los exquisitos bagels, crujientes',450000,5,0,'temp_bagel.png',3);

select * from producto;