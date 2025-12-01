-- ======================================
-- BASE DE DATOS: pubs
-- Trabajo Practico N 3 
-- Joaquin Flores  Gumiel
-- ======================================

DROP DATABASE IF EXISTS pubs;
CREATE DATABASE pubs;
USE pubs;
show databases;

-- ======================================
-- TABLA: publishers
-- ======================================
CREATE TABLE publishers (
  pub_id CHAR(4) PRIMARY KEY,
  pub_name VARCHAR(40),
  city VARCHAR(20),
  state CHAR(2),
  country VARCHAR(30)
);

INSERT INTO publishers VALUES
('0736','New Age Books','Boston','MA','USA'),
('0877','Binnet & Hardley','Washington','DC','USA'),
('1389','Algodata Infosystems','Berkeley','CA','USA'),
('1622','Five Lakes Publishing','Chicago','IL','USA'),
('1756','Ramona Publishers','Dallas','TX','USA'),
('9901','GGG&G','Palo Alto','CA','USA'),
('9999','Lucerne Publishing','Paris',NULL,'France');

-- ======================================
-- TABLA: authors
-- ======================================
CREATE TABLE authors (
  au_id CHAR(11) PRIMARY KEY,
  au_lname VARCHAR(40),
  au_fname VARCHAR(20),
  phone CHAR(12),
  address VARCHAR(40),
  city VARCHAR(20),
  state CHAR(2),
  zip CHAR(5),
  contract BOOLEAN
);

INSERT INTO authors VALUES
('172-32-1176','White','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','CA','94025',1),
('213-46-8915','Green','Marjorie','415 986-7020','309 63rd St.','Oakland','CA','94618',1),
('238-95-7766','Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94705',1),
('267-41-2394','Smith','Michael','415 836-7128','5631 Rice St.','San Jose','CA','95110',1),
('274-80-9391','Bennet','Abraham','408 496-7228','4227 Myra Dr.','Los Gatos','CA','95030',1),
('341-22-1782','Green','Morningstar','415 548-7726','22 Deer Rd.','Oakland','CA','94618',0),
('409-56-7008','Carson','Chester','415 836-7129','18 Randall Pl.','Novato','CA','94947',1),
('427-17-2319','Dull','Ann','408 286-2428','1875 University Ave.','Palo Alto','CA','94301',1),
('472-27-2349','O''Leary','Michael','408 286-2428','50 N 3rd St.','San Jose','CA','95112',1),
('527-72-3246','MacFeather','Stearns','415 836-7130','44 Upland Hts.','Oakland','CA','94612',1);

-- ======================================
-- TABLA: titles
-- ======================================
CREATE TABLE titles (
  title_id CHAR(6) PRIMARY KEY,
  title VARCHAR(80),
  type VARCHAR(12),
  pub_id CHAR(4),
  price DECIMAL(10,2),
  advance DECIMAL(10,2),
  royalty INT,
  ytd_sales INT,
  notes VARCHAR(200),
  pubdate DATE,
  FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

INSERT INTO titles VALUES
('BU1032','The Busy Executive''s Database Guide','business','1389',19.99,5000,10,4095,'An overview of database use for busy executives.','1991-06-12'),
('BU1111','Cooking with Computers: Surreptitious Balance Sheets','business','1389',11.95,5000,10,3876,'Cookbook for data processing managers.','1991-06-09'),
('BU2075','You Can Combat Computer Stress!','business','0736',2.99,10125,24,18722,'How to manage stress in the computer age.','1991-06-30'),
('MC2222','Silicon Valley Gastronomic Treats','mod_cook','0877',19.99,8000,12,2032,'Favorite recipes from the Silicon Valley area.','1991-06-09'),
('PS3333','Prolonged Data Deprivation: Four Case Studies','psychology','0736',19.99,2000,12,722,'Case studies on information addiction.','1991-06-30'),
('PS7777','Psychology of Computer Cooking','psychology','0877',12.99,1500,10,375,'Psychological aspects of cooking with computers.','1991-06-12'),
('TC4203','But Is It User Friendly?','trad_cook','0877',22.95,7000,18,8780,'A study of usability in software systems.','1991-06-12'),
('TC7777','Secrets of Silicon Valley','trad_cook','9999',20.00,4000,10,4095,'Inside stories of Silicon Valley culture.','1991-06-09'),
('MC3021','The Gourmet Microwave','mod_cook','1622',9.99,15000,24,22246,'Microwave recipes for the busy professional.','1991-06-30');

-- ======================================
-- TABLA: titleauthor
-- ======================================
CREATE TABLE titleauthor (
  au_id CHAR(11),
  title_id CHAR(6),
  au_ord TINYINT,
  royaltyper INT,
  PRIMARY KEY (au_id, title_id),
  FOREIGN KEY (au_id) REFERENCES authors(au_id),
  FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

INSERT INTO titleauthor VALUES
('172-32-1176','BU1032',1,60),
('213-46-8915','BU1111',1,100),
('238-95-7766','BU2075',1,100),
('267-41-2394','MC2222',1,25),
('267-41-2394','MC3021',1,75),
('274-80-9391','PS3333',1,50),
('409-56-7008','PS7777',1,100),
('427-17-2319','TC4203',1,100),
('472-27-2349','TC7777',1,100),
('527-72-3246','MC3021',2,25);

-- ======================================
-- TABLA: stores
-- ======================================
CREATE TABLE stores (
  stor_id CHAR(4) PRIMARY KEY,
  stor_name VARCHAR(40),
  stor_address VARCHAR(40),
  city VARCHAR(20),
  state CHAR(2),
  zip CHAR(5)
);

INSERT INTO stores VALUES
('6380','Eric the Read Books','788 Catamaugus Ave.','Seattle','WA','98056'),
('7066','Bookbeat','679 Carson St.','Portland','OR','97201'),
('7067','Fricative Bookshop','89 Madison St.','New York','NY','10010'),
('7131','Barnum''s','567 Pasadena Ave.','Pasadena','CA','91103');

-- TABLA: sales

CREATE TABLE sales (
  stor_id CHAR(4),
  ord_num CHAR(20),
  ord_date DATE,
  qty INT,
  payterms VARCHAR(12),
  title_id CHAR(6),
  PRIMARY KEY (stor_id, ord_num, title_id),
  FOREIGN KEY (stor_id) REFERENCES stores(stor_id),
  FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

INSERT INTO sales VALUES
('7066','P2121','1993-06-12',40,'Net 30','BU1032'),
('7066','P2121','1993-06-12',35,'Net 30','BU2075'),
('7067','A2976','1993-07-15',20,'Net 60','TC4203'),
('7067','B1111','1993-07-30',50,'Net 60','PS3333'),
('7067','C3333','1993-08-12',15,'Net 60','BU1111'),
('7131','D4444','1993-08-30',25,'Net 30','MC3021'),
('7131','E5555','1993-09-10',30,'Net 30','PS7777'),
('6380','F6666','1993-09-22',45,'Net 30','TC7777'),
('6380','G7777','1993-10-10',60,'Net 30','MC2222');

--  Ejercicio 1: Crea una vista que muestre el título, el autor y el precio de todos los libros de la tabla titles.
create view v_ej1 as
select t.title, a.au_fname, a.au_lname, t.price
from titles t
join titleauthor ta on t.title_id = ta.title_id
join authors a on ta.au_id = a.au_id;

select * from v_ej1;

-- Ejercicio 2: Crea una vista que muestre el título, el autor, el precio y el tipo de todos los libros de la tabla titles

create view v_ej2 as
select t.title, a.au_fname, a.au_lname, t.price, t.type
from titles t
join titleauthor ta on t.title_id = ta.title_id
join authors a on ta.au_id = a.au_id;
select * from v_ej2;

--  Ejercicio 3: Crea una vista que muestre el título, el autor, el precio y la fecha de publicación de
--  todos los libros de la tabla titles
create view v_ej3 as
select t.title, a.au_fname, a.au_lname, t.price, t.pubdate
from titles t
join titleauthor ta on t.title_id = ta.title_id
join authors a on ta.au_id = a.au_id;

select * from v_ej3;

-- Ejercicio 4: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales.
create view v_ej4 as
select t.title, a.au_fname, a.au_lname, t.price, s.qty
from titles t
join titleauthor ta on t.title_id = ta.title_id
join authors a on ta.au_id = a.au_id
join sales s on t.title_id = s.title_id;

select * from v_ej4;

-- Ejercicio 5: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda.

create view v_ej5 as
select st.stor_name, t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
from sales s
join stores st on s.stor_id = st.stor_id
join titles t on s.title_id = t.title_id
join titleauthor ta on t.title_id = ta.title_id
join authors a on ta.au_id = a.au_id
group by st.stor_name, t.title, a.au_fname, a.au_lname, t.price;

select * from v_ej5;

-- Ejercicio 6: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tipo de libro.

create view v_ej6 AS
select t.type, t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
from sales s
join titles t ON s.title_id = t.title_id
join titleauthor ta ON t.title_id = ta.title_id
join authors a ON ta.au_id = a.au_id
group by t.type, t.title, a.au_fname, a.au_lname, t.price;

select * from v_ej6;

-- Ejercicio 7: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda y tipo de libro.
create view v_ej7 as
select st.stor_name, t.type, t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
from sales s
join stores st ON s.stor_id = st.stor_id
join titles t ON s.title_id = t.title_id
join titleauthor ta ON t.title_id = ta.title_id
join authors a ON ta.au_id = a.au_id
group by st.stor_name, t.type, t.title, a.au_fname, a.au_lname, t.price;

select*from v_ej7;

 -- Ejercicio 8: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
 -- los libros de la tabla sales por cada tienda y año de publicación.
 
create view v_ej8 as
select st.stor_name, t.title, a.au_fname, a.au_lname, t.price,
       year(t.pubdate) as anio_publicacion,
       SUM(s.qty) as cantidad_vendida
from sales s
join stores st on s.stor_id = st.stor_id
join titles t on s.title_id = t.title_id
join titleauthor ta on t.title_id = ta.title_id
join authors a on ta.au_id = a.au_id
group by st.stor_name, t.title, a.au_fname, a.au_lname, t.price, anio_publicacion;

select*from v_ej8;
 -- Ejercicio 9: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
 -- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación.

CREATE VIEW v_ej9 AS
SELECT st.stor_name, t.type, YEAR(t.pubdate) AS anio_publicacion,
       t.title, a.au_fname, a.au_lname, t.price, SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY st.stor_name, t.type, anio_publicacion, t.title, a.au_fname, a.au_lname, t.price;

 -- Ejercicio 10: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
 -- los libros de la tabla sales por cada tienda, tipo de libro, año de publicación y mes de publicación.

CREATE VIEW v_ej10 AS
SELECT st.stor_name, t.type,
       YEAR(t.pubdate) AS anio_publicacion,
       MONTH(t.pubdate) AS mes_publicacion,
       t.title, a.au_fname, a.au_lname, t.price,
       SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY st.stor_name, t.type, anio_publicacion, mes_publicacion, t.title, a.au_fname, a.au_lname, t.price;
-- Ejercicio 11: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que superaron los 10 libros
CREATE VIEW v_ej11 AS
SELECT t.title, a.au_fname, a.au_lname, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE t.price > 15;


-- Ejercicio 12: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron en el año 1990.
CREATE VIEW v_ej12 AS
SELECT t.title, a.au_fname, a.au_lname, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE t.price BETWEEN 10 AND 20;

-- Ejercicio 13: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron entre 1990 y 1994.
CREATE VIEW v_ej13 AS
SELECT t.title, a.au_fname, a.au_lname, t.type, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE t.type IN ('business', 'psychology');



-- Ejercicio 14: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron en la tienda con el ID 7066.
CREATE VIEW v_ej14 AS
SELECT t.title, a.au_fname, a.au_lname, t.price, t.pubdate
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE YEAR(t.pubdate) > 1990;

-- Ejercicio 15: Crea una vista que muestre el título, el autor, el precio y la cantidad vendida de todos
-- los libros de la tabla sales por cada tienda, tipo de libro y año de publicación, pero solo para las
-- ventas que se realizaron por el autor con el ID 172
CREATE VIEW v_ej15 AS
SELECT st.stor_name, t.title, a.au_fname, a.au_lname, s.qty
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE st.stor_name = 'Bookbeat';
-- Ejercicio 16: Crea una vista que permita actualizar el precio de un libro en la tabla titles.
CREATE VIEW v_ej16 AS
SELECT t.title, a.au_fname, a.au_lname, SUM(s.qty) AS total_vendido
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY t.title, a.au_fname, a.au_lname
HAVING SUM(s.qty) > 50;

-- Ejercicio 17: Crea una vista que permita actualizar el nombre de un autor en la tabla authors.

CREATE VIEW v_ej17 AS
SELECT t.title, a.au_fname, a.au_lname
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
LEFT JOIN sales s ON t.title_id = s.title_id
WHERE s.title_id IS NULL;


-- Ejercicio 18: Crea una vista que permita actualizar la cantidad vendida de un libro en la tabla sales.
CREATE VIEW v_ej18 AS
SELECT t.title, a.au_fname, a.au_lname, p.pub_name
FROM titles t
JOIN publishers p ON t.pub_id = p.pub_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id;



-- Ejercicio 19: Crea una vista que permita actualizar la fecha de publicación de un libro en la tabla
-- titles.
CREATE VIEW v_ej19 AS
SELECT p.pub_name, t.title, t.price
FROM titles t
JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY p.pub_name, t.price DESC;



-- Ejercicio 20: Crea una vista que permita actualizar el tipo de un libro en la tabla titles
CREATE VIEW v_ej20 AS
SELECT a.au_fname, a.au_lname, COUNT(t.title_id) AS cantidad_libros
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_fname, a.au_lname
HAVING COUNT(t.title_id) > 1;
