USE StockMarketAnalytics;
GO

-- ============================================
-- VOLATILITY ANALYSIS
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
)

SELECT

    company_id,
    ticker,

    trade_date,

    close_price,

    daily_return_pct,

    ROUND(
        AVG(daily_return_pct) OVER (
            PARTITION BY ticker
            ORDER BY trade_date
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ),
        4
    ) AS rolling_30_day_avg_return,

    ROUND(
        STDEV(daily_return_pct) OVER (
            PARTITION BY ticker
            ORDER BY trade_date
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ),
        4
    ) AS rolling_30_day_volatility

FROM daily_returns

ORDER BY
    ticker,
    trade_date;
GO