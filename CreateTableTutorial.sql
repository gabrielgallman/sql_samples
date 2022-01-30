IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers
GO
CREATE TABLE dbo.Customers
(
    customerID int NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Location NVARCHAR (50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
);
GO