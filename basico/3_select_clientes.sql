SELECT * FROM Clientes;
SELECT * FROM Clientes WHERE cliente_id = 1;
SELECT DISTINCT pais FROM Clientes;
SELECT COUNT(*) FROM Clientes;
SELECT MAX(edad) FROM Clientes; --MIN SUM AVG

SELECT nombre, apellido FROM Clientes ORDER BY apellido;



-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (cliente_id, nombre, apellido, correo_electronico, edad, pais, ciudad)
VALUES (3, 'Carlos', 'González', 'carlos.gonzalez@example.com', 40, 'México', 'Ciudad de México');
INSERT INTO Clientes (cliente_id, nombre, apellido, correo_electronico, edad, pais, ciudad)
VALUES (4, 'Ana', 'Martínez', 'ana.martinez@example.com', 35, 'Argentina', 'Buenos Aires');


INSERT INTO Clientes (cliente_id, nombre, apellido, correo_electronico, edad, pais, ciudad)
VALUES
(5, 'Laura', 'Pérez', 'laura.perez@example.com', 28, 'Colombia', 'Bogotá'),
(6, 'Juan', 'Rodríguez', 'juan.rodriguez@example.com', 52, 'España', 'Madrid'),
(7, 'María', 'López', 'maria.lopez@example.com', 31, 'Chile', 'Santiago'),
(8, 'Pedro', 'Sánchez', 'pedro.sanchez@example.com', 45, 'Perú', 'Lima'),
(9, 'Sofia', 'Gómez', 'sofia.gomez@example.com', 23, 'Ecuador', 'Quito'),
(10, 'Miguel', 'Fernández', 'miguel.fernandez@example.com', 38, 'Venezuela', 'Caracas'),
(11, 'Isabel', 'Díaz', 'isabel.diaz@example.com', 29, 'Bolivia', 'La Paz'),
(12, 'Diego', 'Suárez', 'diego.suarez@example.com', 41, 'Paraguay', 'Asunción'),
(13, 'Valentina', 'Castro', 'valentina.castro@example.com', 33, 'Uruguay', 'Montevideo'),
(14, 'David', 'Ortiz', 'david.ortiz@example.com', 26, 'Panamá', 'Panamá'),
(15, 'Gabriela', 'Mendoza', 'gabriela.mendoza@example.com', 50, 'Costa Rica', 'San José'),
(16, 'Andrés', 'Ruiz', 'andres.ruiz@example.com', 37, 'Nicaragua', 'Managua'),
(17, 'Camila', 'Alvarez', 'camila.alvarez@example.com', 27, 'Honduras', 'Tegucigalpa'),
(18, 'Javier', 'Romero', 'javier.romero@example.com', 43, 'El Salvador', 'San Salvador'),
(19, 'Natalia', 'Flores', 'natalia.flores@example.com', 30, 'Guatemala', 'Ciudad de Guatemala'),
(20, 'Ricardo', 'Morales', 'ricardo.morales@example.com', 25, 'República Dominicana', 'Santo Domingo'),
(21, 'Clara', 'Herrera', 'clara.herrera@example.com', 48, 'Puerto Rico', 'San Juan'),
(22, 'Daniel', 'Núñez', 'daniel.nunez@example.com', 36, 'Cuba', 'La Habana'),
(23, 'Sara', 'Jiménez', 'sara.jimenez@example.com', 29, 'Jamaica', 'Kingston'),
(24, 'Alejandro', 'Vargas', 'alejandro.vargas@example.com', 40, 'Trinidad y Tobago', 'Puerto España'),
(25, 'Elena', 'Gomez', 'elena.gomez@example.com', 33, 'España', 'Madrid'),
(26, 'Pablo', 'Martinez', 'pablo.martinez@example.com', 48, 'España', 'Madrid'),
(27, 'Carmen', 'Sanchez', 'carmen.sanchez@example.com', 29, 'España', 'Madrid'),
(28, 'Raul', 'Diaz', 'raul.diaz@example.com', 37, 'España', 'Madrid'),
(29, 'Veronica', 'Fernandez', 'veronica.fernandez@example.com', 25, 'España', 'Madrid'),
(30, 'Alberto', 'Lopez', 'alberto.lopez@example.com', 41, 'Colombia', 'Bogotá'),
(31, 'Beatriz', 'Suarez', 'beatriz.suarez@example.com', 30, 'Colombia', 'Bogotá'),
(32, 'Carlos', 'Castro', 'carlos.castro@example.com', 28, 'Colombia', 'Bogotá'),
(33, 'Ana', 'Ortiz', 'ana.ortiz@example.com', 36, 'Colombia', 'Bogotá'),
(34, 'Luis', 'Mendoza', 'luis.mendoza@example.com', 51, 'Colombia', 'Bogotá'); 

SELECT ciudad, COUNT(*) AS cantidad_clientes FROM Clientes GROUP BY ciudad HAVING COUNT(*) > 5;


SELECT * FROM Clientes LIMIT 10 OFFSET 20;
