CREATE TRIGGER trCheckAge 
ON [dbo].[tClient] FOR INSERT
AS
BEGIN
	DECLARE @Age INT, @UpdatedCode INT
	SELECT @UpdatedCode = ClientCode FROM INSERTED
	SET @Age = YEAR(GETDATE()) - YEAR((SELECT BornDate FROM tClient WHERE ClientCode = @UpdatedCode))

	IF @Age < 18 UPDATE tClient SET ClientStatus = 0 WHERE ClientCode = @UpdatedCode
	ELSE UPDATE tClient SET ClientStatus = 1 WHERE ClientCode = @UpdatedCode

END
