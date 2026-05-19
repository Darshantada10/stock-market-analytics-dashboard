USE StockMarketAnalytics;
GO

-- ============================================
-- MARKET MOVERS ANALYTICAL VIEW
-- ============================================

CREATE OR ALTER VIEW analytics.vw_market_movers AS

SELECT

    pa.company_id,
    pa.ticker,

    pa.trade_date,

    pa.close_price,

    pa.daily_return_pct,

    pa.return_deviation,

    pa.anomaly_flag,

    RANK() OVER (
        ORDER BY ABS(pa.daily_return_pct) DESC
    ) AS volatility_rank,

    DENSE_RANK() OVER (
        ORDER BY ABS(pa.daily_return_pct) DESC
    ) AS dense_volatility_rank,

    ROW_NUMBER() OVER (
        ORDER BY ABS(pa.daily_return_pct) DESC
    ) AS unique_row_number

FROM analytics.vw_price_anomalies pa

WHERE pa.daily_return_pct IS NOT NULL;
GO