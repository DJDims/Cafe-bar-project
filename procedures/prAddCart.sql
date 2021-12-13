CREATE PROCEDURE prAddCart(@BillId INT, @ProductCode INT, @Unit NVARCHAR(20))
AS
BEGIN
	INSERT INTO tCart(BillCode, ProductCode, Unit) VALUES(@BillId, @ProductCode, @Unit)
END
