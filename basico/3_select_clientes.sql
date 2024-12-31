SELECT * FROM Clientes;
SELECT * FROM Clientes WHERE cliente_id = 1;
SELECT DISTINCT pais FROM Clientes;
SELECT COUNT(*) FROM Clientes;
SELECT MAX(edad) FROM Clientes;
SELECT nombre, apellido FROM Clientes ORDER BY apellido;
SELECT ciudad, COUNT(*) AS cantidad_clientes FROM Clientes GROUP BY ciudad HAVING COUNT(*) > 5;
SELECT * FROM Clientes LIMIT 10 OFFSET 20;