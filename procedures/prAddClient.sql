CREATE PROCEDURE prAddClient(@Name NVARCHAR(10), @Mail NVARCHAR(30), @Phone NVARCHAR(10), @BornDate DATE)
AS
BEGIN
	INSERT INTO tClient(Name, Mail, Phone, BornDate) VALUES(@Name, @Mail, @Phone, @BornDate)
END