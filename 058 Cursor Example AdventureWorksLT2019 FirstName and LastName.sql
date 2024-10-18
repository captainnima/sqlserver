--A cursor in SQL Server allows row-by-row processing of a result set. Here's an example using the AdventureWorksLT2019 database. 
--The following example will illustrate the concept of a cursor by iterating over a list of customers and displaying 
--their FirstName and LastName from the SalesLT.Customer table.

--Example Cursor for AdventureWorksLT2019

DECLARE @FirstName NVARCHAR(50), @LastName NVARCHAR(50)

-- Declare the cursor
DECLARE CustomerCursor CURSOR FOR
SELECT FirstName, LastName
FROM SalesLT.Customer

-- Open the cursor
OPEN CustomerCursor

-- Fetch the first row from the cursor
FETCH NEXT FROM CustomerCursor INTO @FirstName, @LastName

-- Loop through the result set
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print the customer name
    PRINT 'Customer Name: ' + @FirstName + ' ' + @LastName

    -- Fetch the next row
    FETCH NEXT FROM CustomerCursor INTO @FirstName, @LastName
END

-- Close the cursor
CLOSE CustomerCursor

-- Deallocate the cursor to release resources
DEALLOCATE CustomerCursor

/*
Explanation:
Cursor Declaration:
CustomerCursor is declared to select FirstName and LastName from the SalesLT.Customer table.
Cursor Operations:
OPEN CustomerCursor: Opens the cursor and makes it ready for fetching.
FETCH NEXT FROM CustomerCursor INTO @FirstName, @LastName: Retrieves the next row from the cursor and stores the values into the @FirstName and @LastName variables.
WHILE @@FETCH_STATUS = 0: This checks if the fetch was successful (0 means success), and the loop continues fetching until no more rows are available.
PRINT: Outputs the FirstName and LastName of each customer.
Cursor Closure:
CLOSE CustomerCursor: Closes the cursor after processing.
DEALLOCATE CustomerCursor: Releases the memory associated with the cursor.
When to Use Cursors:
Row-by-row processing: Cursors are useful when you need to process rows individually.
Complex logic: If each row requires complex logic that cannot be achieved with a set-based query, a cursor can help.
*/