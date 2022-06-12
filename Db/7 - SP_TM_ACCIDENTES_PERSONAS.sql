DROP PROCEDURE IF EXISTS STP_TM_ACCIDENTES_PERSONAS
GO

CREATE PROCEDURE STP_TM_ACCIDENTES_PERSONAS(
	@ID INT = NULL,	
	@DESCRIPCION VARCHAR(500) = NULL,
	@LUGAR VARCHAR(500) = NULL,
	@EN_TRATAMIENTO BIT = NULL,	
	@ID_PERSONA INT = NULL,	
	@ID_ESTADO INT = NULL,
	@OPERACION TINYINT = NULL
)
AS
BEGIN

	SET NOCOUNT ON;
---------------------
-- INSERTAR
---------------------
	IF @OPERACION = 0
	BEGIN
		
		INSERT INTO
			TM_ACCIDENTES_PERSONAS
		(
			DESCRIPCION,
			LUGAR,
			EN_TRATAMIENTO,
			ID_PERSONA,			
			ID_ESTADO
		)
		VALUES
		(
			@DESCRIPCION,
			@LUGAR,
			@EN_TRATAMIENTO,
			@ID_PERSONA,			
			1
		)

		SELECT SCOPE_IDENTITY();

	END

--------------------
-- ACTUALIZAR
--------------------
	IF @OPERACION = 1
	BEGIN
		
		UPDATE
			TM_ACCIDENTES_PERSONAS
		SET 
			DESCRIPCION = @DESCRIPCION,
			LUGAR = @LUGAR,
			EN_TRATAMIENTO = @EN_TRATAMIENTO,
			ID_ESTADO = @ID_ESTADO
		WHERE
			ID = @ID
	END


--------------------
-- ELIMINAR
--------------------
	IF @OPERACION = 2
	BEGIN
		
		DELETE FROM
			TM_ACCIDENTES_PERSONAS
		WHERE 
			ID = @ID

	END

--------------------
-- SELECCIONAR UNO
--------------------
	
	IF @OPERACION = 3
	BEGIN
		
		SELECT
			DESCRIPCION,
			LUGAR,
			EN_TRATAMIENTO,
			ID_PERSONA,			
			ID_ESTADO
		FROM 
			TM_ACCIDENTES_PERSONAS
		WHERE 
			ID = @ID

	END

---------------------
-- SELECCIONAR TODOS
---------------------

	IF @OPERACION = 4
	BEGIN
		
		SELECT
			DESCRIPCION,
			LUGAR,
			EN_TRATAMIENTO,
			ID_PERSONA,			
			ID_ESTADO
		FROM 
			TM_ACCIDENTES_PERSONAS

	END

---------------------
-- SELECCIONAR TODOS POR PERSONA
---------------------

	IF @OPERACION = 5
	BEGIN
		
		SELECT
			TM_ACCIDENTES_PERSONAS.ID,
			TM_ACCIDENTES_PERSONAS.DESCRIPCION,
			TM_ACCIDENTES_PERSONAS.ID_PERSONA,
			TM_ACCIDENTES_PERSONAS.LUGAR,
			TR_ESTADOS_ACCIDENTES.DESCRIPCION,
			TM_ACCIDENTES_PERSONAS.ID_ESTADO			
		FROM 
			TM_ACCIDENTES_PERSONAS
		INNER JOIN
			TR_ESTADOS_ACCIDENTES
		ON
			TR_ESTADOS_ACCIDENTES.ID = TM_ACCIDENTES_PERSONAS.ID_ESTADO
		WHERE
			ID_PERSONA = @ID_PERSONA
	END
END