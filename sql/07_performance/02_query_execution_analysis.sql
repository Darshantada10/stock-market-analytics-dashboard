USE StockMarketAnalytics;
GO

-- ============================================
-- QUERY EXECUTION ANALYSIS
-- Purpose:
-- Analyze performance of analytical queries
-- ============================================

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

-- ============================================
-- VOLATILITY ANALYSIS QUERY
-- ============================================

SELECT
    company_id,
    trade_date,
    close_price,
    AVG(close_price) OVER
    (
        PARTITION BY company_id
        ORDER BY trade_date
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS rolling_30_day_avg
FROM core.fact_stock_prices;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO