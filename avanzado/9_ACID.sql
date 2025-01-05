-- Atomicidad: La transacción se ejecuta como una unidad indivisible. Todas las operaciones de la transacción se realizan o ninguna se realiza.
-- Consistencia: La transacción debe mantener la integridad de la base de datos, es decir, dejarla en un estado válido.
-- Aislamiento: Las transacciones concurrentes no deben interferir entre sí. Cada transacción se ejecuta como si fuera la única en el sistema.
-- Durabilidad: Los cambios realizados por una transacción confirmada son permanentes, incluso en caso de fallos del sistema.


-- Iniciar la transacción
START TRANSACTION;

-- Debitar 200 de la cuenta 1
UPDATE Cuentas SET saldo = saldo - 200 WHERE cuenta_id = 1;

-- Acreditar 200 en la cuenta 2
UPDATE Cuentas SET saldo = saldo + 200 WHERE cuenta_id = 2;

-- Confirmar la transacción
COMMIT;