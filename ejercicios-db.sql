----EJERCICIOS
-- SOLO ES REQUERIDO REALIZAR LOS EJERCICIOS DE COMPLEJIDAD BAJA, realizar los demas ejercicios serán puntos extras para la evaluación del examen.


------------------------------------------------------------------------
EJERCICIO 1 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todos los alumnos existentes, mostrar: TipoDoc, Documento, Nombre, Apellido, Legajo.


---

SELECT alumno.legajo, persona.nombre, persona.apellido, persona.tipodoc, persona.documento FROM public.alumno inner join persona on persona.identificador = alumno.idpersona
------------------------------------------------------------------------
EJERCICIO 2 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todas las carreras a la que un alumno esta inscripto, mostrar: 
Legajo, nombre, apellido, nombre carrera, fechainscripcioncarrera
--ordenado por legajo descendiente


--- 

select alumno.legajo, persona.nombre nombre_alumno, persona.apellido apellido_alumno, carrera.nombre nombre_carrera, inscripciones_carrera.fechainscripcion fecha_inscripcion
from inscripciones_carrera
inner join alumno on alumno.identificador = inscripciones_carrera.idalumno
inner join persona on persona.identificador = alumno.idpersona
inner join carrera on carrera.identificador = inscripciones_carrera.idcarrera
order by alumno.legajo desc
------------------------------------------------------------------------

EJERCICIO 3 - COMPLEJIDAD MEDIA: 
--Realizar una consulta para consultar la cantidad de inscriptos por curso, mostrando: nombre carrera, nombre curso, cantidad inscriptos, cupo máximo por curso


--- 

select carrera.nombre CARRERA, curso.nombre CURSO, count(*) INSCRIPTOS, curso.cupomaximo CUPO_MAX
from inscripciones_curso
inner join curso on curso.identificador = inscripciones_curso.idcurso
inner join carrera on carrera.identificador = curso.idcarrera
group by curso.nombre, carrera.nombre, curso.cupomaximo


------------------------------------------------------------------------
EJERCICIO 4 - COMPLEJIDAD ALTA: 
--Sobre la consulta anterior (copiar y pegarla y modificarla) modificar la sql para que la consulta retorne solo los cursos cuya cantidad de inscripciones 
--supera su cupo maximo


--- 

select * from 
(select carrera.nombre CARRERA, curso.nombre CURSO, count(*) INSCRIPTOS, curso.cupomaximo CUPO_MAX
from inscripciones_curso
inner join curso on curso.identificador = inscripciones_curso.idcurso
inner join carrera on carrera.identificador = curso.idcarrera
group by curso.nombre, carrera.nombre, curso.cupomaximo) as q
where q.inscriptos > q.cupo_max

------------------------------------------------------------------------
EJERCICIO 5 -  COMPLEJIDAD BAJA: 
-- actualizar todos las cursos que posean anio 2018 y cuyo cupo sea menor a 5, y actualizar el cupo de todos ellos a 10.


--- 

update curso
set cupomaximo = 10
where anio = 2018 and cupomaximo < 5

------------------------------------------------------------------------
EJERCICIO 6 -  COMPLEJIDAD ALTA: 
-- actualizar todas las fechas de inscripcion a cursados que posean el siguiente error: la fecha de inscripcion al cursado de un alumno es menor a la fecha de inscripcion a la carrera. La nueva fecha que debe tener es la fecha del dia. Se puede hacer en dos pasos, primero
-- realizando la consulta y luego realizando el update manual


--- 




------------------------------------------------------------------------
EJERCICIO 7 - COMPLEJIDAD BAJA:  
--INSERTAR un nuevo registro de alumno con tus datos personales, (hacer todos inserts que considera necesario)


--- 

INSERT INTO persona (identificador, tipodoc, documento, nombre, apellido, fechanac) VALUES (6, 'DNI', 29973740, 'Ramiro', 'Acoglanis', '1983-2-14');
INSERT INTO alumno (identificador, idpersona, legajo) VALUES (6, 6,5005);
INSERT INTO inscripciones_carrera (idalumno, idcarrera, fechainscripcion) VALUES (6,1,'2019-01-31');
INSERT INTO inscripciones_curso (idalumno, idcurso, fechainscripcion) VALUES (6,6,'2019-01-31');

------------------------------------------------------------------------
EJERCICIO 8 -  COMPLEJIDAD BAJA: 
-- si se desea comenzar a persistir de ahora en mas el dato de direccion de un alumno y considerando que este es un único cambio string de 200 caracteres.
-- Determine sobre que tabla seria mas conveniente persistir esta información y realizar la modificación de estructuras correspondientes.



ALTER TABLE persona ADD COLUMN direccion varchar(200);