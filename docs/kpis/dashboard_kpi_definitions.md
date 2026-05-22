# Dashboard KPI Definitions

## Objective

This document defines the primary KPIs used within the Stock Market Analytics Dashboard and explains their analytical and business significance.

---

# KPI Definitions

## 1. Total Trading Records

### Description
Represents the total number of processed stock market trading records loaded into the analytical database.

### Business Purpose
Measures overall dataset scale and validates successful ETL ingestion.

### Source
- core.fact_stock_prices

---

## 2. Total Companies Analyzed

### Description
Represents the number of distinct NIFTY 50 companies included in the analysis.

### Business Purpose
Provides visibility into analytical market coverage and comparative analysis scope.

### Source
- core.dim_companies

---

## 3. Rolling 30-Day Volatility

### Description
Measures short-term stock price variability using rolling window calculations.

### Business Purpose
Helps identify:
- unstable market behavior,
- elevated investment risk,
- and abnormal volatility periods.

### Analytical Logic
Calculated using rolling window statistical analysis across 30 trading days.

---

## 4. Daily Return Percentage

### Description
Represents percentage change between current and previous closing prices.

### Business Purpose
Tracks short-term market movement and comparative stock performance.

### Analytical Logic
Calculated using:
- current close price,
- previous close price,
- percentage return formula.

---

## 5. Top Volatile Companies

### Description
Ranks companies based on average rolling volatility metrics.

### Business Purpose
Identifies companies demonstrating highest market instability and risk exposure.

### Dashboard Usage
Used within:
- Top-N volatility ranking visuals,
- comparative market analysis,
- and executive reporting.

---

## 6. Market Movers

### Description
Highlights trading periods with abnormal stock movement behavior.

### Business Purpose
Supports:
- anomaly detection,
- risk monitoring,
- and unusual market activity analysis.

### Dashboard Usage
Displayed within:
- volatility analysis tables,
- conditional formatting visuals,
- and anomaly investigation workflows.

---

# KPI Interpretation Notes

- Higher volatility values indicate greater market instability.
- Extreme daily return percentages may indicate abnormal market events.
- KPI values should be interpreted within selected time filters and company contexts.
- Rolling calculations smooth short-term fluctuations to reveal broader market behavior trends.