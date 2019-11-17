create schema FactuCyC;
use FactuCyC;

/*
	Usuario
    Menu (Apartados/Privilegios)
    Perfil
    Menu-Perfil
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
    precio decimal(12,2) not null,
    cantidadDisponible int,
    cantCompras int,
    idCategoriaProducto int not null,
    constraint idCategoriaProducto_Producto_fk foreign key(idCategoriaProducto) references CategoriaProducto(idCategoriaProducto)
);

-- -------------------------------------------------------------------------------

/*create table FormaPago(
	idFormaPago int primary key auto_increment,
    descripcion varchar(75)
);*/

-- -------------------------------------------------------------------------------

create table Carrito(
	idLineaCarrito int primary key auto_increment,
    idProducto int not null,
    idUsuario int not null,
    cant int(4),
    constraint idProducto_Carrito_fk foreign key(idProducto) references Producto(idProducto),
    constraint idUsuario_Carrito_fk foreign key(idUsuario) references Usuario (idUsuario)
);

create table FacturaEncabezado(
	idFacturaEncabezado int primary key auto_increment,
    fecha date,
    subTotal decimal(12,2),
    total decimal(12,2),
    impuesto decimal(12,2),
    idUsuario int not null,
    constraint idCliente_FacturaEncabezado_fk foreign key(idUsuario) references Usuario(idUsuario)
);

create table FacturaDetalle(
	idFacturaEncabezado int not null,
    idFaturaDetalle int primary key auto_increment,
    idProducto int not null,
    cant int(4),
    constraint idProducto_FacturaDetalle_fk foreign key(idProducto) references Producto(idProducto)
);