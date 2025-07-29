-- QUESTION 1: MEDIUM
-- Problem Title: Team Reporting Structure Visualization

CREATE TABLE StaffDetails (
    StaffID INT IDENTITY(1,1),
    StaffName VARCHAR(MAX),
    Dept VARCHAR(MAX),
    HeadID INT
);

INSERT INTO StaffDetails (StaffName, Dept, HeadID)
VALUES 
('Neha', 'Marketing', NULL),
('Aman', 'Sales', 1),
('Riya', 'Tech', 1),
('Karan', 'Sales', 2),
('Ishita', 'Tech', 3),
('Mohit', 'Marketing', 1);

SELECT S1.StaffName AS [Employee Name], 
       S2.StaffName AS [Manager Name],
       S1.Dept AS [Employee Dept], 
       S2.Dept AS [Manager Dept]
FROM StaffDetails AS S1
LEFT OUTER JOIN StaffDetails AS S2
ON S1.HeadID = S2.StaffID;


-- QUESTION 2: HARD
-- Problem Title: Investment Data Merge with Default Handling

CREATE TABLE InvestmentData (
    InstrumentID INT,
    RecordYear INT,
    NetValue INT
);

INSERT INTO InvestmentData 
VALUES 
(101, 2020, 75),
(108, 2022, 50),
(113, 2021, 40),
(101, 2021, 110),
(102, 2015, 95),
(103, 2016, 22),
(111, 2022, 17),
(108, 2021, 0);

CREATE TABLE RequestLog (
    InstrumentID INT,
    QueryYear INT
);

INSERT INTO RequestLog 
VALUES 
(101, 2021),
(102, 2015),
(103, 2016),
(108, 2020),
(108, 2021),
(108, 2022),
(113, 2021);

SELECT R.InstrumentID, R.QueryYear, ISNULL(I.NetValue, 0) AS NPV
FROM RequestLog AS R
LEFT OUTER JOIN InvestmentData AS I
ON R.InstrumentID = I.InstrumentID AND R.QueryYear = I.RecordYear
ORDER BY R.InstrumentID, R.QueryYear;
