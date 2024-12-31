-- Crear la tabla Estudiantes
CREATE TABLE Estudiantes (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    major VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departamentos(department_id)
);

-- Crear la tabla Cursos
CREATE TABLE Cursos (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    department_id INT,
    credits INT,
    FOREIGN KEY (department_id) REFERENCES Departamentos(department_id)
);

-- Crear la tabla Instructores
CREATE TABLE Instructores (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departamentos(department_id)
);

-- Crear la tabla Departamentos
CREATE TABLE Departamentos (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- Crear la tabla Inscripciones
CREATE TABLE Inscripciones (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(1, 1),
    FOREIGN KEY (student_id) REFERENCES Estudiantes(student_id),
    FOREIGN KEY (course_id) REFERENCES Cursos(course_id)
);


-- Insertar datos en la tabla Departamentos
INSERT INTO Departamentos (department_id, department_name) VALUES
    (1, 'Ciencias de la Computación'),
    (2, 'Matemáticas'),
    (3, 'Física'),
    (4, 'Biología');

-- Insertar datos en la tabla Estudiantes
INSERT INTO Estudiantes (student_id, first_name, last_name, email, major, department_id) VALUES
    (1, 'Sheldon', 'Maiz', 'sheldon.maiz@example.edu', 'Ciencias de la Computación', 1),
    (2, 'Amy', 'Farafoller', 'amy.farafoller@example.edu', 'Física', 3),
    (3, 'Ricardo', 'Torez', 'ricardo.torez@example.edu', 'Matemáticas', 2),
    (4, 'Ali', 'Zoukayya', 'ali.zoukayya@example.edu', 'Biología', 4),
    (5, 'Zackary', 'Jonhson', 'zackary.jonhson@example.edu', 'Ciencias de la Computación', 1);

-- Insertar datos en la tabla Cursos
INSERT INTO Cursos (course_id, course_name, department_id, credits) VALUES
    (101, 'Introducción a la Programación', 1, 3),
    (102, 'Cálculo I', 2, 4),
    (103, 'Mecánica Clásica', 3, 3),
    (104, 'Introducción a la Biología', 4, 3),
    (105, 'Estructuras de Datos y Algoritmos', 1, 4),
    (106, 'Álgebra Lineal', 2, 3),
    (107, 'Electromagnetismo', 3, 4);

-- Insertar datos en la tabla Instructores
INSERT INTO Instructores (instructor_id, first_name, last_name, email, department_id) VALUES
    (1, 'Leonard', 'Hofstadter', 'leonard.hofstadter@example.edu', 1),
    (2, 'Raj', 'Koothrappali', 'raj.koothrappali@example.edu', 3),
    (3, 'Bernadette', 'Rostenkowski', 'bernadette.rostenkowski@example.edu', 4),
    (4, 'Howard', 'Wolowitz', 'howard.wolowitz@example.edu', 2);

-- Insertar datos en la tabla Inscripciones
INSERT INTO Inscripciones (enrollment_id, student_id, course_id, grade) VALUES
    (1, 1, 101, 6.5),
    (2, 1, 105, 6),
    (3, 2, 103, 6.2),
    (4, 3, 102, 6),
    (5, 4, 104, 5.5),
    (6, 5, 101, 7),
    (7, 5, 105, 7);