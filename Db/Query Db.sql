--CREATE DATABASE GESTOR_SALUD;
--USE GESTOR_SALUD

--DROP TABLE IF EXISTS TM_USUARIOS
--CREATE TABLE TM_USUARIOS(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--NOMBRE VARCHAR(100) NOT NULL,
--PASSWORD VARCHAR(200) NOT NULL,
--EMAIL VARCHAR(100) NOT NULL,
--ULTIMA_MODIFICACION DATETIME DEFAULT GETDATE()
--);

--DROP TABLE IF EXISTS TR_TIPOS_DOCUMENTO
--CREATE TABLE TR_TIPOS_DOCUMENTO(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--CODIGO VARCHAR(50) NOT NULL,
--DESCRIPCION VARCHAR(100) NOT NULL
--);

--INSERT INTO TR_TIPOS_DOCUMENTO (CODIGO, DESCRIPCION)
--VALUES
--('CC', 'C�dula de ciudadan�a'),
--('TI', 'Tarjeta de identidad'),
--('CE', 'C�dula extrangera')

--DROP TABLE IF EXISTS TR_GENEROS
--CREATE TABLE TR_GENEROS(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--DESCRIPCION VARCHAR(50)
--)

--INSERT INTO TR_GENEROS (DESCRIPCION)
--VALUES
--('Masculino'), ('Femenino')

--DROP TABLE IF EXISTS TM_PERSONAS
--CREATE TABLE TM_PERSONAS(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--PRIMER_NOMBRE VARCHAR(50),
--SEGUNDO_NOMBRE VARCHAR(50),
--PRIMER_APELLIDO VARCHAR(50),
--SEGUNDO_APELLIDO VARCHAR(50),
--NUMERO_DOCUMENTO VARCHAR(50),
--EMAIL VARCHAR(100),
--CELULAR VARCHAR(15),
--EDAD INT,
--ULTIMA_MODIFICACION DATETIME DEFAULT GETDATE(),
--ESTADO BIT,

--ID_TIPO_DOCUMENTO INT NOT NULL,
--ID_GENERO INT,
--ID_USUARIO INT

--CONSTRAINT FK_PERSONAS_TIPO_DOCUMENTO
--FOREIGN KEY (ID_TIPO_DOCUMENTO) REFERENCES TR_TIPOS_DOCUMENTO(ID),

--CONSTRAINT FK_PERSONAS_GENERO
--FOREIGN KEY (ID_GENERO) REFERENCES TR_GENEROS(ID),

--CONSTRAINT FK_PERSONAS_USUARIO
--FOREIGN KEY (ID_USUARIO) REFERENCES TM_USUARIOS(ID)
--);


--DROP TABLE IF EXISTS TP_ENFERMEDADES
--CREATE TABLE TP_ENFERMEDADES(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--DESCRIPCION VARCHAR(200)
--);

--INSERT INTO TP_ENFERMEDADES(DESCRIPCION)
--VALUES 
--('Absceso dental'), 
--('Accidente cerebro vascular ACV'), 
--('Alcoholismo'), 
--('Anemia'), 
--('Anemia de Fanconi'), 
--('Anemia ferrop�nica'), 
--('Anemia hemol�tica'), 
--('Anorexia'), 
--('Apnea del sue�o'), 
--('Asma'), 
--('Aterosclerosis'), 
--('Bronquiectasias'), 
--('Bronquitis'), 
--('Brucelosis'), 
--('Bulimia'), 
--('Calambres musculares'), 
--('C�lculos de ri��n'), 
--('Callos y callosidades'), 
--('Cefaleas'), 
--('Cefaleas de tensi�n'), 
--('Ci�tica'), 
--('Colitis ulcerosa'), 
--('Colon irritable'), 
--('Coma et�lico'), 
--('Congelaci�n'), 
--('Conmoci�n cerebral'), 
--('Degeneraci�n macular del ojo'), 
--('Depresi�n'), 
--('Deshidrataci�n'), 
--('Desmayos y mareos'), 
--('Diarrea'), 
--('Diarrea del viajero'),
--('Dolor de espalda'),
--('Dolor de garganta'), 
--('Dolor de o�do'), 
--('Embarazo en la adolescencia'),
--('Enfermedad de Crohn'), 
--('Enfermedad de Parkinson'), 
--('Estre�imiento'),
--('Fisura anal'), 
--('Gangli�n'), 
--('Glositis'), 
--('Gota'), 
--('Hemorroides'), 
--('Hernia discal'), 
--('H�gado graso'), 
--('Hipertensi�n arterial HTA'), 
--('Hipertensi�n intracraneal idiop�tica'), 
--('Hipocondr�a'), 
--('Hipotensi�n'),
--('Hongos'), 
--('Hongos en las u�as'), 
--('Incontinencia fecal'), 
--('Juanetes'), 
--('La gripe'), 
--('Laberintitis'), 
--('Labios agrietados'),
--('Laringitis'), 
--('Latigazo cervical'), 
--('Lengua geogr�fica'), 
--('Lengua negra vellosa'), 
--('Litiasis renal'),
--('Mareo'),
--('Mastoiditis'), 
--('Medidas sanitarias en los viajes al extranjero'),
--('Migra�as y jaquecas'), 
--('Obesidad'), 
--('Orinar por la noche'), 
--('Par�lisis facial de Bell'),
--('Piel seca'), 
--('Preparaci�n de los viajes largos'),
--('Prevenci�n de las hemorroides'), 
--('Prozac�'),
--('Reflujo gastroesof�gico'), 
--('Resfriados'),
--('Ronquidos'), 
--('Rotura de t�mpano'), 
--('Sangrado nasal'), 
--('Sangrado rectal'), 
--('Sangre en el esputo'), 
--('Sangre en la orina'), 
--('S�ndrome de astenia cr�nica'), 
--('S�ndrome de piernas inquietas'),
--('S�ndrome hep�tico renal'),
--('S�ndrome nefr�tico'), 
--('Sinusitis'), 
--('Talasemia'), 
--('Tendinitis'), 
--('Tic en el p�rpado'), 
--('Tratamiento de las jaquecas'), 
--('Tratamiento del alcoholismo'), 
--('Varices'),
--('V�rtigo'), 
--('V�mitos de sangre');

--DROP TABLE IF EXISTS TR_ESTADOS_ENFERMEDADES
--CREATE TABLE TR_ESTADOS_ENFERMEDADES
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--DESCRIPCION VARCHAR(50)
--);

--INSERT INTO TR_ESTADOS_ENFERMEDADES(DESCRIPCION)
--VALUES
--('En curso'), ('Superada')


--DROP TABLE IF EXISTS TM_ENFERMEDADES_PERSONAS
--CREATE TABLE TM_ENFERMEDADES_PERSONAS
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--FECHA_DIAGNOSTICO DATETIME,
--ULTIMA_MODIFICACION DATETIME DEFAULT GETDATE(),
--ID_PERSONA INT,
--ID_ENFERMEDAD INT,
--ID_ESTADO INT,

--CONSTRAINT FK_PERSONA
--FOREIGN KEY (ID_PERSONA) REFERENCES TM_PERSONAS(ID),

--CONSTRAINT FK_ENFERMEDAD
--FOREIGN KEY (ID_ENFERMEDAD) REFERENCES TP_ENFERMEDADES(ID),

--CONSTRAINT FK_ESTADO
--FOREIGN KEY (ID_ESTADO) REFERENCES TR_ESTADOS_ENFERMEDADES(ID)
--)

--DROP TABLE IF EXISTS TR_ESTADOS_ACCIDENTES
--CREATE TABLE TR_ESTADOS_ACCIDENTES
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--DESCRIPCION VARCHAR(50)
--);

--INSERT INTO TR_ESTADOS_ACCIDENTES(DESCRIPCION)
--VALUES
--('En curso'), ('Superada')

--DROP TABLE IF EXISTS TM_ACCIDENTES_PERSONAS
--CREATE TABLE TM_ACCIDENTES_PERSONAS
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--DESCRIPCION VARCHAR(500),
--LUGAR VARCHAR(500),
--EN_TRATAMIENTO BIT,
--ID_PERSONA INT,
--ID_ESTADO INT,
--ULTIMA_MODIFICACION DATETIME DEFAULT GETDATE(),

--CONSTRAINT FK_PERSONAS
--FOREIGN KEY (ID_PERSONA) REFERENCES TM_PERSONAS(ID),

--CONSTRAINT FK_ESTADOS_ACCIDENTES
--FOREIGN KEY (ID_ESTADO) REFERENCES TR_ESTADOS_ACCIDENTES
--);

--DROP TABLE IF EXISTS TM_EXAMENES_PERSONAS
--CREATE TABLE TM_EXAMENES_PERSONAS
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--INFORMACION VARCHAR(MAX),
--FECHA_EXAMEN DATETIME,
--FECHA_RESULTADOS DATETIME,
--ULTIMA_MODIFIACION DATETIME DEFAULT GETDATE(),
--ID_PERSONA INT,

--CONSTRAINT FK_EXAMENES_PERSONA
--FOREIGN KEY (ID_PERSONA) REFERENCES TM_PERSONAS(ID)
--);


--DROP TABLE IF EXISTS TP_VACUNAS
--CREATE TABLE TP_VACUNAS
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--DESCRIPCION VARCHAR(200)
--);

--INSERT INTO TP_VACUNAS(DESCRIPCION)
--VALUES
--('Hepatitis B'),
--('Tuberculosis men�ngea'),
--('Poliomielitis'),
--('Difteria'),
--('Tosferina'),
--('T�tanos accidental y neonatal'),
--('Infecci�n por haemophilus influenzae tipo B (HIB)'),
--('Diarrea por rotavirus'),
--('Neumon�a, meningitis y otitis causadas por neumococo'),
--('Influenza'),
--('Sarampi�n'),
--('Parotiditis o paperas'),
--('Rubeola y s�ndrome de rubeola cong�nita'),
--('Fiebre amarilla'),
--('Hepatitis A'),
--('Infecci�n por virus del papiloma humano (VPH) y c�ncer de cuello uterino'),
--('Covid - 19')

--DROP TABLE IF EXISTS TM_VACUNAS_PERSONAS
--CREATE TABLE TM_VACUNAS_PERSONAS
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--FECHA DATETIME,
--ULTIMA_MODIFICACION DATETIME DEFAULT GETDATE(),
--ID_VACUNA INT,
--ID_PERSONA INT,

--CONSTRAINT FK_VACUNAS
--FOREIGN KEY (ID_VACUNA) REFERENCES TP_VACUNAS(ID),

--CONSTRAINT FK_VACUNAS_PERSONAS
--FOREIGN KEY (ID_PERSONA) REFERENCES TM_PERSONAS(ID)
--);

--DROP TABLE IF EXISTS TM_PERSONAS_GRUPO
--CREATE TABLE TM_PERSONAS_GRUPO
--(
--ID INT IDENTITY(1,1) PRIMARY KEY,
--ID_PERSONA INT,
--ID_PERSONA_AGRUPADA INT,
--ULTIMA_MODIFICACION DATETIME DEFAULT GETDATE(),

--CONSTRAINT FK_PERSONA_ASOCIA
--FOREIGN KEY (ID_PERSONA) REFERENCES TM_PERSONAS(ID),

--CONSTRAINT FK_PESONA_ASOCIADA
--FOREIGN KEY (ID_PERSONA) REFERENCES TM_PERSONAS(ID)
--);