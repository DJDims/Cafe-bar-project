CREATE PROCEDURE prAddCategory(@Description NVARCHAR(100))
AS
BEGIN
	INSERT INTO tCategory(CatDescription) VALUES(@Description)
END
