--In this example, we'll iterate through the SalesLT.SalesOrderHeader table and for each order, 
--we will calculate the total amount of all the associated items in the SalesLT.SalesOrderDetail table. 
--The cursor will go through each order and print the total amount of items for that order.



DECLARE @OrderID INT
DECLARE @TotalOrderAmount DECIMAL(18, 2)

-- Declare the cursor
DECLARE OrderCursor CURSOR FOR
SELECT SalesOrderID
FROM SalesLT.SalesOrderHeader
WHERE OrderDate >= '2001-01-01'  -- Only consider orders from 2001 onwards

-- Open the cursor
OPEN OrderCursor

-- Fetch the first row from the cursor
FETCH NEXT FROM OrderCursor INTO @OrderID

-- Loop through the result set
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Initialize the total amount to 0 for each order
    SET @TotalOrderAmount = 0

    -- Calculate the total amount for the current order
    SELECT @TotalOrderAmount = SUM(LineTotal)
    FROM SalesLT.SalesOrderDetail
    WHERE SalesOrderID = @OrderID

    -- Print the result for this order
    PRINT 'SalesOrderID: ' + CAST(@OrderID AS NVARCHAR(10)) + 
          ', Total Amount: $' + CAST(@TotalOrderAmount AS NVARCHAR(18))

    -- If the total amount exceeds $1000, print a special message
    IF @TotalOrderAmount > 1000
    BEGIN
        PRINT '  ** High Value Order! **'
    END

    -- Fetch the next row from the cursor
    FETCH NEXT FROM OrderCursor INTO @OrderID
END

-- Close the cursor
CLOSE OrderCursor

-- Deallocate the cursor to free resources
DEALLOCATE OrderCursor

/*
Cursor Declaration (DECLARE OrderCursor CURSOR FOR):
The cursor selects the SalesOrderID from the SalesLT.SalesOrderHeader table, but only for orders placed from January 1, 2020, onwards (filtered by OrderDate).
Cursor Processing:
The cursor iterates over each SalesOrderID fetched from the header table.
For each SalesOrderID, it calculates the total amount of the items from the SalesLT.SalesOrderDetail table using the SUM(LineTotal) function.
Condition Checking:
If the total order amount exceeds $1000, a special message (** High Value Order! **) is printed.
Cursor Operations:
FETCH NEXT FROM: Retrieves each SalesOrderID one by one and processes it.
WHILE @@FETCH_STATUS = 0: Ensures the cursor continues to process rows as long as there are rows left to fetch.
Cursor Clean-up:
CLOSE: Closes the cursor after processing all rows.
DEALLOCATE: Releases resources associated with the cursor.
*/