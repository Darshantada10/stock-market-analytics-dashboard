USE StockMarketAnalytics;
GO

TRUNCATE TABLE core.dim_companies;
GO

INSERT INTO core.dim_companies (
    ticker
)
SELECT DISTINCT
    ticker
FROM staging.stock_prices_raw
ORDER BY ticker;
GO

SELECT *
FROM core.dim_companies;