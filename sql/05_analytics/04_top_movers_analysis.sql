USE StockMarketAnalytics;
GO

-- ============================================
-- TOP MARKET MOVERS ANALYSIS
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

    ticker,

    trade_date,

    close_price,

    daily_return_pct,

    RANK() OVER (
        ORDER BY ABS(daily_return_pct) DESC
    ) AS volatility_rank,

    DENSE_RANK() OVER (
        ORDER BY ABS(daily_return_pct) DESC
    ) AS dense_volatility_rank,

    ROW_NUMBER() OVER (
        ORDER BY ABS(daily_return_pct) DESC
    ) AS unique_row_number

FROM daily_returns

WHERE daily_return_pct IS NOT NULL

ORDER BY volatility_rank;
GO