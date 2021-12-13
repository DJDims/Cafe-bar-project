CREATE PROCEDURE prAddBill(@ClientCode INT, @PaymentDate DATE, @PaymentType INT, @PaymentStatus INT)
AS
BEGIN
	INSERT INTO tBill(ClientCode, PaymentDate, PaymentType, PaymentStatus) VALUES(@ClientCode, @PaymentDate, @PaymentType, @PaymentStatus)
END
