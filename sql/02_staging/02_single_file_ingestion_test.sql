USE StockMarketAnalytics;
GO

IF OBJECT_ID('tempdb..#raw_import') IS NOT NULL
BEGIN
    DROP TABLE #raw_import;
END;
GO

CREATE TABLE #raw_import (
    trade_date         VARCHAR(50),
    open_price         VARCHAR(50),
    high_price         VARCHAR(50),
    low_price          VARCHAR(50),
    close_price        VARCHAR(50),
    adj_close_price    VARCHAR(50),
    volume             VARCHAR(50),
    vwap               VARCHAR(50)
);
GO

BULK INSERT #raw_import
FROM 'D:\Perenexa\DA\Projects\stock-market-analytics-dashboard\data\raw\RELIANCE.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

INSERT INTO staging.stock_prices_raw (
    ticker,
    trade_date,
    open_price,
    high_price,
    low_price,
    close_price,
    adj_close_price,
    volume,
    vwap,
    source_file
)
SELECT
    'RELIANCE' AS ticker,

    TRY_CONVERT(DATE, trade_date, 105) AS trade_date,

    TRY_CONVERT(DECIMAL(18,4), open_price) AS open_price,
    TRY_CONVERT(DECIMAL(18,4), high_price) AS high_price,
    TRY_CONVERT(DECIMAL(18,4), low_price) AS low_price,
    TRY_CONVERT(DECIMAL(18,4), close_price) AS close_price,
    TRY_CONVERT(DECIMAL(18,4), adj_close_price) AS adj_close_price,

    TRY_CONVERT(BIGINT, volume) AS volume,

    TRY_CONVERT(DECIMAL(18,4), vwap) AS vwap,

    'RELIANCE.csv' AS source_file

FROM #raw_import;
GO