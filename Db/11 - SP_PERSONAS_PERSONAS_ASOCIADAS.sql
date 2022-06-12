DROP PROCEDURE IF EXISTS STP_TM_PERSONAS_GRUPO
GO

CREATE PROCEDURE STP_TM_PERSONAS_GRUPO(
	@ID INT = NULL,	
	@ID_PERSONA INT = NULL,	
	@ID_PERSONA_AGRUPADA INT = NULL,	
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
			TM_PERSONAS_GRUPO
		(
			ID_PERSONA,
			ID_PERSONA_AGRUPADA
		)
		VALUES
		(
			@ID_PERSONA,
			@ID_PERSONA_AGRUPADA
		)

		SELECT SCOPE_IDENTITY();

	END

--------------------
-- ACTUALIZAR
--------------------
	IF @OPERACION = 1
	BEGIN
		
		UPDATE
			TM_PERSONAS_GRUPO
		SET 
			ID_PERSONA = @ID_PERSONA,
			ID_PERSONA_AGRUPADA = @ID_PERSONA_AGRUPADA
		WHERE
			ID = @ID
	END


--------------------
-- ELIMINAR
--------------------
	IF @OPERACION = 2
	BEGIN
		
		DELETE FROM
			TM_PERSONAS_GRUPO
		WHERE 
			ID = @ID

	END

--------------------
-- SELECCIONAR UNO
--------------------
	
	IF @OPERACION = 3
	BEGIN
		
		SELECT
			ID,			
			ID_PERSONA,
			ID_PERSONA_AGRUPADA
		FROM 
			TM_PERSONAS_GRUPO
		WHERE 
			ID = @ID

	END

---------------------
-- SELECCIONAR TODOS
---------------------

	IF @OPERACION = 4
	BEGIN
		
		SELECT
			ID,			
			ID_PERSONA,
			ID_PERSONA_AGRUPADA
		FROM 
			TM_PERSONAS_GRUPO

	END

---------------------
-- SELECCIONAR TODOS POR PERSONA
---------------------

	IF @OPERACION = 5
	BEGIN
		
		SELECT
			TM_PERSONAS_GRUPO.ID,
			TM_PERSONAS_GRUPO.ID_PERSONA,
			TM_PERSONAS_GRUPO.ID_PERSONA_AGRUPADA,
			CONCAT(RELACION.PRIMER_NOMBRE, ' ', RELACION.PRIMER_APELLIDO)
		FROM 
			TM_PERSONAS_GRUPO
		INNER JOIN
			TM_PERSONAS RELACION
		ON 
			RELACION.ID = TM_PERSONAS_GRUPO.ID_PERSONA_AGRUPADA
		WHERE
			ID_PERSONA = @ID_PERSONA
	END
END