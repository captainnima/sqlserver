USE [AdventureWorksLT2019]
GO
/****** Object:  StoredProcedure [dbo].[AddModelAndDescription]    Script Date: 10/16/2022 1:02:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dr. Z
-- Create date: October 15, 2022
-- Description:	Adds records to 3 related tables
-- =============================================
ALTER PROCEDURE [dbo].[AddModelAndDescription]
	-- Add the parameters for the stored procedure here
	@product_name nvarchar(50),
	@product_description nvarchar(400),
	@culture nchar(6) = 'en'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--create two variables to hold the keys of the two inserted rows
	DECLARE @product_model_id INT,
	        @product_description_id INT
	BEGIN TRY
		BEGIN TRAN
			--step 1: insert into the ProductModel table
			INSERT INTO SalesLT.ProductModel (Name)
			VALUES (@product_name)

			--get the inserted key
			SELECT @product_model_id = @@IDENTITY

			--step 2: insert into the ProductDescription
			INSERT INTO SalesLT.ProductDescription (Description)
			VALUES (@product_description)

			--get the inserted key
			SELECT @product_description_id = @@IDENTITY

			--step 3: create a new row in the join table
			INSERT INTO SalesLT.ProductModelProductDescription
				(ProductModelID, ProductDescriptionID, Culture)
			VALUES (@product_model_id, @product_description_id, @culture)
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'There was an error'
		PRINT ERROR_MESSAGE()
	END CATCH
END
