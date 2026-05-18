USE StockMarketAnalytics;
GO

IF OBJECT_ID('staging.raw_file_import', 'U') IS NOT NULL
BEGIN
    DROP TABLE staging.raw_file_import;
END;
GO

CREATE TABLE staging.raw_file_import (
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