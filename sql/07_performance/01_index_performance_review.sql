USE StockMarketAnalytics;
GO

-- ============================================
-- INDEX PERFORMANCE REVIEW
-- Purpose:
-- Review indexes created on analytical tables
-- ============================================

SELECT
    OBJECT_NAME(i.object_id) AS table_name,
    i.name AS index_name,
    i.type_desc AS index_type,
    i.is_primary_key,
    i.is_unique
FROM sys.indexes i
WHERE OBJECT_NAME(i.object_id) IN
(
    'fact_stock_prices',
    'dim_companies'
)
ORDER BY
    table_name,
    index_name;
GO