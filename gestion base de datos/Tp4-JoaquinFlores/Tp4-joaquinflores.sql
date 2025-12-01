-- Tp-4
-- Joaquin Flores Gumiel
drop database if exists editoriales;
create database editoriales;
use editoriales;
create table editoriales (
    id_editorial int primary key,
    nombre_editorial varchar(255) not null
);
create table libros (
    id_libro int primary key,
    id_editorial int,
    titulo varchar(255) not null,
    fecha_publicacion date,
    foreign key (id_editorial) references editoriales(id_editorial)
);

insert into editoriales (id_editorial, nombre_editorial)
values
    (1, 'Editorial Santillana'),
    (2, 'Editorial Anagrama'),
    (3, 'Editorial Planeta'),
    (4, 'Editorial Alfaguara'),
    (5, 'Editorial SM'),
    (6, 'Editorial Penguin Random House'),
    (7, 'Editorial Norma'),
    (8, 'Editorial Ediciones B'),
    (9, 'Editorial Aguilar'),
    (10, 'Editorial Fondo de Cultura Económica');
insert into libros (id_libro, id_editorial, titulo, fecha_publicacion)
values
    (1, 1, 'Cien años de soledad', '1967-05-30'),
    (2, 2, 'Rayuela', '1963-07-23'),
    (3, 3, 'La sombra del viento', '2001-04-27'),
    (4, 4, 'Pedro Páramo', '1955-11-30'),
    (5, 5, 'Don Quijote de la Mancha', '1605-01-16'),
    (6, 6, 'Harry Potter y la piedra filosofal', '1997-06-26'),
    (7, 7, 'Crimen y castigo', '1866-01-29'),
    (8, 8, 'Los detectives salvajes', '1998-09-01'),
    (9, 9, 'La casa de los espíritus', '1982-01-01'),
    (10, 10, 'Ficciones', '1944-05-01');

select * from editoriales;
select * from libros;

show index from editoriales;
show index from libros;
-- Ejercicios

-- Ejercicio 1:
-- Crea un índice compuesto en las columnas id_editorial y titulo de la tabla libros.
create index idx_libros_id_editorial_titulo on libros (id_editorial, titulo);

-- Ejercicio 2 :
-- Crea un índice en la columna fecha_publicacion de la tabla libros.
create index idx_libros_fecha_publicacion on libros (fecha_publicacion);

-- Ejercicio 3
-- Elimina el índice idx_libros_id_editorial_titulo de la tabla libros.
drop index idx_libros_id_editorial_titulo on libros;

-- Ejercicio 4:
-- Actualiza el índice idx_libros_id_editorial_titulo de la tabla libros para que sea un índice 
-- único en la columna id_editorial.

-- Eliminar el índice existente
drop index idx_libros_id_editorial_titulo on libros;

-- Crear el índice único en id_editorial
create unique index idx_libros_id_editorial on libros (id_editorial);

-- Ejercicio 5: 
-- ¿Se puede usar alter para resolver el ejercicio anterior?

-- no inmediatamente , primero se debe modificar uno ya existente, ALTER TABLE
-- agrega o elimina indices(no modifica uno que existe)

-- Ejercicio 6:
-- Crea un índice único en la columna id_editorial de la tabla editoriales.
create unique index idx_editoriales_id_editorial on editoriales (id_editorial);

-- Ejercicio 7:
-- Crea un índice primary en la columna id_libro de la tabla libros.
alter table libros add primary key (id_libro);





