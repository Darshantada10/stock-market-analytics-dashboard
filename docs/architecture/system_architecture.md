# System Architecture

## End-to-End Analytics Workflow

```text
┌──────────────────────────────┐
│     NIFTY 50 CSV Files       │
│  (45 Company Datasets)       │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│      SQL Server Staging      │
│   staging.stock_prices_raw   │
│                              │
│ - BULK INSERT                │
│ - Dynamic SQL                │
│ - Data Standardization       │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│      Core Analytical Model   │
│                              │
│ core.dim_companies           │
│ core.fact_stock_prices       │
│                              │
│ - Dimensional Modeling       │
│ - Fact/Dimension Structure   │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│      Analytical SQL Layer    │
│                              │
│ - Daily Returns              │
│ - Rolling Volatility         │
│ - Anomaly Detection          │
│ - Market Movers Analysis     │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│        SQL Views Layer       │
│                              │
│ - Dashboard Summary Views    │
│ - Volatility Views           │
│ - Analytical Reporting Views │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│       Power BI Dashboard     │
│                              │
│ - Executive Overview         │
│ - Volatility Analysis        │
│ - KPI Reporting              │
│ - Interactive Analytics      │
└──────────────────────────────┘
```

---

# Architecture Summary

The system architecture follows a layered analytics engineering approach designed to simulate enterprise-grade financial analytics workflows.

The pipeline consists of:
- automated data ingestion,
- staging and transformation,
- dimensional analytical modeling,
- SQL-based analytics,
- and Power BI business intelligence reporting.

The layered structure improves:
- scalability,
- maintainability,
- analytical performance,
- and reporting organization.