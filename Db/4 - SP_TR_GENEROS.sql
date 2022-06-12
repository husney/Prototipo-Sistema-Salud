DROP PROCEDURE IF EXISTS STP_TR_GENEROS
GO

CREATE PROCEDURE STP_TR_GENEROS(
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
			TR_GENEROS
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
			TR_GENEROS
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
			TR_GENEROS
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
			TR_GENEROS
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
			TR_GENEROS

	END

END