USE StockMarketAnalytics;
GO

-- Create staging schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END;
GO

-- Create core schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'core'
)
BEGIN
    EXEC('CREATE SCHEMA core');
END;
GO

-- Create analytics schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'analytics'
)
BEGIN
    EXEC('CREATE SCHEMA analytics');
END;
GO