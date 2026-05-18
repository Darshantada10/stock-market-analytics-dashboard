USE StockMarketAnalytics;
GO

IF OBJECT_ID('staging.stock_prices_raw', 'U') IS NOT NULL
BEGIN
    DROP TABLE staging.stock_prices_raw;
END;
GO

CREATE TABLE staging.stock_prices_raw (
    raw_price_id           BIGINT IDENTITY(1,1) PRIMARY KEY,
    
    ticker                 VARCHAR(50),
    trade_date             DATE,
    
    open_price             DECIMAL(18,4),
    high_price             DECIMAL(18,4),
    low_price              DECIMAL(18,4),
    close_price            DECIMAL(18,4),
    adj_close_price        DECIMAL(18,4),
    
    volume                 BIGINT,
    vwap                   DECIMAL(18,4),
    
    source_file            VARCHAR(255),
    load_timestamp         DATETIME DEFAULT GETDATE()
);
GO