USE StockMarketAnalytics;
GO

-- ============================================
-- 1. TOTAL ROW COUNT VALIDATION
-- ============================================

SELECT
    COUNT(*) AS total_rows
FROM staging.stock_prices_raw;
GO

-- ============================================
-- 2. DISTINCT TICKER VALIDATION
-- ============================================

SELECT
    COUNT(DISTINCT ticker) AS distinct_tickers
FROM staging.stock_prices_raw;
GO

-- ============================================
-- 3. NULL VALUE VALIDATION
-- ============================================

SELECT *
FROM staging.stock_prices_raw
WHERE
    trade_date IS NULL
    OR open_price IS NULL
    OR high_price IS NULL
    OR low_price IS NULL
    OR close_price IS NULL
    OR volume IS NULL;
GO

-- ============================================
-- 4. DUPLICATE RECORD DETECTION
-- ============================================

SELECT
    ticker,
    trade_date,
    COUNT(*) AS duplicate_count
FROM staging.stock_prices_raw
GROUP BY
    ticker,
    trade_date
HAVING COUNT(*) > 1;
GO

-- ============================================
-- 5. NEGATIVE PRICE VALIDATION
-- ============================================

SELECT *
FROM staging.stock_prices_raw
WHERE
    open_price < 0
    OR high_price < 0
    OR low_price < 0
    OR close_price < 0
    OR adj_close_price < 0;
GO

-- ============================================
-- 6. NULL VALUE SUMMARY
-- ============================================

SELECT
    COUNT(*) AS total_null_rows
FROM staging.stock_prices_raw
WHERE
    open_price IS NULL
    OR high_price IS NULL
    OR low_price IS NULL
    OR close_price IS NULL
    OR volume IS NULL;
GO

-- ============================================
-- 7. NULL ROWS BY TICKER
-- ============================================

SELECT
    ticker,
    COUNT(*) AS null_row_count
FROM staging.stock_prices_raw
WHERE
    open_price IS NULL
    OR high_price IS NULL
    OR low_price IS NULL
    OR close_price IS NULL
    OR volume IS NULL
GROUP BY ticker
ORDER BY null_row_count DESC;
GO

-- ============================================
-- 8. REMOVE CORRUPTED ROWS
-- ============================================

DELETE
FROM staging.stock_prices_raw
WHERE
    open_price IS NULL
    OR high_price IS NULL
    OR low_price IS NULL
    OR close_price IS NULL
    OR volume IS NULL;
GO

-- ============================================
-- 9. POST-CLEANING VALIDATION
-- ============================================

SELECT
    COUNT(*) AS remaining_null_rows
FROM staging.stock_prices_raw
WHERE
    open_price IS NULL
    OR high_price IS NULL
    OR low_price IS NULL
    OR close_price IS NULL
    OR volume IS NULL;
GO