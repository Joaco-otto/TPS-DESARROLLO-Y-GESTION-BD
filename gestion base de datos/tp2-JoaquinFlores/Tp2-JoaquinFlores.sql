-- BASE DE DATOS: editoriales
-- Trabajo Práctico - Integridad Referencial Joaquin Flores
-- =====================================
-- 1 Base de datos
drop database if exists editoriales;
create database editoriales;
use editoriales;

-- 2 tabla editoriales
-- drop table editoriales;
create table editoriales (
    id_editorial int not null,
    nombre_editorial varchar(100) not null
  
);
-- Se agrega la clave primaria 
-- PK
alter table editoriales
add primary key (id_editorial);

-- 3 tabla empleados
create table empleados (
    id_empleado int not null,
    nombre_empleado varchar(100) not null,
    id_editorial int not null   
);
-- Se agrega la clave primaria
alter table empleados
add primary key  (id_empleado);
-- agrega la clave foranea
ALTER TABLE empleados
ADD CONSTRAINT fk_empleado_editorial
FOREIGN KEY (id_editorial)
REFERENCES editoriales (id_editorial)
on delete cascade on update cascade;

-- 4 tabla libros
-- drop table libros;
create table libros (
    id_libro int not null,
    titulo_libro varchar(150) not null ,
    id_editorial int not null
    
);

-- Se agregan las restricciones 

ALTER TABLE libros
ADD PRIMARY KEY (id_libro);

-- FK con ON DELETE CASCADE y ON UPDATE CASCADE
ALTER TABLE libros
ADD CONSTRAINT fk_libro_editorial
FOREIGN KEY (id_editorial)
REFERENCES editoriales (id_editorial)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- 5 Insert en editoriales
insert into editoriales (id_editorial, nombre_editorial)
values
    (1, 'Editorial Planeta'),
    (2, 'Editorial Santillana'),
    (3, 'Editorial Anaya'),
    (4, 'Editorial Alfaguara'),
    (5, 'Editorial SM'),
    (6, 'Editorial Fondo de Cultura Económica'),
    (7, 'Editorial Siglo XXI'),
    (8, 'Editorial Cátedra'),
    (9, 'Editorial Tecnos'),
    (10, 'Editorial Ariel');

-- 6 Insert en empleados
insert into empleados (id_empleado, nombre_empleado, id_editorial)
values
    (1, 'Juan Pérez', 1),
    (2, 'María Rodríguez', 1),
    (3, 'Pedro López', 2),
    (4, 'Ana Martínez', 2),
    (5, 'Carlos García', 3),
    (6, 'Laura González', 3),
    (7, 'Luis Fernández', 4),
    (8, 'Elena Sánchez', 4),
    (9, 'Javier Ruiz', 5),
    (10, 'Sofía Torres', 5);

-- 7 Insert datos en libros
insert into libros (id_libro, titulo_libro, id_editorial)
values
    (1, 'Cien años de soledad', 1),
    (2, 'Don Quijote de la Mancha', 1),
    (3, 'La sombra del viento', 2),
    (4, 'Rayuela', 2),
    (5, 'Crónica de una muerte anunciada', 3),
    (6, 'Los detectives salvajes', 3),
    (7, 'Ficciones', 4),
    (8, 'La casa de los espíritus', 4),
    (9, 'La ciudad y los perros', 5),
    (10, 'Cien años de soledad', 5);
-- probar la creacion de las tablas y la base de datos:

select * from editoriales;
select * from empleados;
select * from libros;
-- Consignas:
-- 1 Eliminar una editorial 
delete from editoriales where id_editorial = 2;
-- con las restricciones que hice no afectan a libros al momento de eliminar la editorial

-- 2 Actualizar el nombre de una editorial
update editoriales 
set nombre_editorial = 'Editorial Planeta obscuro'
where id_editorial = 1; 
-- El cambio en el nombre no afecta a libros ni empleados porque ellos no guardan el nombre, solo el id_editorial

-- 3 Eliminar un empleado 
delete from empleados where id_empleado = 1;
-- al eliminar un empleado no se afectan a los libros por que no tienen una relacion directa

-- 4 Actualizar el nombre de un empleado
update empleados set nombre_empleado = 'Joaquin Flores'
where id_empleado =5;
-- Cambia de nombre al empleado no le afecta a los libros

-- 5 Eliminar un libro 
delete from libros where id_libro = 8;
-- se elimina el libro no afecta a editorial

-- 6 Cambiar la editorial de un libro
update libros set id_editorial = 4
where id_libro = 3;
-- el libro se reasigna a otra editorial se rompe la relacion con la anterior 

-- 7 Eliminar editorial con empleados
 delete from editoriales where id_editorial = 2;
 
-- 8 Eliminar un empleado con libros 
delete from empleados where id_empleado = 3;

-- 9 Eliminar una editorial y todos sus empleados 
-- Primero borrar empleados de la editorial
 delete from empleados where id_editorial = 2;
 delete from editoriales where id_editorial = 2;
 -- 10 Eliminar una editorial y transferir sus empleados a otra editorial
 -- primero transferimos los empleados de la editorial 2 a la editorial 1
 update empleados set id_editorial = 1 where id_editorial = 2;
 -- eliminar la editorial 2
 delete from editoriales where id_editorial=2;
