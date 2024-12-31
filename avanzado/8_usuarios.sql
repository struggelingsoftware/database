CREATE USER 'usuario_cliente'@'localhost' IDENTIFIED BY 'contraseña_cliente';

CREATE ROLE rol_servicio_cliente;

GRANT SELECT, UPDATE ON Clientes TO rol_servicio_cliente;
GRANT INSERT ON Pedidos TO rol_servicio_cliente;
GRANT SELECT ON Productos TO rol_servicio_cliente;

GRANT rol_servicio_cliente TO 'usuario_cliente'@'localhost';

SELECT * FROM Clientes; -- Debería mostrar los datos de los clientes
UPDATE Clientes SET telefono = '123-456-7890' WHERE cliente_id = 1; -- Debería actualizar el teléfono del cliente 1
DELETE FROM Clientes WHERE cliente_id = 1; -- Debería generar un error, ya que el rol no tiene permiso para eliminar clientes


CREATE USER 'usuario_remoto'@'%' IDENTIFIED BY 'contraseña_remota';

GRANT ALL PRIVILEGES ON *.* TO 'usuario_remoto'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;


GRANT rol_servicio_cliente TO 'usuario_remoto'@'%';
FLUSH PRIVILEGES;



-- Habilitar conexiones remotas en my.cnf/my.ini
-- bind-address = 0.0.0.0