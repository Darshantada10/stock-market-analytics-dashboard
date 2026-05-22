# Analytical Methodology

## Objective

The objective of this project was to build a scalable analytics engineering and business intelligence solution capable of analyzing historical NIFTY 50 stock market behavior using SQL Server and Power BI.

The methodology focused on:
- structured ETL processing,
- analytical transformation,
- volatility measurement,
- anomaly detection,
- and interactive business intelligence reporting.

---

# Data Ingestion Methodology

Historical stock market data was provided as multiple CSV files containing company-level trading information.

The ingestion process included:
- dynamic file discovery,
- automated BULK INSERT processing,
- raw staging ingestion,
- and schema standardization.

The ETL workflow was designed to simulate real-world enterprise data engineering practices.

---

# Data Standardization Approach

Raw market data required:
- data type normalization,
- date conversion handling,
- numeric validation,
- and schema consistency verification.

TRY_CONVERT() functions and staging-layer transformations were used to safely standardize incoming data before loading analytical tables.

---

# Dimensional Modeling Strategy

The analytical model followed a star schema-inspired structure consisting of:
- dimension tables,
- fact tables,
- and analytical SQL views.

## Dimension Layer
The dimension table stored:
- company metadata,
- ticker information,
- and analytical identifiers.

## Fact Layer
The fact table stored:
- historical trading activity,
- OHLC pricing data,
- trading volume,
- and time-series analytical measurements.

This structure improved:
- analytical query readability,
- reporting scalability,
- and Power BI integration efficiency.

---

# Volatility Analysis Methodology

Volatility analysis was performed using rolling statistical calculations across historical trading periods.

The methodology focused on:
- rolling 30-day averages,
- daily return calculations,
- and comparative volatility ranking.

Window functions were used extensively to support:
- time-series analysis,
- rolling calculations,
- and company-level trend analysis.

---

# Daily Return Calculation Logic

Daily returns were calculated by comparing:
- current closing prices,
- against previous trading day closing prices.

LAG() window functions enabled efficient sequential market comparison across time periods.

This methodology supported:
- market movement tracking,
- anomaly detection,
- and comparative stock performance analysis.

---

# Anomaly Detection Methodology

Anomaly detection focused on identifying:
- abnormal stock movement behavior,
- significant volatility spikes,
- and unusually large return deviations.

The analysis compared:
- short-term market behavior,
- against rolling historical trends.

This approach enabled identification of:
- unstable market periods,
- abnormal trading sessions,
- and elevated investment risk conditions.

---

# Power BI Methodology

Power BI was used as the semantic and visualization layer for analytical reporting.

The dashboard methodology emphasized:
- executive KPI visibility,
- interactive exploration,
- dynamic filtering,
- and comparative company analysis.

DAX measures and interactive slicers were used to create:
- context-aware visuals,
- dynamic titles,
- and responsive analytical storytelling.

---

# Validation & Performance Methodology

Validation scripts were implemented to verify:
- row count consistency,
- duplicate detection,
- NULL handling,
- and financial data integrity.

Performance review scripts were added to:
- evaluate indexing structures,
- analyze query execution behavior,
- and document optimization strategies.

---

# Final Methodological Outcome

The final methodology successfully combined:
- analytics engineering,
- advanced SQL analysis,
- dimensional modeling,
- and business intelligence reporting

into a scalable end-to-end financial analytics solution.