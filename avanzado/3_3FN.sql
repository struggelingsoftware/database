-- 3. Tercera Forma Normal (3FN):
-- Cumple con la 2FN.
-- Elimina las dependencias transitivas

-- Crear la tabla Empleados (no en 3NF)
CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Departamento VARCHAR(255),
    Ubicación_Departamento VARCHAR(255)
);

-- Insertar datos en la tabla Empleados (no en 3NF)
INSERT INTO Empleados (ID_Empleado, Nombre, Departamento, Ubicación_Departamento) VALUES
    (1, 'Juan Pérez', 'IT', 'Edificio A, Piso 3'),
    (2, 'Ana García', 'Marketing', 'Edificio B, Piso 1'),
    (3, 'Luis López', 'IT', 'Edificio A, Piso 3');

--

-- Crear la tabla Empleados (en 3NF)
CREATE TABLE Empleados_3NF (
    ID_Empleado INT PRIMARY KEY,
    Nombre VARCHAR(255),
    ID_Departamento INT,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamentos(ID_Departamento)
);

-- Crear la tabla Departamentos (en 3NF)
CREATE TABLE Departamentos (
    ID_Departamento INT PRIMARY KEY,
    Departamento VARCHAR(255),
    Ubicación_Departamento VARCHAR(255)
);

-- Insertar datos en la tabla Departamentos (en 3NF)
INSERT INTO Departamentos (ID_Departamento, Departamento, Ubicación_Departamento) VALUES
    (1, 'IT', 'Edificio A, Piso 3'),
    (2, 'Marketing', 'Edificio B, Piso 1');

-- Insertar datos en la tabla Empleados_3NF (en 3NF)
INSERT INTO Empleados_3NF (ID_Empleado, Nombre, ID_Departamento) VALUES
    (1, 'Juan Pérez', 1),
    (2, 'Ana García', 2),
    (3, 'Luis López', 1);

