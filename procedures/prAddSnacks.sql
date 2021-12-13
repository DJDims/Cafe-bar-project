CREATE PROCEDURE prAddSnacks(@Category INT, @Name NVARCHAR(20), @Price MONEY)
AS
BEGIN
	INSERT INTO tSnack(CategoryCode, Name, Price) VALUES(@Category, @Name, @Price)
END
