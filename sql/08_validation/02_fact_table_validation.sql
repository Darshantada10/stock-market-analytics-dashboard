USE StockMarketAnalytics;
GO

-- ============================================
-- DUPLICATE FACT RECORD VALIDATION
-- ============================================

SELECT
    company_id,
    trade_date,
    COUNT(*) AS duplicate_count
FROM core.fact_stock_prices
GROUP BY
    company_id,
    trade_date
HAVING COUNT(*) > 1;
GO

-- ============================================
-- NULL VALIDATION
-- ============================================

SELECT *
FROM core.fact_stock_prices
WHERE
    trade_date IS NULL
    OR close_price IS NULL
    OR volume IS NULL;
GO

-- ============================================
-- NEGATIVE VALUE VALIDATION
-- ============================================

SELECT *
FROM core.fact_stock_prices
WHERE
    open_price < 0
    OR high_price < 0
    OR low_price < 0
    OR close_price < 0
    OR volume < 0;
GO

-- ============================================
-- INVALID OHLC VALIDATION
-- ============================================

SELECT *
FROM core.fact_stock_prices
WHERE
    high_price < low_price;
GO