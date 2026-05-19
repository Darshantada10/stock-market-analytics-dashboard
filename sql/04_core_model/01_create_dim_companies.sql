USE StockMarketAnalytics;
GO

IF OBJECT_ID('core.dim_companies', 'U') IS NOT NULL
BEGIN
    DROP TABLE core.dim_companies;
END;
GO

CREATE TABLE core.dim_companies (
    
    company_id             INT IDENTITY(1,1) PRIMARY KEY,
    
    ticker                 VARCHAR(100) NOT NULL,
    
    created_date           DATETIME DEFAULT GETDATE()
);
GO