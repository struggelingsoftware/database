-- 1. Primera Forma Normal (1FN):
-- Elimina los grupos repetidos
-- Cada tabla debe tener una clave primaria


-- Crear la tabla Empleados (no en 1NF)
CREATE TABLE Empleados (
    ID_Empleado INT,
    Nombre VARCHAR(255),
    Departamento VARCHAR(255),
    Habilidad VARCHAR(255)
);

-- Insertar datos en la tabla Empleados (no en 1NF)
INSERT INTO Empleados (ID_Empleado, Nombre, Departamento, Habilidad) VALUES
    (1, 'Juan Pérez', 'IT', 'Java'),
    (1, 'Juan Pérez', 'IT', 'Python'),
    (1, 'Juan Pérez', 'IT', 'SQL'),
    (2, 'Ana García', 'Marketing', 'Diseño gráfico'),
    (2, 'Ana García', 'Marketing', 'SEO'),
    (3, 'Luis López', 'Ventas', 'Comunicación'),
    (3, 'Luis López', 'Ventas', 'Negociación');



-- Crear la tabla Empleados (en 1NF)
CREATE TABLE Empleados1NF (
    ID_Empleado INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Departamento VARCHAR(255)
);

-- Crear la tabla Habilidades (en 1NF)
CREATE TABLE Habilidades1NF (
    ID_Habilidad INT PRIMARY KEY,
    Habilidad VARCHAR(255)
);

-- Crear la tabla EmpleadosHabilidades (en 1NF)
CREATE TABLE EmpleadosHabilidades1NF (
    ID_Empleado INT,
    ID_Habilidad INT,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Habilidad) REFERENCES Habilidades(ID_Habilidad)
);

-- Insertar datos en la tabla Empleados (en 1NF)
INSERT INTO Empleados1NF (ID_Empleado, Nombre, Departamento) VALUES
    (1, 'Juan Pérez', 'IT'),
    (2, 'Ana García', 'Marketing'),
    (3, 'Luis López', 'Ventas');

-- Insertar datos en la tabla Habilidades (en 1NF)
INSERT INTO Habilidades1NF (ID_Habilidad, Habilidad) VALUES
    (1, 'Java'),
    (2, 'Python'),
    (3, 'SQL'),
    (4, 'Diseño gráfico'),
    (5, 'SEO'),
    (6, 'Comunicación'),
    (7, 'Negociación');

-- Insertar datos en la tabla EmpleadosHabilidades (en 1NF)
INSERT INTO EmpleadosHabilidades1NF (ID_Empleado, ID_Habilidad) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 6),
    (3, 7);