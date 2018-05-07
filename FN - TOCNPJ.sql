/*
    Author:     Leandro Santiago Gomes
    Descrição:  A função usa a estrutura base de formatação
*/
IF (EXISTS (SELECT * FROM sysobjects WHERE (id = object_id(N'dbo.fnToCnpj')) AND (xtype IN (N'FN', N'IF', N'TF'))))
	DROP FUNCTION [dbo].[fnToCnpj];
GO

CREATE FUNCTION dbo.fnToCnpj(@E AS VARCHAR(18), @T AS BIT = 0) 
RETURNS VARCHAR(18) AS BEGIN

	DECLARE @S VARCHAR(18) = RIGHT('00000000000000' + REPLACE(REPLACE(REPLACE(RTRIM(LTRIM(@E)),'/',''),'-',''),'.',''), 14)

	IF @T = 1 BEGIN
		SET @S = SUBSTRING(@S,1,2) + '.' + SUBSTRING(@S,3,3) + '.' + SUBSTRING(@S, 6, 3) + '/' + SUBSTRING(@S,9, 4) + '-' + SUBSTRING(@S, 13, 2)
	END

	RETURN @S
END
GO
