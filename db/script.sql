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

-- Danilo Obando

-- producto tecnologia
insert into Producto(nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
value('Audifonos','audifonos tipo airpods, cargador y estuche',30000,4,0,'audifonos-airpod.jpg',1);

insert into Producto(nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
value('impresora','conexion de bluetooth y tinta cartuchos',75000,3,0,'impresora.jpg',1);

insert into Producto(nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
value('Camara','camara canon con varios lentes',200000,2,0,'camara.jpg',1);

insert into Producto(nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
value('lente realidad virtual','lentes para realidad virtual para todo tipo de consola',100000,1,0,'realidad-virtual.jpg',1);

insert into Producto(nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
value('smartwatch','reloj inteligente ,conexion con android y ios',25000,4,0,'smartwatch.jpg',1);

insert into Producto(nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
value('iphone11','telefono celular ,color: negr,dorado,turqueza',700000,3,0,'iphone-11.jpg',1);

insert into Producto(nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
value('nintendo-switch','consola de videojuego con 3 juegos incorporados',150000,5,0,'nintendo-switch.webp',1);

-- producto comida 
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('pudin','budin con sabor a coco',3000,4,0,'pudin.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('pasta','Disfruta de la deliciosa pasta ',2000,5,0,'pasta.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('pescado','Disfruta del sabroso pescado a la plancha',3500,3,0,'pescado.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('surtido','Disfruta de los exquisitos surtidos',5000,5,0,'surtido.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('costillas','Disfruta de los exquisitas costillas con sabores salados y dulces',750,10,0,'costillas.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('lasagna','rica lasagna de pollo ',4500,2,0,'lasagna.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('pancake','delicioso pancake con miel',1500,3,0,'pancake.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('pizza','rica pizza de diferentes sabores ',7000,5,0,'peperonni-pizza.jpg',3);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
value ('salchipapa','rica salchipapa',2500,3,0,'salchipapa.jpg',3);

-- producto ferreteria
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('tornillo','varios tamaños para diferentes funciones',50,55,0,
'tornillo.jpg',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('clavos','clavos para madera ',100,50,0,
'clavos.webp',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('set construccion','Combo de varias herramientas (pala,carretillo,cinta)',30000,10,0,
'set.jpg',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('set llaves','combo de varias llaves(francesa,alicate perro)',10000,8,0,
'set-llaves.jpg',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('metabo','incorpora discos de corte de metal ',20000,7,0,
'matabo.jpg',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('serrucho','serrucho con hoja gruesa ',17000,10,0,
'serrucho.jpg',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('cinta metrica','cinta metrica ',3000,15,0,
'cinta-metrica.png',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('soldadora','Combo de varias herramientas (martillo,desatornillador,pinzas,etc)',15000,15,0,
'soldadora.jpg',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('llavin','llavin yale para porton o puerta',10000,15,0,
'llavin.png',6);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('cemento','cemento holcim ',7000,20,0,
'cemento.jpg',6);

