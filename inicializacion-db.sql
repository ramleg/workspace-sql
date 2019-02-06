--- ESTRUCTURAS DE DATOS PARA MODELO SIMPLIFICADO DE "Alumno inscriptos en varios cursos de una carrera" ----

drop table inscripciones_curso;
drop table inscripciones_carrera;
drop table curso;
drop table carrera;
drop table alumno;
drop table persona;


CREATE TABLE persona (
    identificador  integer PRIMARY KEY NOT NULL,
    tipodoc        char(5) NOT NULL,
    documento 	    bigint NOT NULL,    
    nombre       varchar(40) NOT NULL,
    apellido       varchar(40) NOT NULL,
    fechanac		date NOT NULL
);


CREATE TABLE alumno (
    identificador  integer PRIMARY KEY NOT NULL,
    idpersona	    integer REFERENCES persona (identificador) UNIQUE,
    legajo 	    integer NOT NULL
);


   
CREATE TABLE carrera (
    identificador  integer PRIMARY KEY NOT NULL,
    nombre       varchar(40) NOT NULL,
    descripcion      varchar(250),
    fechadesde		date NOT NULL,
    fechahasta 	date
);

    

CREATE TABLE curso (
    identificador  integer PRIMARY KEY NOT NULL,
    idcarrera 		integer REFERENCES carrera (identificador),
    nombre       varchar(40) NOT NULL,
    descripcion      varchar(250),
    cupomaximo 	smallint NOT NULL,
    anio			smallint NOT NULL    
);


CREATE TABLE inscripciones_carrera(
    idalumno 		integer REFERENCES alumno (identificador) NOT NULL,
    idcarrera		integer REFERENCES carrera (identificador) NOT NULL,
    fechainscripcion	date NOT NULL
);

CREATE TABLE inscripciones_curso(
    idalumno 		integer REFERENCES alumno (identificador) NOT NULL,
    idcurso 		integer REFERENCES curso (identificador) NOT NULL,
    fechainscripcion	date NOT NULL
);


----- Insert de datos iniciales persona
   INSERT INTO persona VALUES
    (1,'DNI', 31565839, 'Florencia', 'Maneiro', '1985-06-28');
   INSERT INTO persona VALUES
    (2,'DNI', 31000123, 'Patricia', 'Brumatti', '1985-01-13');
    INSERT INTO persona VALUES
    (3,'DNI', 20945422, 'Diego', 'Menendez', '1982-04-10');   
    INSERT INTO persona VALUES
    (4,'DNI', 30999281, 'Franzo', 'Perez', '1986-02-05');
    INSERT INTO persona VALUES
    (5,'DNI', 24112872, 'Leandro', 'Garcia', '1988-01-03');
    
----- Insert de datos iniciales alumno
   INSERT INTO alumno VALUES
    (1,3, 98734);
   INSERT INTO alumno VALUES
    (2,4, 09213);
   INSERT INTO alumno VALUES
    (3,1, 35839);
   INSERT INTO alumno VALUES
    (4,5, 36299);
   INSERT INTO alumno VALUES
    (5,2, 11009);
    
----- Insert de datos iniciales carrera

   INSERT INTO carrera VALUES
    (1,'Ingenieria en sistema de información', 'Carrera a fines a programación y desarrollo de software en general','1960-01-01');

   INSERT INTO carrera VALUES
    (2,'Ingenieria civil', 'Carrera a fines a construcción, planificación y desarrollo de obras de desarrollo urbano','1980-01-01');


----- Insert de datos iniciales curso


   INSERT INTO curso VALUES
    (1,1,'Análisis matemático', 'Curso sobre el desarrollo avanzado de matemáticas', 5,2018);
    
  INSERT INTO curso VALUES
    (2,1,'Diseño de sistemas', 'Curso sobre diseño de componentes de sistemas de software', 3,2018);

  INSERT INTO curso VALUES
    (3,1,'Java', 'Curso sobre el lenguaje de programación JAVA', 4,2018);

  INSERT INTO curso VALUES
    (4,1,'Base de datos-SQL', 'Curso sobre tipos de base de datos y consultas sql', 10,2018);

  INSERT INTO curso VALUES
    (5,2,'Fisica básica', 'Curso sobre fundamentos base de física', 5,2018);

  INSERT INTO curso VALUES
    (6,2,'Dibujo', 'Curso sobre dibujo de planos', 10,2018);
    

----- Insert de datos iniciales inscripciones

INSERT INTO inscripciones_carrera VALUES
(1,1,'2000-01-01');
INSERT INTO inscripciones_carrera VALUES
(2,1,'2003-01-01');
INSERT INTO inscripciones_carrera VALUES
(3,1,'2004-01-01');
INSERT INTO inscripciones_carrera VALUES
(4,1,'2001-01-01');

INSERT INTO inscripciones_carrera VALUES
(5,2,'2000-01-01');
INSERT INTO inscripciones_carrera VALUES
(4,2,'2000-01-01');


INSERT INTO inscripciones_curso VALUES
(1,1,'2002-01-01');
INSERT INTO inscripciones_curso VALUES
(1,2,'2006-01-01');
INSERT INTO inscripciones_curso VALUES
(1,3,'2002-01-01');
INSERT INTO inscripciones_curso VALUES
(2,1,'2004-01-01');
INSERT INTO inscripciones_curso VALUES
(2,3,'2002-01-01');
INSERT INTO inscripciones_curso VALUES
(2,4,'2004-01-01');
INSERT INTO inscripciones_curso VALUES
(3,1,'2010-01-01');
INSERT INTO inscripciones_curso VALUES
(3,3,'2010-01-01');
INSERT INTO inscripciones_curso VALUES
(4,1,'2010-01-01');
INSERT INTO inscripciones_curso VALUES
(4,3,'2010-01-01');
INSERT INTO inscripciones_curso VALUES
(5,3,'2010-01-01');

INSERT INTO inscripciones_curso VALUES
(4,3,'2010-01-01');
INSERT INTO inscripciones_curso VALUES
(5,4,'2011-01-01');
INSERT INTO inscripciones_curso VALUES
(4,4,'2011-01-01');
INSERT INTO inscripciones_curso VALUES
(2,5,'2011-01-01');
INSERT INTO inscripciones_curso VALUES
(2,6,'2011-01-01');

