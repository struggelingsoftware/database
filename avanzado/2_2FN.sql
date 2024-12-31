-- 2. Segunda Forma Normal (2FN):
-- Cumple con la 1FN.
-- Elimina las dependencias parciales



-- Crear la tabla PedidosProductos (no en 2NF)
CREATE TABLE PedidosProductos (
    ID_Pedido INT,
    ID_Producto VARCHAR(255),
    Nombre_Producto VARCHAR(255),
    Precio_Unitario DECIMAL(10,2),
    Cantidad INT,
    Fecha_Pedido DATE,
    PRIMARY KEY (ID_Pedido, ID_Producto)
);

-- Insertar datos en la tabla PedidosProductos (no en 2NF)
INSERT INTO PedidosProductos (ID_Pedido, ID_Producto, Nombre_Producto, Precio_Unitario, Cantidad, Fecha_Pedido) VALUES
    (1, 'A1', 'Laptop', 1200, 1, '2024-12-28'),
    (1, 'B2', 'Mouse', 25, 2, '2024-12-28'),
    (2, 'A1', 'Laptop', 1200, 1, '2024-12-29');


-- 
CREATE TABLE Pedidos (
    ID_Pedido INT PRIMARY KEY,
    Fecha_Pedido DATE
);

CREATE TABLE Productos (
    ID_Producto VARCHAR(255) PRIMARY KEY,
    Nombre_Producto VARCHAR(255),
    Precio_Unitario DECIMAL(10,2)
);

CREATE TABLE PedidosItems (
    ID_Pedido INT,
    ID_Producto VARCHAR(255),
    Cantidad INT,
    PRIMARY KEY (ID_Pedido, ID_Producto), -- Clave primaria compuesta
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);