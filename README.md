# stock-market-analytics-dashboard
NIFTY 50 stock market analytics project using SQL Server and Power BI. Consolidated 47 company datasets for anomaly detection, trend analysis, KPI reporting, and interactive dashboard visualization using advanced SQL and data modeling.

# NIFTY 50 Stock Market Anomaly Detection

## Project Overview
End-to-end analytics pipeline analyzing 47 NIFTY 50 companies' stock price movements to detect market anomalies and volatility patterns using advanced SQL and Power BI.

## Dataset
- **Source:** NIFTY 50 historical stock data (2000-2023)
- **Companies:** 47 stocks across multiple sectors
- **Records:** 2000+ trading days per company (~100K+ rows consolidated)
- **Columns:** Date, Open, High, Low, Close, Adj Close, Volume, VWAP

## Technology Stack
- **Database:** Microsoft SQL Server 2022
- **Analysis:** Advanced SQL (Window Functions, CTEs, Subqueries)
- **Visualization:** Microsoft Power BI Desktop
- **Version Control:** Git & GitHub

## Project Goals
1. Consolidate 47 separate CSV files into unified SQL Server database
2. Detect price anomalies using LAG/LEAD window functions
3. Calculate volatility metrics (daily returns, rolling std dev)
4. Identify market-moving events and trading opportunities
5. Build interactive Power BI dashboard for stakeholder insights

## Methodology
- **Anomaly Detection:** Price movements >1 std dev from rolling average
- **Volatility Analysis:** Daily return distribution, volatility spikes
- **Window Functions:** LAG/LEAD for comparative analysis across time periods
- **Segmentation:** Analysis by company, sector, time period

## Key Deliverables
- ✅ SQL Server schema & consolidated data pipeline
- ✅ Advanced SQL analysis queries (window functions, CTEs)
- ✅ Power BI interactive dashboard
- ✅ Anomaly detection & validation
- ✅ Insights & business recommendations

## Data Setup
1. Download NIFTY 50 dataset from Kaggle: https://www.kaggle.com/datasets/rockyjoseph/nifty-50-stock-market-data-2000-2023
2. Extract all 46 CSV files to: `data/raw/`
3. Run `sql/02_load_data.sql` to load data into SQL Server

## How to Use
1. Clone repository
2. Load NIFTY data into SQL Server using `sql/01_create_schema.sql`
3. Run analysis queries in `sql/` folder
4. Open `power-bi/stock_anomaly_dashboard.pbix` in Power BI Desktop

## Author
Darshan Tada
- Email: darshantadaofficial@gmail.com
- LinkedIn: www.linkedin.com/in/darshantada
- GitHub: https://github.com/Darshantada10