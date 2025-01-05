SELECT c.nombre, c.apellido, p.nombre_producto, dp.cantidad
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id
INNER JOIN DetallesPedido dp ON o.pedido_id = dp.pedido_id
INNER JOIN Productos p ON dp.producto_id = p.producto_id
WHERE c.cliente_id = 1;

EXPLAIN SELECT c.nombre, c.apellido, p.nombre_producto, dp.cantidad
FROM Clientes c
INNER JOIN Pedidos o ON c.cliente_id = o.cliente_id
INNER JOIN DetallesPedido dp ON o.pedido_id = dp.pedido_id
INNER JOIN Productos p ON dp.producto_id = p.producto_id
WHERE c.cliente_id = 1;


-- no optimo
SELECT *
FROM Clientes c, Pedidos p, DetallesPedido dp, Productos pr
WHERE c.cliente_id = p.cliente_id 
  AND p.pedido_id = dp.pedido_id
  AND dp.producto_id = pr.producto_id
  AND pr.nombre_producto = 'Laptop' 
  AND c.nombre LIKE '%Juan%';

-- optimo
  SELECT c.nombre, c.apellido, pr.nombre_producto, dp.cantidad
FROM Clientes c
INNER JOIN Pedidos p ON c.cliente_id = p.cliente_id
INNER JOIN DetallesPedido dp ON p.pedido_id = dp.pedido_id
INNER JOIN Productos pr ON dp.producto_id = pr.producto_id
WHERE pr.nombre_producto = 'Laptop' 
  AND c.nombre LIKE 'Juan%';