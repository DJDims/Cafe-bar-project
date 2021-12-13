CREATE PROCEDURE prAddEmployer(@ClientId INT, @BillCode INT, @Name NVARCHAR(20), @Phone NVARCHAR(15), @Mail NVARCHAR(25), @Salary MONEY)
AS
BEGIN
	INSERT INTO tEmployer(ClientCode, BillCode, Name, Phone, Mail, Salary) VALUES(@ClientId, @BillCode, @Name, @Phone, @Mail, @Salary)
END
