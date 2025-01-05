

-- Ejemplo 1:  Índice para la columna apellido en la tabla Clientes

CREATE INDEX idx_cliente_apellido ON Clientes (apellido);
SELECT * FROM Clientes WHERE apellido = 'Pérez';
SELECT * FROM Clientes ORDER BY apellido;

-- Ejemplo 2: Índice compuesto para fecha_pedido y total en la tabla Pedidos

CREATE INDEX idx_pedido_fecha_total ON Pedidos (fecha_pedido, total);

SELECT * 
FROM Pedidos 
WHERE fecha_pedido BETWEEN '2024-12-01' AND '2024-12-31' 
  AND total > 100;

-- Restricciones CHECK
-- Ejemplo 1: Limitar la categoría de un producto
ALTER TABLE Productos
ADD CONSTRAINT categoria_valida CHECK (categoria IN ('Electrónica', 'Ropa', 'Hogar'));

-- Ejemplo 2: Validar el formato de un número de teléfono
ALTER TABLE Clientes
ADD COLUMN telefono VARCHAR(20),
ADD CONSTRAINT telefono_valido CHECK (telefono REGEXP '^[0-9]{3}-[0-9]{3}-[0-9]{4}$');

-- Ejemplo 3:  Asegurar que la cantidad en DetallesPedido sea mayor que cero
ALTER TABLE DetallesPedido
ADD CONSTRAINT cantidad_positiva CHECK (cantidad > 0);

-- Más ejemplos de restricciones CHECK:
ALTER TABLE Clientes ADD CONSTRAINT unique_email CHECK (email UNIQUE);
ALTER TABLE products ADD CONSTRAINT price_range CHECK (price BETWEEN 0 AND 1000);

-- Restricciones
ALTER TABLE Productos 
MODIFY COLUMN nombre_producto VARCHAR(255) NOT NULL;

ALTER TABLE Clientes
ADD COLUMN email VARCHAR(255) UNIQUE;

-- Crear la tabla Clientes con restricciones
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    CONSTRAINT telefono_valido CHECK (telefono REGEXP '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'),
    CONSTRAINT mayor_de_edad CHECK (TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) >= 18)
);

-- Crear la tabla Productos con restricciones
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(100),
    CONSTRAINT precio_positivo CHECK (precio > 0),
    CONSTRAINT categoria_valida CHECK (categoria IN ('Electrónica', 'Ropa', 'Hogar'))
);