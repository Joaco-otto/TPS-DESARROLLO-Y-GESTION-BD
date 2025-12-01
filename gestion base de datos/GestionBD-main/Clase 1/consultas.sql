-- 1. Listar la cantidad de libros de la base.
SELECT COUNT(*) FROM titles;

-- 2. Listar la suma de precios de todos los titulos.
SELECT TRUNCATE(SUM(price), 2) FROM titles;

-- 3. Listar el promedio de horas trabajadas por todos los empleados.
SELECT AVG(job_lvl) FROM employee;

-- 4. Listar el precio del titulo mas caro.
SELECT MAX(price) FROM titles;

-- 5. Listar el precio del titulo mas barato.
SELECT MIN(price) FROM titles;

-- 6. Listar el nombre del titulo mas barato.
SELECT  title 
FROM    titles 
WHERE   price = (SELECT MIN(price) FROM titles);

-- 7. Listar el nombre y apellido del autor que escribio el titulo mas reciente.
SELECT  CONCAT(a.au_fname, ' ', a.au_lname) as autor
FROM    authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
WHERE   t.pubdate = (SELECT MAX(pubdate) FROM titles);

-- 6. Mostrar el nombre de las editoriales que no hayan publicado ningún libro. 
SELECT pub_name
FROM publishers
WHERE pub_id NOT IN (SELECT DISTINCT pub_id FROM titles);

-- tabla ppal: publishers
SELECT          p.pub_name editorial
                -- ,t.*
FROM            publishers p 
LEFT JOIN       titles t 
ON              p.pub_id = t.pub_id
WHERE           t.title_id IS NULL;

-- 7. Mostrar el nombre de los libros que nunca fueron vendidos.
SELECT          t.title libro
                -- ,s.*
FROM            titles t
LEFT JOIN       sales s ON t.title_id = s.title_id
WHERE           s.stor_id IS NULL;


-- Agrupaciones
use pubs;

-- listar la cantidad de titulos por editorial
SELECT          p.pub_name editorial,
                COUNT(t.title_id) cantidad_libros
FROM            publishers p
INNER JOIN       titles t ON p.pub_id = t.pub_id
GROUP BY        p.pub_name;

-- listar el precio mas caro, el mas barato y la cantidad de titulos
-- de cada categoria. Ordenar por cantidad descendente. La categoria 
-- no debe ser cocina y ademas la cantidad de titulos de cada categoria sea 
-- mayor a 2
SELECT          t.type categoria,
                MAX(t.price) precio_mas_caro,
                MIN(t.price) precio_mas_barato,
                COUNT(t.title_id) cantidad_titulos
FROM            titles t
WHERE           t.type not LIKE '%cook%'
GROUP BY        t.type
HAVING          COUNT(t.title_id) > 2
ORDER BY        cantidad_titulos desc
LIMIT           2;


-- Funciones de Agrupacion
-- listar la cantidad de empleados
SELECT COUNT(*) FROM employee;

-- listar la fecha del ultimo libro publicado
SELECT MAX(pubdate) FROM titles;

-- listar cuantas horas trabaja el empleado con menos carga horaria
SELECT MIN(job_lvl) FROM employee;

-- listar el precio promedio de todos los titulos
SELECT AVG(price) FROM titles;

-- listar las ventas por categoria
SELECT          t.type as categoria, 
                SUM(s.qty) as ventas
FROM            titles t
INNER JOIN      sales s 
ON              t.title_id = s.title_id
WHERE           t.type != ''
GROUP BY        t.type
HAVING          SUM(s.qty) > 100
ORDER BY        2 DESC
LIMIT           1;
-- tiempo promedio de publicacion de todos los titulos
SELECT AVG(DATEDIFF(sale_date, pubdate)) FROM titles t
INNER JOIN sales s ON t.title_id = s.title_id;

-- refman mysql

-- JOINS
-- 2 Mostrar el nombre del libro y el nombre de la editorial la cual lo publicó sólo de las editoriales que tengan residencia en USA. Mostrar un apodo para cada columna.
SELECT          t.title as libro,
                p.pub_name as editorial
FROM            titles t
INNER JOIN      publishers p ON t.pub_id = p.pub_id
WHERE           p.country = 'USA';

-- 6. Mostrar el nombre de las editoriales que no hayan publicado ningún libro. 
-- tabla ppal: editoriales
SELECT          p.pub_name as editorial
                -- ,t.*
FROM            publishers p 
LEFT JOIN       titles t ON p.pub_id = t.pub_id
WHERE           t.title_id IS NULL;