CREATECREATE TRIGGER dbo.UpdateBooks
ON dbo.Publisher
AFTER UPDATE
AS
BEGIN
	DECLARE @new_publisher_id AS int
	DECLARE @old_publisher_id AS int

	SELECT @new_publisher_id = PubID
	FROM inserted

	SELECT @old_publisher_id = PubID
	FROM deleted

	IF (@new_publisher_id <> 0)
		UPDATE Books
		SET PubID = @new_publisher_id
		WHERE PubID = @old_publisher_id

END