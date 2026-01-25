--CREATE DATABASE recetario;
--\c recetario;

--VARIABLES INDEPENDIETES
CREATE TABLE recetas (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE,
    tiempo_preparacion INT NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    notas TEXT,
    imagen_url VARCHAR(255)
);

CREATE TABLE ingredientes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE unidades (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE
);

--VARIABLES DEPENDIENTES
CREATE TABLE preparacion (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY key,
    receta_id INT NOT NULL REFERENCES recetas(id) ON DELETE CASCADE,
    numero_paso INT NOT NULL,
    descripcion TEXT NOT NULL
);

CREATE TABLE receta_ingredientes (
    receta_id INT REFERENCES recetas(id) ON DELETE CASCADE,
    ingrediente_id INT REFERENCES ingredientes(id) ON DELETE RESTRICT, 
    unidad_id INT REFERENCES unidades(id) ON DELETE RESTRICT, 
    cantidad NUMERIC(10,2) NOT NULL,
    notas TEXT,
    orden INT DEFAULT 0,
    PRIMARY KEY (receta_id, ingrediente_id)
);

INSERT INTO unidades (nombre) VALUES
('gramos'),
('kilogramos'),
('mililitros'),
('litros'),
('unidades'),
('tazas'),
('cucharadas'),
('cucharaditas'),
('puñado');

