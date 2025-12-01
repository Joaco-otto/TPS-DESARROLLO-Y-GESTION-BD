CREATE DATABASE testDisparador;
USE testDisparador;

CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    nota DECIMAL(4,2)
);

-- Trigger 1: trigger_check_nota_before_insert
DELIMITER $$

CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END$$

DELIMITER ;
-- Trigger2 : trigger_check_nota_before_update

DELIMITER $$

CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END$$

DELIMITER ;


-- pruebas
INSERT INTO alumnos (nombre, apellido, nota) VALUES ('Juan', 'Pérez', 8.5);
INSERT INTO alumnos (nombre, apellido, nota) VALUES ('Ana', 'López', -3);
INSERT INTO alumnos (nombre, apellido, nota) VALUES ('Carlos', 'Gómez', 12.7);

SELECT * FROM alumnos;
