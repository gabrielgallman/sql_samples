-- Create a new stored procedure called 'setCustomer' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'setCustomer'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.setCustomer
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.setCustomer
    @json_val nvarchar(max)
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
    --Right-click dbo.Customers and select Peek Definition
    --Refer to the column list to easily complete the statements
    --for your stored procedure
    INSERT INTO dbo.Customers (CustomerId, Name, Location, Email)
        SELECT CustomerId, Name, Location, Email
        FROM OPENJSON (@json_val)
        WITH(   CustomerId int,
        Name nvarchar (50),
        Location nvarchar(50),
        Email nvarchar(50)
    )
-- example to execute the stored procedure we just created
--EXECUTE dbo.setCustomer 1 /*value_for_param1*/, 2 /*value_for_param2*/
GO