-- Scripts for FideStore
insert into Perfil (nombre) values ('Usuario');

insert into Menu (nombre,url,estado,accPublic,accPriv,accBoth,logNeeded) values 
('Productos','/Views/productos.html',1,1,1,1,0),
('Acerca','/Views/acerca.html',1,1,1,1,0),
('Carrito','/Views/carrito.html',1,1,1,1,1),
('Iniciar sesion','/Views/login.html',1,1,0,0,0),
('Mi cuenta','/Views/micuenta.html',1,0,1,0,1),
('Registrarse','/Views/registro.html',1,1,0,0,0),
('Cerrar sesion','/API/api.php',1,0,1,0,1);

insert into Perfil_Menu values 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7);

-- Categorias
insert into CategoriaProducto (descripcion) values 
('Tecnologico'),('Hogar'),('Comida'),('Electronico'),('Comunicacion'),('Ferreteria');
insert into CategoriaProducto (descripcion) values ('Ropa');

-- Productos
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
values ('Computadora','Computadora todo en 1, monitor y componentes',450000,5,0,'temp_pc.png',1);

insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
values ('Bagels','Disfruta de los exquisitos bagels, crujientes',5500,5,0,'temp_bagel.png',3);

insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('Caja de herramientas','Combo de varias herramientas (martillo,desatornillador,pinzas,etc)',15000,15,0,
'temp_herramientas.png',6);

-- Hogar by Irvin

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Refrigeradora', 'Refrigeradora LG, ultimo modelo', 500000, 5000, 0, 'refrigeradora.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Cocina', 'Cocina 4 discos y horno', 650000, 3000, 0, 'cocina.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Juego de muebles', 'Juego de muebles sillón grande, más dos individuales', 250000, 10000, 0, 'muebles.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Microondas', 'Horno microondas LG smart inverted', 50000, 500, 0, 'microondas.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Licuadora', 'Licuadora Hamilton Beach' , 30000, 1000, 0, 'licuadora.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Tostadora', 'Tostadora mondial', 15000, 1500, 0, 'tostadora.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Lavadora', 'Whirlpool Lavadora Semi-Profesional Pro', 60000, 10000, 0, 'lavadora.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Secadora', 'Secdora LG', 700000, 5000, 0, 'secadora.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Juego de comedor', 'Comedor de madera', 250000, 1000, 0, 'comedor.jpg', 2);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Mini Bar', 'Mini bar de madera fina', 990000, 1000, 0, 'minibar.jpg', 2);

-- Electronico by Irvin

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Laptop', 'Laptop MacBook Air', 900000, 2500, 0, 'laptop.png', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Cámara', 'Cámara Nikon Coolpix', 850000, 2000, 0, 'camara.jpg', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Teclado', 'Teclado inalámbrico', 250000, 5000, 0, 'teclado.jpg', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Mouse', 'Mouse inalámbrico', 150000, 2500, 0, 'mouse.png', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('TV', 'Pantalla Plasma', 500000, 6000, 0, 'tv.jpg', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Celulares', 'iPhone X', 1000000, 10000, 0, 'celular.png', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Audífonos', 'Audífonos inalámbricos Beats Studio3', 10000, 5000, 0, 'audios.jpg', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Consola', 'PS4', 550000, 4000, 0, 'ps4.png', 4);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Impresora', 'Impresora Epson L850', 450000, 2500, 0, 'impresora.jpg', 4);

-- Ropa by Irvin

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Camisa manga larga', 'Camisa Manga larga azul', 5000, 10000, 0, 'camisa.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Pantalones', 'Pantalón negro', 6000, 1000, 0, 'pantalones.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Zapatos', 'Zapatos de vestir', 15000, 3040, 0, 'zapatos.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Ropa interior', 'Boxer color gris', 5000, 1000, 0, 'boxer.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Medias', 'Medias con dibujos', 4000, 1500, 0, 'medias.png', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Abrigos', 'Abrigo color gris mujer', 20000, 1000, 0, 'abrigo.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Blusas', 'Blusa color blanco', 5000, 200, 0, 'blusa.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Camisa', 'Camisa normal hombre', 5660, 300, 0, 'camisacorta.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Ropa deportiva', 'Conjunto ropa deportiva hombre', 50000, 1000, 0, 'ropadepo.jpg', 7);

insert into Producto (nombre, descripcion, precio, cantidadDisponible, cantCompras, urlImg, idCategoriaProducto) 
value ('Tenis', 'Tenis color rojo para correr', 54000, 1100, 0, 'tenis.png', 7);
