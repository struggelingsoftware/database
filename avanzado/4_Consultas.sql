1.  Selecciona solo las columnas necesarias:

Evita usar SELECT * si solo necesitas algunas columnas.

Ejemplo:

SQL

-- Ineficiente:
SELECT * FROM Productos; 

-- Eficiente:
SELECT nombre_producto, precio FROM Productos;
2. Filtra los datos con WHERE de forma eficiente:

Usa índices en las columnas que utilizas en las cláusulas WHERE.
Si filtras por rangos, usa BETWEEN en lugar de múltiples condiciones AND.
Ejemplo:

SQL

-- Ineficiente:
SELECT * FROM Pedidos WHERE fecha_pedido > '2024-12-01' AND fecha_pedido < '2024-12-31';

-- Eficiente (con índice en fecha_pedido):
SELECT * FROM Pedidos WHERE fecha_pedido BETWEEN '2024-12-01' AND '2024-12-31';
3. Optimiza el uso de JOIN:

Usa el tipo de JOIN adecuado (INNER JOIN, LEFT JOIN, etc.).
Une las tablas en el orden correcto, empezando por la tabla con menos filas.
Ejemplo:

SQL

-- Podría ser ineficiente si DetallesPedido tiene muchas más filas que Clientes:
SELECT c.nombre, dp.cantidad 
FROM Clientes c
INNER JOIN DetallesPedido dp ON c.cliente_id = (SELECT cliente_id FROM Pedidos WHERE pedido_id = dp.pedido_id);

-- Más eficiente:
SELECT c.nombre, dp.cantidad
FROM DetallesPedido dp
INNER JOIN Pedidos p ON dp.pedido_id = p.pedido_id
INNER JOIN Clientes c ON p.cliente_id = c.cliente_id;
4.  Usa subconsultas solo cuando sea necesario:

En algunos casos, las subconsultas pueden ser menos eficientes que las uniones (JOIN).

Ejemplo:

SQL

-- Ineficiente:
SELECT nombre_producto 
FROM Productos 
WHERE producto_id IN (SELECT producto_id FROM DetallesPedido WHERE cantidad > 2);

-- Eficiente:
SELECT p.nombre_producto
FROM Productos p
INNER JOIN DetallesPedido dp ON p.producto_id = dp.producto_id
WHERE dp.cantidad > 2;
5.  Limita el uso de funciones en las cláusulas WHERE:

Aplicar funciones a columnas en la cláusula WHERE puede impedir que se usen los índices.

Ejemplo:

SQL

-- Ineficiente:
SELECT * FROM Clientes WHERE UPPER(nombre) = 'JUAN';

-- Eficiente:
SELECT * FROM Clientes WHERE nombre = 'Juan'; 