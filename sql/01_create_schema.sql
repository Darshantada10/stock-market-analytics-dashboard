-- ============================================================================
-- NIFTY 50 Stock Market Analytics Dashboard
-- SQL Server Schema for Consolidated Stock Data
-- ============================================================================
USE StockMarketAnalytics;
-- Drop tables if they exist (for fresh start)
DROP TABLE IF EXISTS Stock_Prices;
DROP TABLE IF EXISTS Companies;

-- ============================================================================
-- 1. COMPANIES DIMENSION TABLE
-- ============================================================================
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName NVARCHAR(100) NOT NULL,
    Ticker NVARCHAR(50) NOT NULL UNIQUE,
    Sector NVARCHAR(50),
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- ============================================================================
-- 2. STOCK PRICES FACT TABLE
-- ============================================================================
CREATE TABLE Stock_Prices (
    PriceID BIGINT PRIMARY KEY IDENTITY(1,1),
    CompanyID INT NOT NULL,
    Date DATE NOT NULL,
    [Open] DECIMAL(10, 2),
    [High] DECIMAL(10, 2),
    [Low] DECIMAL(10, 2),
    [Close] DECIMAL(10, 2) NOT NULL,
    AdjClose DECIMAL(10, 2),
    Volume BIGINT,
    VWAP DECIMAL(10, 4),
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID),
    INDEX IX_Company_Date (CompanyID, Date)
);

-- ============================================================================
-- 3. INSERT COMPANY METADATA (From actual dataset - 47 companies)
-- ============================================================================
INSERT INTO Companies (CompanyName, Ticker, Sector) VALUES
('Adani Enterprises', 'ADANI_ENTERPRISES', 'Infrastructure'),
('Adani Ports', 'ADANI_PORTS', 'Ports & Shipping'),
('Apollo Hospitals', 'APOLLO HOSPITALS', 'Healthcare'),
('Asian Paints', 'ASIAN PAINTS', 'Consumer'),
('Axis Bank', 'AXIS_BANK', 'Banking'),
('Bajaj Auto', 'BAJAJ AUTO', 'Auto'),
('Bajaj Finance', 'BAJAJ_FINANCE', 'Finance'),
('Bajaj Finserv', 'BAJAJ_FINSERV', 'Finance'),
('Bharat Petroleum', 'BHARAT PETROLEUM', 'Energy'),
('Bharti Airtel', 'BHARTI_AIRTEL', 'Telecom'),
('Britannia', 'BRITANNIA', 'Consumer'),
('Cipla', 'CIPLA', 'Pharma'),
('Coal India', 'COAL INDIA', 'Energy'),
('Divis Lab', 'DIVIS LAB', 'Pharma'),
('Eicher Motors', 'EICHER MOTOTRS', 'Auto'),
('Grasim', 'GRASIM', 'Manufacturing'),
('HCL Technologies', 'HCL_TECHNOLOIES', 'IT'),
('HDFC Bank', 'HDFC_BANK', 'Banking'),
('HDFC Life', 'HDFC_LIFE', 'Insurance'),
('Hero MotoCorp', 'HERO MOTOCORP', 'Auto'),
('Hindalco', 'HINDALCO', 'Mining'),
('Hindustan Unilever', 'HINDUSTAN UNILEVER', 'Consumer'),
('ICICI Bank', 'ICICI_BANK', 'Banking'),
('Indus Industries', 'INDUS INDUSTRIES', 'Engineering'),
('Infosys', 'INFOSYS', 'IT'),
('ITC', 'ITC', 'Consumer'),
('JSW Steel', 'JSW STEEL', 'Steel'),
('Kotak Mahindra Bank', 'KOTAK_MAHINDRA', 'Banking'),
('Maruti Suzuki', 'MARUTI SUZUKI', 'Auto'),
('Nestlé India', 'NESTLE', 'Consumer'),
('NTPC', 'NTPC', 'Energy'),
('ONGC', 'ONGC', 'Energy'),
('Power Grid', 'POWERGRID', 'Energy'),
('Reliance', 'RELIANCE', 'Energy'),
('State Bank of India', 'SBI_BANK', 'Banking'),
('SBI Life', 'SBI_LIFE', 'Insurance'),
('Sun Pharma', 'SUN_PHARMA', 'Pharma'),
('TCS', 'TATA CONSULTANCY SERVICES', 'IT'),
('Tata Consumer Products', 'TATA CONSUMER PRODUCTS', 'Consumer'),
('Tata Motors', 'TATA MOTORS', 'Auto'),
('Tata Steel', 'TATA STEEL', 'Steel'),
('Tech Mahindra', 'TECH_MAHINDRA', 'IT'),
('Titan', 'TITAN', 'Consumer'),
('UltraTech Cement', 'ULTRATECH CEMENT', 'Construction'),
('UPL', 'UPL', 'Chemicals'),
('Wipro', 'WIPRO', 'IT');

-- ============================================================================
-- SCHEMA VERIFICATION
-- ============================================================================
-- Verify tables created
SELECT 'Companies' AS TableName, COUNT(*) AS RecordCount FROM Companies
UNION ALL
SELECT 'Stock_Prices', COUNT(*) FROM Stock_Prices;

-- List all companies
SELECT CompanyID, CompanyName, Ticker, Sector FROM Companies ORDER BY CompanyID;

PRINT 'Schema created successfully! Ready to load data.';