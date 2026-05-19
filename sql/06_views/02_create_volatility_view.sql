USE StockMarketAnalytics;
GO

-- ============================================
-- VOLATILITY ANALYTICAL VIEW
-- ============================================

CREATE OR ALTER VIEW analytics.vw_volatility_analysis AS

WITH volatility_base AS (

    SELECT

        dr.company_id,
        dr.ticker,

        dr.trade_date,

        dr.close_price,

        dr.daily_return_pct,

        AVG(dr.daily_return_pct) OVER (
            PARTITION BY dr.ticker
            ORDER BY dr.trade_date
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS rolling_30_day_avg_return,

        STDEV(dr.daily_return_pct) OVER (
            PARTITION BY dr.ticker
            ORDER BY dr.trade_date
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS rolling_30_day_volatility

    FROM analytics.vw_daily_returns dr
)

SELECT

    company_id,
    ticker,

    trade_date,

    close_price,

    ROUND(daily_return_pct, 4) AS daily_return_pct,

    ROUND(rolling_30_day_avg_return, 4)
        AS rolling_30_day_avg_return,

    ROUND(rolling_30_day_volatility, 4)
        AS rolling_30_day_volatility

FROM volatility_base;
GO