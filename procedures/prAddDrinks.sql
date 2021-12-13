CREATE PROCEDURE prAddDrinks(@Category INT, @Name NVARCHAR(15), @Price MONEY)
AS
BEGIN
	INSERT INTO tDrinks(CategoryCode, Name, Price) VALUES(@Category, @Name, @Price)
END