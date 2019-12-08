-- Scripts for FideStore
-- Categorias
insert into CategoriaProducto (descripcion) valuess 
('Tecnologico'),('Hogar'),('Comida'),('Electronico'),('Comunicacion'),('Ferreteria');

-- Productos
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
values ('Computadora','Computadora todo en 1, monitor y componentes',450000,5,0,'temp_pc.png',1);
insert into Producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto) 
values ('Bagels','Disfruta de los exquisitos bagels, crujientes',5500,5,0,'temp_bagel.png',3);
insert into producto (nombre,descripcion,precio,cantidadDisponible,cantCompras,urlImg,idCategoriaProducto)
values ('Caja de herramientas','Combo de varias herramientas (martillo,desatornillador,pinzas,etc)',15000,15,0,
'temp_herramientas.png',6);

--Hogar by Irvin

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

