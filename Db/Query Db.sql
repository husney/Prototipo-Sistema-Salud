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
--('CC', 'Cédula de ciudadanía'),
--('TI', 'Tarjeta de identidad'),
--('CE', 'Cédula extrangera')

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
--('Anemia ferropénica'), 
--('Anemia hemolítica'), 
--('Anorexia'), 
--('Apnea del sueño'), 
--('Asma'), 
--('Aterosclerosis'), 
--('Bronquiectasias'), 
--('Bronquitis'), 
--('Brucelosis'), 
--('Bulimia'), 
--('Calambres musculares'), 
--('Cálculos de riñón'), 
--('Callos y callosidades'), 
--('Cefaleas'), 
--('Cefaleas de tensión'), 
--('Ciática'), 
--('Colitis ulcerosa'), 
--('Colon irritable'), 
--('Coma etílico'), 
--('Congelación'), 
--('Conmoción cerebral'), 
--('Degeneración macular del ojo'), 
--('Depresión'), 
--('Deshidratación'), 
--('Desmayos y mareos'), 
--('Diarrea'), 
--('Diarrea del viajero'),
--('Dolor de espalda'),
--('Dolor de garganta'), 
--('Dolor de oído'), 
--('Embarazo en la adolescencia'),
--('Enfermedad de Crohn'), 
--('Enfermedad de Parkinson'), 
--('Estreñimiento'),
--('Fisura anal'), 
--('Ganglión'), 
--('Glositis'), 
--('Gota'), 
--('Hemorroides'), 
--('Hernia discal'), 
--('Hígado graso'), 
--('Hipertensión arterial HTA'), 
--('Hipertensión intracraneal idiopática'), 
--('Hipocondría'), 
--('Hipotensión'),
--('Hongos'), 
--('Hongos en las uñas'), 
--('Incontinencia fecal'), 
--('Juanetes'), 
--('La gripe'), 
--('Laberintitis'), 
--('Labios agrietados'),
--('Laringitis'), 
--('Latigazo cervical'), 
--('Lengua geográfica'), 
--('Lengua negra vellosa'), 
--('Litiasis renal'),
--('Mareo'),
--('Mastoiditis'), 
--('Medidas sanitarias en los viajes al extranjero'),
--('Migrañas y jaquecas'), 
--('Obesidad'), 
--('Orinar por la noche'), 
--('Parálisis facial de Bell'),
--('Piel seca'), 
--('Preparación de los viajes largos'),
--('Prevención de las hemorroides'), 
--('Prozac®'),
--('Reflujo gastroesofágico'), 
--('Resfriados'),
--('Ronquidos'), 
--('Rotura de tímpano'), 
--('Sangrado nasal'), 
--('Sangrado rectal'), 
--('Sangre en el esputo'), 
--('Sangre en la orina'), 
--('Síndrome de astenia crónica'), 
--('Síndrome de piernas inquietas'),
--('Síndrome hepático renal'),
--('Síndrome nefrótico'), 
--('Sinusitis'), 
--('Talasemia'), 
--('Tendinitis'), 
--('Tic en el párpado'), 
--('Tratamiento de las jaquecas'), 
--('Tratamiento del alcoholismo'), 
--('Varices'),
--('Vértigo'), 
--('Vómitos de sangre');

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
--('Tuberculosis meníngea'),
--('Poliomielitis'),
--('Difteria'),
--('Tosferina'),
--('Tétanos accidental y neonatal'),
--('Infección por haemophilus influenzae tipo B (HIB)'),
--('Diarrea por rotavirus'),
--('Neumonía, meningitis y otitis causadas por neumococo'),
--('Influenza'),
--('Sarampión'),
--('Parotiditis o paperas'),
--('Rubeola y síndrome de rubeola congénita'),
--('Fiebre amarilla'),
--('Hepatitis A'),
--('Infección por virus del papiloma humano (VPH) y cáncer de cuello uterino'),
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