DROP DATABASE IF EXISTS fabrica_televisores;
CREATE DATABASE fabrica_televisores;
USE fabrica_televisores;

CREATE TABLE TelevisorModelo (
    modelo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Pieza (
    pieza_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pieza VARCHAR(100) NOT NULL,
    tipo_origen ENUM('fabricada', 'importada') NOT NULL,
    costo_unitario DECIMAL(10,2)
);

CREATE TABLE Operario (
    operario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    legajo VARCHAR(20)
);

CREATE TABLE HojaConfeccion (
    hoja_id INT AUTO_INCREMENT PRIMARY KEY,
    operario_id INT,
    pieza_id INT,
    fecha DATE,
    cantidad_fabricada INT,
    FOREIGN KEY (operario_id) REFERENCES Operario(operario_id),
    FOREIGN KEY (pieza_id) REFERENCES Pieza(pieza_id)
);

CREATE TABLE Importador (
    importador_id INT AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(100),
    cuit VARCHAR(20),
    direccion VARCHAR(150)
);

CREATE TABLE FacturaCompra (
    factura_id INT AUTO_INCREMENT PRIMARY KEY,
    importador_id INT,
    pieza_id INT,
    fecha DATE,
    cantidad INT,
    total_factura DECIMAL(10,2),
    FOREIGN KEY (importador_id) REFERENCES Importador(importador_id),
    FOREIGN KEY (pieza_id) REFERENCES Pieza(pieza_id)
);

CREATE TABLE MapaArmado (
    modelo_id INT,
    pieza_id INT,
    orden_ensamble INT,
    ubicacion VARCHAR(100),
    PRIMARY KEY (modelo_id, pieza_id),
    FOREIGN KEY (modelo_id) REFERENCES TelevisorModelo(modelo_id),
    FOREIGN KEY (pieza_id) REFERENCES Pieza(pieza_id)
);
-- REALIZO LOS INSERT PARA CADA TABLA
INSERT INTO TelevisorModelo (nombre_modelo, descripcion) VALUES
('TV Smart 40"', 'Modelo básico Full HD'),
('TV Smart 50"', 'Modelo intermedio con HDR'),
('TV 4K 55"', 'Alta definición, control por voz'),
('TV OLED 65"', 'Premium OLED con IA'),
('TV LED 32"', 'Económico y compacto');
INSERT INTO Pieza (nombre_pieza, tipo_origen, costo_unitario) VALUES
('Pantalla LED 40"', 'importada', 150.00),
('Control Remoto', 'fabricada', 10.50),
('Placa Madre', 'fabricada', 45.00),
('Fuente de Poder', 'importada', 25.00),
('Marco Plástico', 'fabricada', 5.00);
INSERT INTO Operario (nombre, apellido, legajo) VALUES
('Carlos', 'Pérez', 'OP001'),
('Lucía', 'Martínez', 'OP002'),
('Julián', 'Gómez', 'OP003'),
('Marta', 'Ríos', 'OP004'),
('Sofía', 'López', 'OP005');
INSERT INTO HojaConfeccion (operario_id, pieza_id, fecha, cantidad_fabricada) VALUES
(1, 2, '2025-08-20', 120),
(2, 3, '2025-08-21', 80),
(3, 5, '2025-08-22', 200),
(1, 3, '2025-08-23', 60),
(4, 2, '2025-08-24', 150);
INSERT INTO Importador (razon_social, cuit, direccion) VALUES
('ImportTech SA', '30-71234567-8', 'Av. Libertador 1234'),
('GlobalParts SRL', '30-70987654-1', 'Calle Falsa 123'),
('ElectroMundo', '30-70001122-9', 'Av. Roca 456'),
('Distribuidora LED', '30-70112233-5', 'Ruta 3 KM 8'),
('Piezas del Sur', '30-70990011-2', 'San Martín 890');
INSERT INTO FacturaCompra (importador_id, pieza_id, fecha, cantidad, total_factura) VALUES
(1, 1, '2025-08-15', 50, 7500.00),
(2, 4, '2025-08-16', 100, 2500.00),
(3, 1, '2025-08-17', 30, 4500.00),
(4, 4, '2025-08-18', 60, 1500.00),
(5, 1, '2025-08-19', 40, 6000.00);
INSERT INTO MapaArmado (modelo_id, pieza_id, orden_ensamble, ubicacion) VALUES
(1, 1, 1, 'Frontal'),
(1, 2, 2, 'Accesorio'),
(1, 3, 3, 'Interior'),
(2, 1, 1, 'Frontal'),
(2, 4, 4, 'Posterior');


-- Mapa de armado de cada televisor
SELECT 
    tm.nombre_modelo,
    p.nombre_pieza,
    ma.orden_ensamble,
    ma.ubicacion
FROM MapaArmado ma
JOIN TelevisorModelo tm ON ma.modelo_id = tm.modelo_id
JOIN Pieza p ON ma.pieza_id = p.pieza_id
ORDER BY tm.nombre_modelo, ma.orden_ensamble;

 -- Cuantas piezas fabrico cada operario en total
 SELECT 
    o.nombre,
    o.apellido,
    SUM(hc.cantidad_fabricada) AS Total_Fabricado
FROM Operario o
JOIN HojaConfeccion hc ON o.operario_id = hc.operario_id
GROUP BY o.operario_id
ORDER BY Total_Fabricado DESC;