DROP PROCEDURE IF EXISTS STP_TP_VACUNAS
GO

CREATE PROCEDURE STP_TP_VACUNAS(
	@ID INT = NULL,
	@DESCRIPCION VARCHAR(100) = NULL,
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
			TP_VACUNAS
		(
			DESCRIPCION
		)
		VALUES
		(
			@DESCRIPCION
		)

	END

--------------------
-- ACTUALIZAR
--------------------
	IF @OPERACION = 1
	BEGIN
		
		UPDATE
			TP_VACUNAS
		SET 			
			DESCRIPCION = @DESCRIPCION
		WHERE
			ID = @ID
	END


--------------------
-- ELIMINAR
--------------------
	IF @OPERACION = 2
	BEGIN
		
		DELETE FROM
			TP_VACUNAS
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
			DESCRIPCION
		FROM 
			TP_VACUNAS
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
			DESCRIPCION
		FROM 
			TP_VACUNAS

	END

END