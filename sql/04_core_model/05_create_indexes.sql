USE StockMarketAnalytics;
GO

-- ============================================
-- INDEX ON COMPANY_ID
-- ============================================

CREATE NONCLUSTERED INDEX idx_fact_company_id
ON core.fact_stock_prices(company_id);
GO

-- ============================================
-- INDEX ON TRADE_DATE
-- ============================================

CREATE NONCLUSTERED INDEX idx_fact_trade_date
ON core.fact_stock_prices(trade_date);
GO

-- ============================================
-- COMPOSITE INDEX
-- ============================================

CREATE NONCLUSTERED INDEX idx_fact_company_date
ON core.fact_stock_prices(company_id, trade_date);
GO

-- ============================================
-- UNIQUE INDEX ON TICKER
-- ============================================

CREATE UNIQUE NONCLUSTERED INDEX idx_dim_ticker
ON core.dim_companies(ticker);
GO

SELECT *
FROM sys.indexes
WHERE object_id = OBJECT_ID('core.fact_stock_prices');