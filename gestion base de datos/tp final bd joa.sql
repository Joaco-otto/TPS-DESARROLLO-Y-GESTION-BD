CREATE DATABASE IF NOT EXISTS tp_final_joa;
USE tp_final_joa;

/* 1 - Crear una función llamada "calcular_total_ventas" que tome como parámetro el mes y 
       el año, y devuelva el total de ventas realizadas en ese mes.Verificar mediante consulta
 */

 -- creo la tabla y los insert para el ejercicio 1

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    monto_venta DECIMAL(10,2) NOT NULL
);
INSERT INTO ventas (fecha_venta, monto_venta) VALUES
('2024-05-01', 1000),
('2024-05-10', 2500),
('2024-04-10', 500),
('2023-05-15', 800);
delimiter //

CREATE FUNCTION calcular_total_ventas(mes INT, anio INT)
RETURNS DECIMAL(18,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(18,2);

    SELECT SUM(monto_venta)
    INTO total
    FROM ventas
    WHERE MONTH(fecha_venta) = mes
      AND YEAR(fecha_venta) = anio;

    RETURN total;
END;

// delimiter ;
-- Prueba
SELECT calcular_total_ventas(5,2024);


/* 2 - Crear una función llamada "obtener_nombre_empleado" que tome 
como parámetro el ID de un empleado y devuelva su nombre completo. Verificar mediante consulta.*/

 -- creo la tabla y los insert para el ejercicio 2
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);
INSERT INTO empleados (nombre, apellido) VALUES
('Juan', 'Pérez'),
('Ana', 'García'),
('Luis', 'Martínez');

DELIMITER //

CREATE FUNCTION obtener_nombre_empleado(id INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE nombre_comp VARCHAR(200);

    SELECT CONCAT(nombre, ' ', apellido)
    INTO nombre_comp
    FROM empleados
    WHERE id_empleado = id;

    RETURN nombre_comp;
END;
 //DELIMITER ;

-- Prueba
SELECT obtener_nombre_empleado(1);

/*3 - Crear un procedimiento almacenado llamado "obtener_promedio" que tome como parámetro 
	  de entrada el nombre de un curso y calcule el promedio de las calificaciones de 
      todos los alumnos inscriptos en ese curso. Verificar mediante ejecución del procedimiento.*/
 
 -- creo la tabla y los insert para el ejercicio 3      
	CREATE TABLE inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_alumno VARCHAR(100),
    nombre_curso VARCHAR(100),
    calificacion DECIMAL(5,2)
);
INSERT INTO inscripciones (nombre_alumno, nombre_curso, calificacion) VALUES
('Pedro', 'Matematica', 7),
('Luis', 'Matematica', 9),
('María', 'Matematica', 8),
('Pedro', 'Historia', 6);
--  drop procedure obtener_promedio;
DELIMITER //
CREATE PROCEDURE obtener_promedio(IN nombre_curso VARCHAR(100))
BEGIN
    SELECT AVG(calificacion) AS promedio
    FROM inscripciones
    WHERE nombre_curso = nombre_curso;
END;

// DELIMITER ;
-- Prueba
CALL obtener_promedio('Matematica');

/*4 - Crear un procedimiento almacenado "actualizar_stock" que tome como parámetros de entrada el código del 
producto y la cantidad a agregar al stock actual. 
El procedimiento debe actualizar el stock sumando la cantidad especificada al stock actual del producto correspondiente. 
Verificar mediante ejecución del procedimiento.
*/

 -- creo la tabla y los insert para el ejercicio 4 
 drop table productos_stock;
 CREATE TABLE productos_stock (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    stock INT DEFAULT 0
);
INSERT INTO productos_stock(nombre, stock) VALUES
('Mouse', 10),
('Teclado', 20),
('Monitor', 5);

DELIMITER //
drop procedure actualizar_stock;
CREATE PROCEDURE actualizar_stock(IN cod INT, IN cantidad INT)
BEGIN
    UPDATE productos_stock
    SET stock = stock + cantidad
    WHERE id_producto = cod;
END;

// DELIMITER ;

-- Prueba
CALL actualizar_stock(1, 20);
select * from productos_stock;  /*se hizo la suma correctamente*/

/*5 - Crear una vista que muestre el título, el autor, el precio y la editorial de todos los libros de cocina de la base pubs.*/

