USE StockMarketAnalytics;
GO

-- ============================================
-- DAILY STOCK RETURN ANALYSIS
-- ============================================

SELECT

    dc.company_id,
    dc.ticker,

    fsp.trade_date,

    fsp.close_price,

    LAG(fsp.close_price) OVER (
        PARTITION BY dc.ticker
        ORDER BY fsp.trade_date
    ) AS previous_close_price,

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
        2
    ) AS daily_return_pct

FROM core.fact_stock_prices fsp

INNER JOIN core.dim_companies dc
    ON fsp.company_id = dc.company_id

ORDER BY
    dc.ticker,
    fsp.trade_date;
GO