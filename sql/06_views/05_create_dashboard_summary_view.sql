USE StockMarketAnalytics;
GO

-- ============================================
-- DASHBOARD KPI SUMMARY VIEW
-- ============================================

CREATE OR ALTER VIEW analytics.vw_dashboard_summary AS

SELECT

    COUNT(*) AS total_trading_records,

    COUNT(DISTINCT ticker) AS total_companies,

    SUM(
        CASE
            WHEN anomaly_flag = 'ANOMALY'
            THEN 1
            ELSE 0
        END
    ) AS total_anomalies,

    ROUND(
        AVG(
            ABS(rolling_30_day_volatility)
        ),
        4
    ) AS avg_market_volatility,

    ROUND(
        (
            SUM(
                CASE
                    WHEN anomaly_flag = 'ANOMALY'
                    THEN 1
                    ELSE 0
                END
            ) * 100.0
        ) / COUNT(*),
        2
    ) AS anomaly_percentage

FROM analytics.vw_price_anomalies;
GO