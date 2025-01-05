CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    correo_electronico VARCHAR(255),
    edad INT,
    pais VARCHAR(100),
    ciudad VARCHAR(100)
);

INSERT INTO Clientes (cliente_id, nombre, apellido, correo_electronico, edad, pais, ciudad) 
VALUES (1, 'Juan', 'Perez', 'juan.perez@example.com', 25, 'Estados Unidos', 'Houston');

INSERT INTO Clientes (nombre, apellido, correo_electronico, edad, pais, ciudad)
VALUES ('María', 'Gómez', 'maria.gomez@example.com', 30, 'España', 'Madrid');


SELECT * FROM Clientes;
SELECT * FROM Clientes WHERE cliente_id = 1;
SELECT DISTINCT pais FROM Clientes;
SELECT COUNT(*) FROM Clientes;
SELECT MAX(edad) FROM Clientes;
SELECT nombre, apellido FROM Clientes ORDER BY apellido;
SELECT ciudad, COUNT(*) AS cantidad_clientes FROM Clientes GROUP BY ciudad HAVING COUNT(*) > 5;
SELECT * FROM Clientes LIMIT 10 OFFSET 20;

UPDATE Clientes SET correo_electronico = 'sheldon.maiz@updated.com' WHERE cliente_id = 1;


DELETE FROM Clientes WHERE cliente_id = 1;



-- Para mantener las cosas organizadas, usamos claves primarias y claves foráneas. Una clave primaria es un ID único para cada fila, como un ID de cliente. Las claves foráneas vinculan tablas, creando relaciones.


CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_pedido DATE,
    total DECIMAL (10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (cliente_id, nombre, apellido, correo_electronico, edad, pais, ciudad)
VALUES (3, 'Carlos', 'González', 'carlos.gonzalez@example.com', 40, 'México', 'Ciudad de México');
INSERT INTO Clientes (cliente_id, nombre, apellido, correo_electronico, edad, pais, ciudad)
VALUES (4, 'Ana', 'Martínez', 'ana.martinez@example.com', 35, 'Argentina', 'Buenos Aires');


-- Insertar datos en la tabla Pedidos
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (1, '2024-12-28', 85.75);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (2, '2024-12-29', 210.00);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (3, '2024-12-29', 55.30);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (1, '2024-12-30', 120.90);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (4, '2024-12-30', 35.60);




