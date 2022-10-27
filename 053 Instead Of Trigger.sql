CREATE TRIGGER dbo.PromotionDelete
ON dbo.Promotion
INSTEAD OF DELETE
AS
BEGIN
	UPDATE Promotion
	SET active = 0
	WHERE gift  IN (SELECT gift FROM deleted)
END