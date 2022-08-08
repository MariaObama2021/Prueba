/*EJERCICIO 1*/

drop database if exists EJERCICIOS_A ;

CREATE database EJERCICIOS_A;

USE EJERCICIOS_A;

CREATE TABLE autor (
idAutor  INT PRIMARY KEY IDENTITY (1, 1),
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
FechaNacimiento DATETIME,
Descripcion VARCHAR (50) NOT NULL,);

INSERT INTO autor values ('maria','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('marta','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('victoria','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('clear','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('sandra','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('jacinta','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('charo','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('vicente','garcia','10/11/1995','ejercicio');
INSERT INTO autor values ('sandra','garcia','10/11/1995','ejercicio');

USE EJERCICIOS_A;

CREATE TABLE libroEstado (
idEstado INT PRIMARY KEY IDENTITY (1, 1),
nombreEstado VARCHAR(50) not null);

INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('pendiente');
INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('sin stock');
INSERT INTO libroEstado values ('sin stock');
INSERT INTO libroEstado values ('pendiente');
INSERT INTO libroEstado values ('cancelado');
INSERT INTO libroEstado values ('pendiente');
INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('sin stock');
INSERT INTO libroEstado values ('sin stock');
INSERT INTO libroEstado values ('pendiente');
INSERT INTO libroEstado values ('cancelado');
INSERT INTO libroEstado values ('pendiente');
INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('vendido');
INSERT INTO libroEstado values ('vendido');

USE EJERCICIOS_A;
CREATE TABLE libros (
LibroID INT PRIMARY KEY IDENTITY (1, 1),
Titulo VARCHAR(50),
AutorID INT  NOT NULL,
Editor  VARCHAR(50) not null,
FechaEdicion DATETIME,
Costo int,
EstadoId int NOT NULL,
Vendido   VARCHAR(15) CHECK( Vendido IN('SI','NO') ),
FOREIGN KEY (AutorID) references autor(idAutor),
FOREIGN KEY (EstadoId) references libroEstado(idEstado));


INSERT INTO libros values ('outlander',2,'S/M','10/01/2014',10,1,'SI');
INSERT INTO libros values ('SULIVAN',2,'S/M','10/10/2013',110,2,'SI');
INSERT INTO libros values ('POCAHONTAS',2,'S/M','10/10/2007',20,4,'SI');
INSERT INTO libros values ('SABRINA COSAS DE BRUJAS',3,'S/M','10/10/2014',50,5,'NO');
INSERT INTO libros values ('PIPI CALZAS LARGAS',3,'S/M','10/10/2017',90,2,'NO');
INSERT INTO libros values ('DRAGONES',5,'S/M','10/10/2019',30,1,'SI');
INSERT INTO libros values ('NOCHE DE BRUJAS',2,'S/M','10/10/2017',3,2,'SI');
INSERT INTO libros values ('SABRINA COSAS DE BRUJAS',3,'S/M','10/10/2014',50,5,'NO');
INSERT INTO libros values ('HASTA MAÑANA',3,'S/M','10/10/2010',90,2,'SI');
INSERT INTO libros values ('DRAGONES 2',5,'S/M','10/10/2019',3,1,'NO');
INSERT INTO libros values ('outlander 2',2,'S/M','10/10/2018',10,1,'NO');
INSERT INTO libros values ('BAMBI',2,'S/M','10/10/2015',110,2,'NO');
INSERT INTO libros values ('POCAHONTAS 2',2,'S/M','10/10/2017',20,4,'SI');
INSERT INTO libros values ('BRUJAS 4 ',3,'S/M','10/10/2020',50,5,'NO');
INSERT INTO libros values ('PIPI CALZAS LARGAS',3,'S/M','10/10/2019',90,2,'NO');
INSERT INTO libros values ('DRAGONES 3',5,'S/M','10/14/2019',3,1,'SI');
INSERT INTO libros values ('NOCHE DE BRUJAS 2',2,'S/M','10/10/2019',20,2,'SI');
INSERT INTO libros values ('SABRINA LA BRUJAS ',3,'S/M','10/10/2014',50,5,'NO');
INSERT INTO libros values ('HASTA MAÑANA',3,'S/M','10/10/2012',90,2,'SI');
INSERT INTO libros values ('DRAGONES',5,'S/M','10/10/2019',3,1,'NO');


/*RESULTADO EJERCICIO 1*/
SELECT TOP 20 L.LibroID, L.Titulo,L.costo as 'euros', A.nombre, A.apellido FROM libros L inner join autor A
ON L.AutorID = A.idAutor where L.costo > 12 ;

------------------------------------
USE EJERCICIOS_A;
CREATE TABLE Aplicacion (
IDPALICACION INT PRIMARY KEY IDENTITY (1, 1),
NOMBRE VARCHAR(50) NOT NULL,
FECHACREACION DATETIME,
CREADOR VARCHAR (50));

INSERT INTO Aplicacion values ('PRUEBA 1','01/01/2010','MARIA');
INSERT INTO Aplicacion values ('PRUEBA 2','02/02/2011','SANDRA');
INSERT INTO Aplicacion values ('PRUEBA 3','03/04/2012','MARTA');
INSERT INTO Aplicacion values ('PRUEBA 4','04/05/2013','MURCIA');
INSERT INTO Aplicacion values ('PRUEBA 5','10/09/2014','JESUS');

 
 USE EJERCICIOS_A;
CREATE TABLE EstadoAplicacion (
IdEstado INT PRIMARY KEY IDENTITY (1, 1),
Descripcion VARCHAR(50));

INSERT INTO EstadoAplicacion values ('vendido');
INSERT INTO EstadoAplicacion values ('pendiente');
INSERT INTO EstadoAplicacion values ('vendido');
INSERT INTO EstadoAplicacion values ('vendido');
INSERT INTO EstadoAplicacion values ('pendiente');


 USE EJERCICIOS_A;
CREATE TABLE HistoricoEstaosAplicacion (
IdHistoricoAplicacion INT PRIMARY KEY IDENTITY (1, 1),
IdAplicacion int not null,
IdEstado int NOT NULL,
FechaCambio  DATETIME,
FOREIGN KEY (IdAplicacion) references Aplicacion(IDPALICACION),
FOREIGN KEY (IdEstado) references EstadoAplicacion(IdEstado));

INSERT INTO HistoricoEstaosAplicacion values (1,2,'02/03/2010');
INSERT INTO HistoricoEstaosAplicacion values (2,3,'02/10/2011');
INSERT INTO HistoricoEstaosAplicacion values (3,5,'04/11/2012');
INSERT INTO HistoricoEstaosAplicacion values (4,1,'08/09/2013');
INSERT INTO HistoricoEstaosAplicacion values (5,3,'10/12/2014');

/*RESULTADO*/
SELECT  A.NOMBRE, E.Descripcion, H.FechaCambio FROM  HistoricoEstaosAplicacion H inner join  Aplicacion A
on H.IdAplicacion = A.IDPALICACION inner join EstadoAplicacion E on E.IdEstado = H.IdEstado
