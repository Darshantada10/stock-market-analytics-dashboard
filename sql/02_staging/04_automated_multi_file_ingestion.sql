USE StockMarketAnalytics;
GO

IF OBJECT_ID('tempdb..#file_list') IS NOT NULL
BEGIN
    DROP TABLE #file_list;
END;
GO

CREATE TABLE #file_list (
    file_name VARCHAR(255)
);
GO

INSERT INTO #file_list
EXEC xp_cmdshell 'DIR /B "D:\Perenexa\DA\Projects\stock-market-analytics-dashboard\data\raw\*.csv"';
GO

DELETE FROM #file_list
WHERE file_name IS NULL;
GO

DELETE FROM #file_list
WHERE file_name = 'HDFC_LIFE.csv';

DELETE FROM #file_list
WHERE file_name = 'NIFTY_50_STOCKS.csv';

DECLARE @file_name        VARCHAR(255);
DECLARE @file_path        VARCHAR(1000);
DECLARE @ticker           VARCHAR(100);
DECLARE @sql              NVARCHAR(MAX);

DECLARE @remaining_files INT;

SELECT
    @remaining_files = COUNT(*)
FROM #file_list;

TRUNCATE TABLE staging.stock_prices_raw;

WHILE @remaining_files > 0
BEGIN

SELECT TOP 1
    @file_name = file_name
FROM #file_list
ORDER BY file_name;

SET @file_path =
'D:\Perenexa\DA\Projects\stock-market-analytics-dashboard\data\raw\' + @file_name;

SET @ticker =
LEFT(@file_name, LEN(@file_name) - 4);

PRINT 'Processing File: ' + @file_name;
PRINT 'Processing File Path: ' + @file_path;
PRINT 'Processing Ticker: ' + @ticker;

SET @sql = '
BULK INSERT staging.raw_file_import
FROM ''' + @file_path + '''
WITH (
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDTERMINATOR = '','',
    ROWTERMINATOR = ''\n'',
    TABLOCK
);';

PRINT @sql;

TRUNCATE TABLE staging.raw_file_import;

EXEC(@sql);

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
    @ticker,

    TRY_CONVERT(DATE, trade_date, 105),

    TRY_CONVERT(DECIMAL(18,4), open_price),
    TRY_CONVERT(DECIMAL(18,4), high_price),
    TRY_CONVERT(DECIMAL(18,4), low_price),
    TRY_CONVERT(DECIMAL(18,4), close_price),
    TRY_CONVERT(DECIMAL(18,4), adj_close_price),

    TRY_CONVERT(BIGINT, volume),

    TRY_CONVERT(DECIMAL(18,4), vwap),

    @file_name

FROM staging.raw_file_import;

DELETE FROM #file_list
WHERE file_name = @file_name;

SELECT
    @remaining_files = COUNT(*)
FROM #file_list;

END;