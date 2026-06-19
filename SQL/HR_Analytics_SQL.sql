USE HRAnalytics;
GO

--------------------------------------------------
-- DATA QUALITY CHECKS
--------------------------------------------------

-- Total Records
SELECT COUNT(*) AS TotalRows
FROM EmployeeAttrition_Import;

-- Missing Value Validation
SELECT
    COUNT(*) AS TotalRows,
    COUNT(Attrition) AS AttritionCount,
    COUNT(MonthlyIncome) AS IncomeCount
FROM EmployeeAttrition_Import;


--------------------------------------------------
-- ATTRITION KPI
--------------------------------------------------

-- Attrition Count
SELECT
    Attrition,
    COUNT(*) AS EmployeeCount
FROM EmployeeAttrition_Import
GROUP BY Attrition;

-- Attrition Rate
SELECT
    COUNT(*) AS TotalEmployees,
    SUM(CAST(Attrition AS INT)) AS EmployeesLeft,
    ROUND(
        (SUM(CAST(Attrition AS FLOAT)) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercent
FROM EmployeeAttrition_Import;


--------------------------------------------------
-- DEPARTMENT ANALYSIS
--------------------------------------------------

-- Employee Distribution by Department
SELECT
    Department,
    COUNT(*) AS EmployeeCount
FROM EmployeeAttrition_Import
GROUP BY Department
ORDER BY EmployeeCount DESC;

-- Attrition by Department
SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CAST(Attrition AS INT)) AS EmployeesLeft,
    ROUND(
        (SUM(CAST(Attrition AS FLOAT)) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercent
FROM EmployeeAttrition_Import
GROUP BY Department
ORDER BY AttritionRatePercent DESC;


--------------------------------------------------
-- OVERTIME ANALYSIS
--------------------------------------------------

SELECT
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CAST(Attrition AS INT)) AS EmployeesLeft,
    ROUND(
        (SUM(CAST(Attrition AS FLOAT)) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercent
FROM EmployeeAttrition_Import
GROUP BY OverTime
ORDER BY AttritionRatePercent DESC;


--------------------------------------------------
-- INCOME VS ATTRITION
--------------------------------------------------

SELECT
    Attrition,
    AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM EmployeeAttrition_Import
GROUP BY Attrition;


--------------------------------------------------
-- JOB SATISFACTION ANALYSIS
--------------------------------------------------

SELECT
    JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CAST(Attrition AS INT)) AS EmployeesLeft,
    ROUND(
        (SUM(CAST(Attrition AS FLOAT)) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercent
FROM EmployeeAttrition_Import
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


--------------------------------------------------
-- WORK-LIFE BALANCE ANALYSIS
--------------------------------------------------

SELECT
    WorkLifeBalance,
    COUNT(*) AS TotalEmployees,
    SUM(CAST(Attrition AS INT)) AS EmployeesLeft,
    ROUND(
        (SUM(CAST(Attrition AS FLOAT)) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercent
FROM EmployeeAttrition_Import
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


--------------------------------------------------
-- GENDER ANALYSIS
--------------------------------------------------

SELECT
    Gender,
    COUNT(*) AS TotalEmployees,
    SUM(CAST(Attrition AS INT)) AS EmployeesLeft,
    ROUND(
        (SUM(CAST(Attrition AS FLOAT)) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercent
FROM EmployeeAttrition_Import
GROUP BY Gender
ORDER BY AttritionRatePercent DESC;


--------------------------------------------------
-- JOB ROLE ATTRITION ANALYSIS
--------------------------------------------------

SELECT
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CAST(Attrition AS INT)) AS EmployeesLeft,
    ROUND(
        (SUM(CAST(Attrition AS FLOAT)) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercent
FROM EmployeeAttrition_Import
GROUP BY JobRole
ORDER BY AttritionRatePercent DESC;


--------------------------------------------------
-- TENURE ANALYSIS
--------------------------------------------------

SELECT
    Attrition,
    AVG(YearsAtCompany) AS AvgYearsAtCompany
FROM EmployeeAttrition_Import
GROUP BY Attrition;