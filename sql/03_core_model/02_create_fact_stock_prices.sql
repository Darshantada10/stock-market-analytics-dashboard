USE StockMarketAnalytics;
GO

IF OBJECT_ID('core.fact_stock_prices', 'U') IS NOT NULL
BEGIN
    DROP TABLE core.fact_stock_prices;
END;
GO

CREATE TABLE core.fact_stock_prices (

    stock_price_id         BIGINT IDENTITY(1,1) PRIMARY KEY,

    company_id             INT NOT NULL,

    trade_date             DATE NOT NULL,

    open_price             DECIMAL(18,4),
    high_price             DECIMAL(18,4),
    low_price              DECIMAL(18,4),
    close_price            DECIMAL(18,4),
    adj_close_price        DECIMAL(18,4),

    volume                 BIGINT,
    vwap                   DECIMAL(18,4),

    created_date           DATETIME DEFAULT GETDATE(),

    CONSTRAINT fk_company
        FOREIGN KEY (company_id)
        REFERENCES core.dim_companies(company_id)
);
GO