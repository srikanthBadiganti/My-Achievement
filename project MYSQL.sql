Create database InsuranceAnalytics;
Use InsuranceAnalytics;

CREATE TABLE MetricsData (
    Segment VARCHAR(50),
    MetricType VARCHAR(50),
    Value DECIMAL(10, 2)
);


CREATE TABLE KPIData (
    Segment VARCHAR(50),
    KPIType VARCHAR(50),
    Value DECIMAL(10, 2)  -- Percent values
);

INSERT INTO MetricsData (Segment, MetricType, Value)
VALUES
    ('Cross Sell', 'Target', 7.29),
    ('Cross Sell', 'Achieved', 13.00),
    ('Cross Sell', 'Invoice', 2.85),
    ('New', 'Target', 4.1),
    ('New', 'Achieved', 34.42),
    ('New', 'Invoice', 0.57),
	('Renewal', 'Target', 9.52),
    ('Renewal', 'Achieved', 17.81),
    ('Renewal', 'Invoice',7.94);
    
INSERT INTO KPIData (Segment, KPIType, Value)
VALUES
    ('Cross Sell', 'Plcd Achvmnt %', 178.39),
    ('Cross Sell', 'Invoice Achvmnt %', 39.15),
      ('New', 'Plcd Achvmnt %', 82.47),
    ('New', 'Invoice Achvmnt %', 13.9),
     ('Renewal', 'Plcd Achvmnt %', 210.76),
    ('Renewal', 'Invoice Achvmnt %', 98.99);
    
    
# segment Cross sell,New,Renewal and KPI Cards

describe MetricsData;

Describe KPIData;

select * from MetricsData;

select * from KPIData;

    SELECT
    m.Segment,
    
    MAX(CASE WHEN m.MetricType = 'Target' THEN m.Value END) AS Target_Million,
    MAX(CASE WHEN m.MetricType = 'Achieved' THEN m.Value END) AS Achieved_Million,
    MAX(CASE WHEN m.MetricType = 'Invoice' THEN m.Value END) AS Invoice_Million,

    MAX(CASE WHEN k.KPIType = 'Plcd Achvmnt %' THEN k.Value END) AS Plcd_Achvmnt_Percent,
    MAX(CASE WHEN k.KPIType = 'Invoice Achvmnt %' THEN k.Value END) AS Invoice_Achvmnt_Percent

FROM MetricsData m
LEFT JOIN KPIData k ON m.Segment = k.Segment
GROUP BY m.Segment;

   # Yearly Meeting Count
   
    CREATE TABLE Meetings (
    MeetingID INT ,
    MeetingDate DATE,
    AccountExecutive VARCHAR(100)
);

INSERT INTO Meetings (MeetingID, AccountExecutive, MeetingDate) VALUES
(2,  'Abhinav Shivam',   '2019-10-17'),
(2,  'Abhinav Shivam',   '2019-10-17'),
(2,  'Abhinav Shivam',   '2019-12-24'),
(2,  'Abhinav Shivam',   '2020-01-03'),
(2,  'Abhinav Shivam',   '2020-01-08'),
(2,  'Abhinav Shivam',   '2020-01-08'),
(2,  'Abhinav Shivam',   '2020-01-09'),
(1,  'Vinay',            '2020-01-02'),
(1,  'Vinay',            '2020-01-03'),
(1,  'Vinay',            '2020-01-06'),
(1,  'Vinay',            '2020-01-07'),
(1,  'Vinay',            '2020-01-08'),
(3,  'Animesh Rawat',    '2020-01-13'),
(3,  'Animesh Rawat',    '2020-01-13'),
(3,  'Animesh Rawat',    '2020-01-09'),
(3,  'Animesh Rawat',    '2020-01-10'),
(6,  'Ketan Jain',       '2020-01-03'),
(6,  'Ketan Jain',       '2020-01-08'),
(6,  'Ketan Jain',       '2020-01-13'),
(6,  'Ketan Jain',       '2020-01-09'),
(4,  'Gilbert',          '2020-01-06'),
(4,  'Gilbert',          '2020-01-20'),
(4,  'Gilbert',          '2020-01-20'),
(12, 'Shivani Sharma',   '2020-01-21'),
(12, 'Shivani Sharma',   '2020-01-21'),
(12, 'Shivani Sharma',   '2020-01-21'),
(12, 'Shivani Sharma',   '2020-01-22'),
(9,  'Manish Sharma',    '2020-01-13'),
(9,  'Manish Sharma',    '2020-01-09'),
(9,  'Manish Sharma',    '2020-01-21'),
(11, 'Raju Kumar',       '2020-01-22'),
(11, 'Raju Kumar',       '2020-01-20'),
(10, 'Mark',             '2020-01-22'),
(10, 'Mark',             '2020-01-13');

SELECT 
    YEAR(MeetingDate) AS Year,
    COUNT(*) AS Meeting_Count
FROM Meetings
WHERE MeetingDate IS NOT NULL
GROUP BY YEAR(MeetingDate)
ORDER BY Year;

# No of Meeting By Acct Executive

SELECT 
    AccountExecutive,
    COUNT(*) AS Meeting_Count
FROM Meetings
GROUP BY AccountExecutive
ORDER BY Meeting_Count DESC;

# No Of Invoices By Acct Executives

CREATE TABLE Invoices (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    AccountExecutive VARCHAR(100),
    IncomeClass VARCHAR(100), 
    InvoiceDate DATE
);

Drop Table invoices ;

-- -- Renewal - Divya Dhingra (52 times)
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Divya Dhingra', 'Renewal'
FROM information_schema.columns
LIMIT 52;

-- Cross Sell - Divya Dhingra (19 times)
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Divya Dhingra', 'Cross Sell'
FROM information_schema.columns
LIMIT 19;

-- New - Divya Dhingra (5 times)
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Divya Dhingra', 'New'
FROM information_schema.columns
LIMIT 5;

-- Null - Ankita Shah (18 times)
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Ankita Shah', NULL
FROM information_schema.columns
LIMIT 18;

-- Shloka Shelat
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Shloka Shelat', 'New' FROM information_schema.columns LIMIT 7;
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Shloka Shelat', 'Cross Sell' FROM information_schema.columns LIMIT 20;
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Shloka Shelat', 'Renewal' FROM information_schema.columns LIMIT 3;

-- Vidit Shah
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Vidit Shah', 'Renewal' FROM information_schema.columns LIMIT 15;
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Vidit Shah', 'Cross Sell' FROM information_schema.columns LIMIT 12;

-- Shobhit Agarwal
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Shobhit Agarwal', 'New' FROM information_schema.columns LIMIT 8;
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Shobhit Agarwal', 'Renewal' FROM information_schema.columns LIMIT 2;
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Shobhit Agarwal', 'Cross Sell' FROM information_schema.columns LIMIT 4;

-- Nishant Sharma
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Nishant Sharma', 'Cross Sell' FROM information_schema.columns LIMIT 10;

-- Neel Jain
INSERT INTO Invoices (AccountExecutive, IncomeClass)
SELECT 'Neel Jain', 'New' FROM information_schema.columns LIMIT 1;

SELECT 
    AccountExecutive,
    COUNT(*) AS TotalInvoices,
    SUM(CASE WHEN IncomeClass = 'New' THEN 1 ELSE 0 END) AS New,
    SUM(CASE WHEN IncomeClass = 'Renewal' THEN 1 ELSE 0 END) AS Renewal,
    SUM(CASE WHEN IncomeClass = 'Cross Sell' THEN 1 ELSE 0 END) AS CrossSell,
    SUM(CASE WHEN IncomeClass IS NULL THEN 1 ELSE 0 END) AS NullCount
FROM Invoices
GROUP BY AccountExecutive
ORDER BY TotalInvoices DESC;

# total opportunities and total open opportunities 

CREATE TABLE Opportunities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(255),
    type VARCHAR(255)
);
drop table Opportunities;
-- Insert values for "Total Opportunities"
INSERT INTO Opportunities (status, type) VALUES
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Negotiate', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Negotiate', 'Total Opportunities'),
('Negotiate', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Negotiate', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Propose Solution', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Negotiate', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities'),
('Propose Solution', 'Total Opportunities'),
('Qualify Opportunity', 'Total Opportunities');

-- Insert values for "Total Open Opportunities" (excluding Negotiate)
INSERT INTO Opportunities (status, type) VALUES
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Propose Solution', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities'),
('Qualify Opportunity', 'Total Open Opportunities');

SELECT type, COUNT(*) AS count
FROM Opportunities
GROUP BY type;

# Oppty By Revenue Top-4

CREATE TABLE Opportunities2 (
    opportunity_name VARCHAR(255),
    opportunity_id VARCHAR(255) PRIMARY KEY,
    account_exe_id INT,
    account_executive VARCHAR(255),
    premium_amount INT,
    revenue_amount INT
);
INSERT INTO Opportunities2 (opportunity_name, opportunity_id, account_exe_id, account_executive, premium_amount, revenue_amount)
VALUES
('EL-Group Mediclaim', 'OPP1900001042', 3, 'Animesh Rawat', 8000000, 400000),
('AL GPA', 'OPP1900001047', 1, 'Vinay', 200000, 30000),
('BL - Marine STOP', 'OPP1900001048', 1, 'Vinay', 0, 100000),
('II-Marine', 'OPP1900001050', 1, 'Vinay', 0, 100000),
('PIL-Credit Insurance', 'OPP1900001051', 1, 'Vinay', 1200000, 100000),
('PIL-CGL', 'OPP1900001052', 1, 'Vinay', 0, 100000),
('PIL -Marine', 'OPP1900001053', 1, 'Vinay', 0, 100000),
('SGL- GMC', 'OPP1900001054', 1, 'Vinay', 0, 125000),
('Sandesh - Marine', 'OPP1900001055', 1, 'Vinay', 0, 100000),
('VS.-Marine', 'OPP1900001056', 12, 'Shivani Sharma', 0, 200000),
('II -  GMC', 'OPP1900001057', 12, 'Shivani Sharma', 0, 75000),
('II - GPA', 'OPP1900001058', 12, 'Shivani Sharma', 0, 25000),
('G R -GMC', 'OPP1900001072', 12, 'Shivani Sharma', 2000000, 150000),
('DB- Cyber Liability', 'OPP1900001138', 12, 'Shivani Sharma', 500000, 75000),
('KB GMC', 'OPP1900001222', 3, 'Animesh Rawat', 2500000, 125000),
('EI- GMC', 'OPP1900001364', 10, 'Mark', 1400000, 100000),
('CVP GMC', 'OPP1900001365', 10, 'Mark', 4500000, 350000),
('Sin GMC', 'OPP1900001366', 3, 'Animesh Rawat', 9500000, 200000),
('FM-Group Mediclaim', 'OPP1900001390', 10, 'Mark', 4500000, 300000),
('Stem GMC', 'OPP1900001391', 3, 'Animesh Rawat', 0, 100000),
('DS- Employees GMC', 'OPP1900001392', 3, 'Animesh Rawat', 6000000, 300000),
('BVGMC', 'OPP1900001393', 10, 'Mark', 600000, 100000),
('BV GPA', 'OPP1900001394', 10, 'Mark', 210000, 35000),
('GL-CGL', 'OPP1900001655', 10, 'Mark', 300000, 49500),
('GL-Crime', 'OPP1900001656', 10, 'Mark', 300000, 49500),
('OP-GMC', 'OPP1900001803', 10, 'Mark', 5000000, 250000),
('Marine', 'OPP1900001843', 3, 'Animesh Rawat', 0, 100000),
('ITNL - IAR (Operational Roads)', 'OPP1900001906', 12, 'Shivani Sharma', 90000000, 200000),
('Maine Open', 'OPP1900001923', 3, 'Animesh Rawat', 0, 10000),
('BD PDBI', 'OPP1900001937', 6, 'Ketan Jain', 0, 50000),
('CI-CAR/EAR Policy', 'OPP1900001938', 6, 'Ketan Jain', 300000, 30000),
('Sandesh - PDBI', 'OPP1900001939', 6, 'Ketan Jain', 0, 200000),
('VS-PDBI', 'OPP1900001940', 6, 'Ketan Jain', 300000, 50000),
('ag - Property Insurance', 'OPP1900001941', 6, 'Ketan Jain', 1000000, 100000),
('BE-Mega policy', 'OPP1900001942', 6, 'Ketan Jain', 0, 300000),
('BC - PDBI', 'OPP1900001943', 6, 'Ketan Jain', 0, 200000),
('CP-PDBI', 'OPP1900001944', 6, 'Ketan Jain', 0, 200000),
('DB -Mega Policy', 'OPP1900001945', 6, 'Ketan Jain', 0, 400000),
('DB -Terrorism Policy', 'OPP1900001946', 12, 'Shivani Sharma', 0, 300000),
('KG-CAR', 'OPP1900001947', 12, 'Shivani Sharma', 500000, 50000),
('G R -CAR', 'OPP1900001950', 12, 'Shivani Sharma', 1000000, 100000),
('SI-CAR', 'OPP1900001975', 10, 'Mark', 500000, 62000),
('GRTC-CAR', 'OPP1900001976', 10, 'Mark', 300000, 37500),
('PDBI', 'OPP1900002004', 3, 'Animesh Rawat', 700000, 100000),
('Infra-CAR', 'OPP1900002039', 10, 'Mark', 800000, 50000),
('Fire', 'OPP1900002070', 3, 'Animesh Rawat', 0, 500000),
('PI(Operational Road)', 'OPP1900002092', 12, 'Shivani Sharma', 1000000, 100000),
('SFSP', 'OPP1900002098', 3, 'Animesh Rawat', 0, 50000),
('VS.-D & O', 'OPP1900002104', 12, 'Shivani Sharma', 0, 50000);

SELECT opportunity_name, revenue_amount
FROM Opportunities2
ORDER BY revenue_amount DESC
LIMIT 4;

# stage funnel by revenue

CREATE TABLE StageFunnel (
    revenue_amount INT,
    closing_date DATE,
    stage VARCHAR(255)
);

INSERT INTO StageFunnel (revenue_amount, closing_date, stage)
VALUES
(400000, '2019-11-13', 'Qualify Opportunity'),
(30000, '2020-03-31', 'Qualify Opportunity'),
(100000, '2020-06-30', 'Qualify Opportunity'),
(100000, '2020-03-31', 'Qualify Opportunity'),
(100000, '2020-03-31', 'Qualify Opportunity'),
(100000, '2020-05-31', 'Qualify Opportunity'),
(100000, '2020-05-31', 'Qualify Opportunity'),
(125000, '2020-06-30', 'Qualify Opportunity'),
(100000, '2020-03-31', 'Qualify Opportunity'),
(200000, '2020-03-31', 'Qualify Opportunity'),
(75000, '2020-03-31', 'Qualify Opportunity'),
(25000, '2020-03-31', 'Qualify Opportunity'),
(150000, '2020-05-31', 'Qualify Opportunity'),
(75000, '2020-05-31', 'Qualify Opportunity'),
(125000, '2019-12-01', 'Qualify Opportunity'),
(100000, '2019-12-09', 'Qualify Opportunity'),
(350000, '2019-12-11', 'Qualify Opportunity'),
(200000, '2019-09-30', 'Negotiate'),
(300000, '2019-10-29', 'Qualify Opportunity'),
(100000, '2019-11-15', 'Qualify Opportunity'),
(300000, '2019-12-01', 'Qualify Opportunity'),
(100000, '2019-11-30', 'Qualify Opportunity'),
(35000, '2019-11-30', 'Qualify Opportunity'),
(49500, '2019-09-30', 'Negotiate'),
(49500, '2019-09-30', 'Negotiate'),
(250000, '2019-11-30', 'Qualify Opportunity'),
(100000, '2019-10-31', 'Negotiate'),
(200000, '2020-08-31', 'Qualify Opportunity'),
(10000, '2019-09-30', 'Propose Solution'),
(50000, '2020-03-31', 'Qualify Opportunity'),
(30000, '2020-03-31', 'Qualify Opportunity'),
(200000, '2020-03-31', 'Qualify Opportunity'),
(50000, '2020-03-31', 'Qualify Opportunity'),
(100000, '2020-07-31', 'Qualify Opportunity'),
(300000, '2020-06-30', 'Qualify Opportunity'),
(200000, '2020-06-30', 'Qualify Opportunity'),
(200000, '2020-06-30', 'Qualify Opportunity'),
(400000, '2020-06-30', 'Qualify Opportunity'),
(300000, '2020-06-30', 'Qualify Opportunity'),
(50000, '2019-12-31', 'Qualify Opportunity'),
(100000, '2019-09-30', 'Qualify Opportunity'),
(62000, '2019-09-30', 'Qualify Opportunity'),
(37500, '2019-09-30', 'Qualify Opportunity'),
(100000, '2019-12-31', 'Qualify Opportunity'),
(50000, '2019-09-30', 'Qualify Opportunity'),
(500000, '2019-10-01', 'Negotiate'),
(100000, '2019-12-31', 'Qualify Opportunity'),
(50000, '2019-09-30', 'Propose Solution'),
(50000, '2020-03-31', 'Qualify Opportunity');

SELECT stage, SUM(revenue_amount) AS total_revenue
FROM StageFunnel
GROUP BY stage
ORDER BY total_revenue DESC;

# Oppty Product Distribution

CREATE TABLE OpportunityProductDistribution (
    opportunity_id VARCHAR(255) PRIMARY KEY,
    account_exe_id INT,
    account_executive VARCHAR(255),
    premium_amount INT,
    revenue_amount INT,
    closing_date DATE,
    stage VARCHAR(255),
    branch VARCHAR(255),
    specialty VARCHAR(255),
    product_group VARCHAR(255)
);

INSERT INTO OpportunityProductDistribution (
    opportunity_id, account_exe_id, account_executive, premium_amount, revenue_amount, 
    closing_date, stage, branch, specialty, product_group
)
VALUES
('OPP1900001042', 3, 'Animesh Rawat', 8000000, 400000, '2019-11-13', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001047', 1, 'Vinay', 200000, 30000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001048', 1, 'Vinay', 0, 100000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('OPP1900001050', 1, 'Vinay', 0, 100000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('OPP1900001051', 1, 'Vinay', 1200000, 100000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Trade Credit & Political Risk', 'Miscellaneous'),
('OPP1900001052', 1, 'Vinay', 0, 100000, '2020-05-31', 'Qualify Opportunity', 'Ahmedabad', 'Liability', 'Liability'),
('OPP1900001053', 1, 'Vinay', 0, 100000, '2020-05-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('OPP1900001054', 1, 'Vinay', 0, 125000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001055', 1, 'Vinay', 0, 100000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('OPP1900001056', 12, 'Shivani Sharma', 0, 200000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('OPP1900001057', 12, 'Shivani Sharma', 0, 75000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001058', 12, 'Shivani Sharma', 0, 25000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001072', 12, 'Shivani Sharma', 2000000, 150000, '2020-05-31', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001138', 12, 'Shivani Sharma', 500000, 75000, '2020-05-31', 'Qualify Opportunity', 'Ahmedabad', 'Liability', 'Liability'),
('OPP1900001222', 3, 'Animesh Rawat', 2500000, 125000, '2019-12-01', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001364', 10, 'Mark', 1400000, 100000, '2019-12-09', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001365', 10, 'Mark', 4500000, 350000, '2019-12-11', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Miscellaneous'),
('OPP1900001366', 3, 'Animesh Rawat', 9500000, 200000, '2019-09-30', 'Negotiate', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001390', 10, 'Mark', 4500000, 300000, '2019-10-29', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001391', 3, 'Animesh Rawat', 0, 100000, '2019-11-15', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001392', 3, 'Animesh Rawat', 6000000, 300000, '2019-12-01', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001393', 10, 'Mark', 600000, 100000, '2019-11-30', 'Qualify Opportunity', 'Ahmedabad', 'Emerging Corporates Group (ECG)', 'Employee Benefits'),
('OPP1900001394', 10, 'Mark', 210000, 35000, '2019-11-30', 'Qualify Opportunity', 'Ahmedabad', 'Emerging Corporates Group (ECG)', 'Employee Benefits'),
('OPP1900001655', 10, 'Mark', 300000, 49500, '2019-09-30', 'Negotiate', 'Ahmedabad', 'Liability', 'Liability'),
('OPP1900001656', 10, 'Mark', 300000, 49500, '2019-09-30', 'Negotiate', 'Ahmedabad', 'Liability', 'Liability'),
('OPP1900001803', 10, 'Mark', 5000000, 250000, '2019-11-30', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('OPP1900001843', 3, 'Animesh Rawat', 0, 100000, '2019-10-31', 'Negotiate', 'Ahmedabad', 'Marine', 'Marine'),
('OPP1900001906', 12, 'Shivani Sharma', 90000000, 200000, '2020-08-31', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001923', 3, 'Animesh Rawat', 0, 10000, '2019-09-30', 'Propose Solution', 'Ahmedabad', 'Marine', 'Marine'),
('OPP1900001937', 6, 'Ketan Jain', 0, 50000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001938', 6, 'Ketan Jain', 300000, 30000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Construction, Power & Infrastructure', 'Engineering'),
('OPP1900001939', 6, 'Ketan Jain', 0, 200000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001940', 6, 'Ketan Jain', 300000, 50000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001941', 6, 'Ketan Jain', 1000000, 100000, '2020-07-31', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001942', 6, 'Ketan Jain', 0, 300000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001943', 6, 'Ketan Jain', 0, 200000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001944', 6, 'Ketan Jain', 0, 200000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001945', 6, 'Ketan Jain', 0, 400000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900001946', 12, 'Shivani Sharma', 0, 300000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Crises Mgmt / Terr / Political Risks / K&R', 'Terrorism'),
('OPP1900001947', 12, 'Shivani Sharma', 500000, 50000, '2019-12-31', 'Qualify Opportunity', 'Ahmedabad', 'Construction, Power & Infrastructure', 'Engineering'),
('OPP1900001950', 12, 'Shivani Sharma', 1000000, 100000, '2019-09-30', 'Qualify Opportunity', 'Ahmedabad', 'Construction, Power & Infrastructure', 'Engineering'),
('OPP1900001975', 10, 'Mark', 500000, 62000, '2019-09-30', 'Qualify Opportunity', 'Ahmedabad', 'Construction, Power & Infrastructure', 'Engineering'),
('OPP1900001976', 10, 'Mark', 300000, 37500, '2019-09-30', 'Qualify Opportunity', 'Ahmedabad', 'Construction, Power & Infrastructure', 'Engineering'),
('OPP1900002004', 3, 'Animesh Rawat', 700000, 100000, '2019-12-31', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900002039', 10, 'Mark', 800000, 50000, '2019-09-30', 'Qualify Opportunity', 'Ahmedabad', 'Construction, Power & Infrastructure', 'Engineering'),
('OPP1900002070', 3, 'Animesh Rawat', 0, 500000, '2019-10-01', 'Negotiate', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900002092', 12, 'Shivani Sharma', 1000000, 100000, '2019-12-31', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900002098', 3, 'Animesh Rawat', 0, 50000, '2019-09-30', 'Propose Solution', 'Ahmedabad', 'Property / BI', 'Fire'),
('OPP1900002104', 12, 'Shivani Sharma', 0, 50000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Liability', 'Liability');

SELECT product_group, COUNT(*) AS opportunity_count
FROM OpportunityProductDistribution
GROUP BY product_group
ORDER BY opportunity_count DESC;

# Open Oppty Top-4

CREATE TABLE Opportunities3 (
    opportunity_name VARCHAR(255),
    opportunity_id VARCHAR(255) PRIMARY KEY,
    account_exe_id INT,
    account_executive VARCHAR(255),
    premium_amount INT,
    revenue_amount INT,
    closing_date DATE,
    stage VARCHAR(255),
    branch VARCHAR(255),
    specialty VARCHAR(255),
    product_group VARCHAR(255)
);
INSERT INTO Opportunities3 (
    opportunity_name, opportunity_id, account_exe_id, account_executive, premium_amount, revenue_amount, 
    closing_date, stage, branch, specialty, product_group
)
VALUES
('EL-Group Mediclaim', 'OPP1900001042', 3, 'Animesh Rawat', 8000000, 400000, '2019-11-13', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('AL GPA', 'OPP1900001047', 1, 'Vinay', 200000, 30000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('BL - Marine STOP', 'OPP1900001048', 1, 'Vinay', 0, 100000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('II-Marine', 'OPP1900001050', 1, 'Vinay', 0, 100000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('PIL-Credit Insurance', 'OPP1900001051', 1, 'Vinay', 1200000, 100000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Trade Credit & Political Risk', 'Miscellaneous'),
('PIL-CGL', 'OPP1900001052', 1, 'Vinay', 0, 100000, '2020-05-31', 'Qualify Opportunity', 'Ahmedabad', 'Liability', 'Liability'),
('PIL -Marine', 'OPP1900001053', 1, 'Vinay', 0, 100000, '2020-05-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('SGL- GMC', 'OPP1900001054', 1, 'Vinay', 0, 125000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('Sandesh - Marine', 'OPP1900001055', 1, 'Vinay', 0, 100000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),
('VS.-Marine', 'OPP1900001056', 12, 'Shivani Sharma', 0, 200000, '2020-03-31', 'Qualify Opportunity', 'Ahmedabad', 'Marine', 'Marine'),

('CVP GMC', 'OPP1900001365', 10, 'Mark', 4500000, 350000, '2019-12-11', 'Qualify Opportunity', 'Ahmedabad', 'Employee Benefits (EB)', 'Employee Benefits'),
('DB-Mega Policy', 'OPP1900001945', 6, 'Ketan Jain', 0, 400000, '2020-06-30', 'Qualify Opportunity', 'Ahmedabad', 'Property / BI', 'Fire');

SELECT opportunity_name, revenue_amount
FROM Opportunities3
WHERE stage = 'Qualify Opportunity'
ORDER BY revenue_amount DESC
LIMIT 4;
