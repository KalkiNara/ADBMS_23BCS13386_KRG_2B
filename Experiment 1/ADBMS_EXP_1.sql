
-- AUTHOR-BOOK RELATIONSHIP

--Easy Problem

CREATE TABLE Author_Info (
    Author_id INT PRIMARY KEY,
    Author_name VARCHAR(MAX),
    Country VARCHAR(MAX)
);

CREATE TABLE Book_List (
    Book_id INT PRIMARY KEY,
    Book_title VARCHAR(MAX),
    AuthorId INT,
    FOREIGN KEY (AuthorId) REFERENCES Author_Info(Author_id)
);

INSERT INTO Author_Info (Author_id, Author_name, Country) VALUES
(1, 'Ravinder Singh', 'India'),
(2, 'Paulo Coelho', 'Brazil'),
(3, 'Arundhati Roy', 'India'),
(4, 'Dan Brown', 'United States'),
(5, 'Khaled Hosseini', 'Afghanistan'),
(6, 'Elif Shafak', 'Turkey');

INSERT INTO Book_List (Book_id, Book_title, AuthorId) VALUES
(201, 'I Too Had a Love Story', 1),
(202, 'The Alchemist', 2),
(203, 'The God of Small Things', 3),
(204, 'The Da Vinci Code', 4),
(205, 'The Kite Runner', 5),
(206, 'The Forty Rules of Love', 6);


SELECT b.Book_title AS 'Book Name', a.Author_name AS [Author Name], a.Country AS [Country]
FROM Book_List AS b
INNER JOIN Author_Info AS a
ON b.AuthorId = a.Author_id;

-- MEDIUM PROBLEM

CREATE TABLE Dept_Info (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

CREATE TABLE Subject (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Dept_Info(DeptID)
);

INSERT INTO Dept_Info VALUES
(1, 'Electronics'),
(2, 'Mechanical'),
(3, 'Civil Engineering'),
(4, 'AI & Robotics'),
(5, 'Humanities');

INSERT INTO Subject VALUES
(301, 'Digital Circuits', 1),
(302, 'Microcontrollers', 1),
(303, 'Thermodynamics', 2),
(304, 'Fluid Mechanics', 2),
(305, 'Structural Analysis', 3),
(306, 'Construction Planning', 3),
(307, 'Machine Learning', 4),
(308, 'Neural Networks', 4),
(309, 'Philosophy', 5),
(310, 'Signal Processing', 1),
(311, 'Embedded Systems', 1),
(312, 'Geotechnical Engineering', 3),
(313, 'Mechanics of Materials', 2);


SELECT D.DeptName,
(SELECT COUNT(*) FROM Subject C WHERE C.DeptID = D.DeptID) AS CourseCount
FROM Dept_Info D;


SELECT D.DeptName
FROM Dept_Info D
WHERE (SELECT COUNT(*) FROM Subject C WHERE C.DeptID = D.DeptID) >= 2;


CREATE LOGIN vaibhav_login WITH PASSWORD = 'Vaibhav@123';
CREATE USER vaibhav_user FOR LOGIN vaibhav_login;
EXECUTE AS USER = 'vaibhav_user';
GRANT SELECT ON Subject TO vaibhav_user;
