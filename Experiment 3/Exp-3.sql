USE VaibhavDB;

-- EASY LEVEL

CREATE TABLE WorkerIDs (
    WID INT
);

INSERT INTO WorkerIDs (WID) VALUES
(3),
(5),
(5),
(9),
(9),
(11),
(12),
(12);

SELECT MAX(WID) AS [Maximum Unique ID]
FROM (
    SELECT WID 
    FROM WorkerIDs 
    GROUP BY WID 
    HAVING COUNT(*) < 2
) AS UniqueIDs;


-- MEDIUM LEVEL

CREATE TABLE DeptTable (
    DeptID INT PRIMARY KEY,
    DeptTitle VARCHAR(50)
);

CREATE TABLE StaffTable (
    StaffID INT,
    StaffName VARCHAR(50),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES DeptTable(DeptID)
);

INSERT INTO DeptTable (DeptID, DeptTitle) VALUES
(1, 'HR'),
(2, 'TECH');

INSERT INTO StaffTable (StaffID, StaffName, Salary, DeptID) VALUES
(1, 'Arjun', 55000, 1),
(2, 'Meera', 72000, 1),
(3, 'Kabir', 67000, 2),
(4, 'Sana', 50000, 2),
(5, 'Rohit', 72000, 1);

SELECT D.DeptTitle, S.StaffName, S.Salary
FROM DeptTable AS D
JOIN StaffTable AS S
ON D.DeptID = S.DeptID
WHERE S.Salary IN (
    SELECT MAX(S2.Salary) 
    FROM StaffTable AS S2 
    WHERE S2.DeptID = S.DeptID
);


-- HARD LEVEL

CREATE TABLE X1 (
    PID INT,
    PName VARCHAR(50),
    Income INT
);

CREATE TABLE Y1 (
    PID INT,
    PName VARCHAR(50),
    Income INT
);

INSERT INTO X1 VALUES (1, 'Dev', 2000);
INSERT INTO X1 VALUES (2, 'Neel', 700);
INSERT INTO Y1 VALUES (2, 'Neel', 900);
INSERT INTO Y1 VALUES (3, 'Tara', 300);

SELECT PID, PName, MIN(Income) AS Min_Income
FROM (
    SELECT * FROM X1
    UNION ALL
    SELECT * FROM Y1
) AS Combined
GROUP BY PID, PName;
