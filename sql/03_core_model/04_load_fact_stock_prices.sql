USE StockMarketAnalytics;
GO

TRUNCATE TABLE core.fact_stock_prices;
GO

INSERT INTO core.fact_stock_prices (

    company_id,
    trade_date,

    open_price,
    high_price,
    low_price,
    close_price,
    adj_close_price,

    volume,
    vwap
)
SELECT

    dc.company_id,

    spr.trade_date,

    spr.open_price,
    spr.high_price,
    spr.low_price,
    spr.close_price,
    spr.adj_close_price,

    spr.volume,
    spr.vwap

FROM staging.stock_prices_raw spr

INNER JOIN core.dim_companies dc
    ON spr.ticker = dc.ticker;
GO