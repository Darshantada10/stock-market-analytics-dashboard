USE StockMarketAnalytics;
GO

-- ============================================
-- ANOMALY DETECTION ANALYTICAL VIEW
-- ============================================

CREATE OR ALTER VIEW analytics.vw_price_anomalies AS

SELECT

    va.company_id,
    va.ticker,

    va.trade_date,

    va.close_price,

    va.daily_return_pct,

    va.rolling_30_day_avg_return,

    va.rolling_30_day_volatility,

    ROUND(
        ABS(
            va.daily_return_pct
            -
            va.rolling_30_day_avg_return
        ),
        4
    ) AS return_deviation,

    CASE
        WHEN ABS(
            va.daily_return_pct
            -
            va.rolling_30_day_avg_return
        )
        >
        (2 * va.rolling_30_day_volatility)

        THEN 'ANOMALY'

        ELSE 'NORMAL'
    END AS anomaly_flag

FROM analytics.vw_volatility_analysis va;
GO