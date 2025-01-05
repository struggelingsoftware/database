

-- Insertar datos en la tabla Pedidos
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (1, '2024-12-28', 85.75);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (2, '2024-12-29', 210.00);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (3, '2024-12-29', 55.30);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (1, '2024-12-30', 120.90);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (4, '2024-12-30', 35.60);
-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nombre, apellido) VALUES ('Ana', 'García');
INSERT INTO Clientes (nombre, apellido) VALUES ('Luis', 'Martínez');
INSERT INTO Clientes (nombre, apellido) VALUES ('Sofía', 'Rodríguez');
INSERT INTO Clientes (nombre, apellido) VALUES ('Carlos', 'López');
INSERT INTO Clientes (nombre, apellido) VALUES ('Laura', 'Fernández');



-- INNER JOIN
SELECT c.nombre, c.apellido, o.pedido_id 
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id;

-- LEFT JOIN
SELECT c.nombre, c.apellido, o.pedido_id 
FROM Clientes c
LEFT JOIN Pedidos o ON c.cliente_id = o.cliente_id;

-- RIGHT JOIN
SELECT c.nombre, c.apellido, o.pedido_id 
FROM Clientes c
RIGHT JOIN Pedidos o ON c.cliente_id = o.cliente_id;

-- Obtener información del cliente, el pedido y los productos incluidos
SELECT c.nombre, c.apellido, o.pedido_id, o.fecha_pedido, p.nombre_producto, dp.cantidad
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id
INNER JOIN DetallesPedido dp ON o.pedido_id = dp.pedido_id
INNER JOIN Productos p ON dp.producto_id = p.producto_id;


CREATE TABLE DetallesPedido (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

CREATE TABLE Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    categoria VARCHAR(100)
);

INSERT INTO Clientes (cliente_id, nombre, apellido) VALUES (1, 'Juan', 'Pérez');
INSERT INTO Clientes (cliente_id, nombre, apellido) VALUES (2, 'María', 'Gómez');
INSERT INTO Clientes (cliente_id, nombre, apellido) VALUES (3, 'Pedro', 'Sánchez');
INSERT INTO Clientes (cliente_id, nombre, apellido) VALUES (4, 'Ana', 'García');
INSERT INTO Clientes (cliente_id, nombre, apellido) VALUES (5, 'Luis', 'Martínez');

INSERT INTO Productos (producto_id, nombre_producto, descripcion, precio, categoria) VALUES (10, 'Laptop', 'Laptop de alta gama con procesador i7', 1200.00, 'Electrónica');
INSERT INTO Productos (producto_id, nombre_producto, descripcion, precio, categoria) VALUES (11, 'Tablet', 'Tablet con pantalla de 10 pulgadas', 300.00, 'Electrónica');
INSERT INTO Productos (producto_id, nombre_producto, descripcion, precio, categoria) VALUES (12, 'Mouse', 'Mouse inalámbrico', 25.00, 'Electrónica');
INSERT INTO Productos (producto_id, nombre_producto, descripcion, precio, categoria) VALUES (13, 'Teclado', 'Teclado mecánico', 75.00, 'Electrónica');


INSERT INTO Pedidos (pedido_id, cliente_id, fecha_pedido, total) VALUES (1, 1, '2024-12-28', 85.75);
INSERT INTO Pedidos (pedido_id, cliente_id, fecha_pedido, total) VALUES (2, 2, '2024-12-29', 210.00);
INSERT INTO Pedidos (pedido_id, cliente_id, fecha_pedido, total) VALUES (3, 1, '2024-12-29', 55.30);
INSERT INTO Pedidos (pedido_id, cliente_id, fecha_pedido, total) VALUES (4, 3, '2024-12-30', 120.90);
INSERT INTO Pedidos (pedido_id, cliente_id, fecha_pedido, total) VALUES (5, 4, '2024-12-30', 35.60);


INSERT INTO DetallesPedido (detalle_id, pedido_id, producto_id, cantidad, precio_unitario) VALUES (1, 1, 10, 2, 15.50);
INSERT INTO DetallesPedido (detalle_id, pedido_id, producto_id, cantidad, precio_unitario) VALUES (2, 1, 12, 1, 20.00);
INSERT INTO DetallesPedido (detalle_id, pedido_id, producto_id, cantidad, precio_unitario) VALUES (3, 2, 11, 3, 10.00);
INSERT INTO DetallesPedido (detalle_id, pedido_id, producto_id, cantidad, precio_unitario) VALUES (4, 3, 10, 1, 15.50);
INSERT INTO DetallesPedido (detalle_id, pedido_id, producto_id, cantidad, precio_unitario) VALUES (5, 3, 13, 2, 5.75);




-- Ejemplo 1: Mostrar los clientes que realizaron pedidos en diciembre de 2024 y el total de cada pedido.

SELECT c.nombre, c.apellido, o.pedido_id, o.total
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id
WHERE o.fecha_pedido >= '2024-12-01' AND o.fecha_pedido <= '2024-12-31';



-- Ejemplo 2: Mostrar los clientes que compraron el producto con producto_id 10 (Laptop) y la cantidad que compraron.

SELECT c.nombre, c.apellido, dp.cantidad
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id
INNER JOIN DetallesPedido dp ON o.pedido_id = dp.pedido_id
WHERE dp.producto_id = 10;

-- Ejemplo 3: Mostrar los pedidos con un total mayor a 100.00 y el nombre del cliente que lo realizó.

SELECT c.nombre, c.apellido, o.pedido_id, o.total
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id
WHERE o.total > 100.00;

-- Ejemplo 4: Mostrar los clientes que hayan comprado al menos 2 unidades del producto con producto_id 13 (Teclado).
SELECT c.nombre, c.apellido, dp.cantidad
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id
INNER JOIN DetallesPedido dp ON o.pedido_id = dp.pedido_id
WHERE dp.producto_id = 13 AND dp.cantidad >= 2;







