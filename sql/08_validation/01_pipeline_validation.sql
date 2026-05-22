USE StockMarketAnalytics;
GO

-- ============================================
-- PIPELINE VALIDATION SUMMARY
-- ============================================

PRINT '============================================';
PRINT 'STAGING TABLE ROW COUNT';
PRINT '============================================';

SELECT
    COUNT(*) AS staging_total_rows
FROM staging.stock_prices_raw;
GO

PRINT '============================================';
PRINT 'FACT TABLE ROW COUNT';
PRINT '============================================';

SELECT
    COUNT(*) AS fact_total_rows
FROM core.fact_stock_prices;
GO

PRINT '============================================';
PRINT 'DIMENSION TABLE ROW COUNT';
PRINT '============================================';

SELECT
    COUNT(*) AS company_count
FROM core.dim_companies;
GO

PRINT '============================================';
PRINT 'ROW COUNT DIFFERENCE';
PRINT '============================================';

SELECT
    staging_counts.total_rows AS staging_rows,
    fact_counts.total_rows AS fact_rows,
    staging_counts.total_rows - fact_counts.total_rows AS row_difference
FROM
(
    SELECT COUNT(*) AS total_rows
    FROM staging.stock_prices_raw
) staging_counts
CROSS JOIN
(
    SELECT COUNT(*) AS total_rows
    FROM core.fact_stock_prices
) fact_counts;
GO