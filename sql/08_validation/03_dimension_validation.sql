USE StockMarketAnalytics;
GO

-- ============================================
-- DUPLICATE TICKER VALIDATION
-- ============================================

SELECT
    ticker,
    COUNT(*) AS duplicate_count
FROM core.dim_companies
GROUP BY ticker
HAVING COUNT(*) > 1;
GO

-- ============================================
-- NULL TICKER VALIDATION
-- ============================================

SELECT *
FROM core.dim_companies
WHERE ticker IS NULL;
GO

-- ============================================
-- TOTAL DISTINCT COMPANIES
-- ============================================

SELECT
    COUNT(DISTINCT ticker) AS distinct_companies
FROM core.dim_companies;
GO