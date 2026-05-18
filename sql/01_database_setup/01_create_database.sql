USE master;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'StockMarketAnalytics'
)
BEGIN
    CREATE DATABASE StockMarketAnalytics;
END;
GO