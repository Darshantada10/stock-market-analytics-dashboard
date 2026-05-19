USE StockMarketAnalytics;
GO

-- ============================================
-- PRICE ANOMALY DETECTION
-- ============================================

WITH daily_returns AS (

    SELECT

        dc.company_id,
        dc.ticker,

        fsp.trade_date,

        fsp.close_price,

        ROUND(
            (
                (
                    fsp.close_price
                    -
                    LAG(fsp.close_price) OVER (
                        PARTITION BY dc.ticker
                        ORDER BY fsp.trade_date
                    )
                )
                /
                LAG(fsp.close_price) OVER (
                    PARTITION BY dc.ticker
                    ORDER BY fsp.trade_date
                )
            ) * 100,
            4
        ) AS daily_return_pct

    FROM core.fact_stock_prices fsp

    INNER JOIN core.dim_companies dc
        ON fsp.company_id = dc.company_id
),

volatility_base AS (

    SELECT

        company_id,
        ticker,

        trade_date,

        close_price,

        daily_return_pct,

        AVG(daily_return_pct) OVER (
            PARTITION BY ticker
            ORDER BY trade_date
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS rolling_avg_return,

        STDEV(daily_return_pct) OVER (
            PARTITION BY ticker
            ORDER BY trade_date
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS rolling_volatility

    FROM daily_returns
)

SELECT

    company_id,
    ticker,

    trade_date,

    close_price,

    daily_return_pct,

    ROUND(rolling_avg_return, 4) AS rolling_avg_return,

    ROUND(rolling_volatility, 4) AS rolling_volatility,

    ROUND(
        ABS(daily_return_pct - rolling_avg_return),
        4
    ) AS return_deviation,

    CASE
        WHEN ABS(daily_return_pct - rolling_avg_return)
            > (2 * rolling_volatility)
        THEN 'ANOMALY'

        ELSE 'NORMAL'
    END AS anomaly_flag

FROM volatility_base

ORDER BY
    ticker,
    trade_date;
GO