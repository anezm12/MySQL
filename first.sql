CREATE TABLE emp_details(
	Name varchar(25),
    Age int,
    Gender char(1),
    DOJ date,
    City varchar(15),
    Salary float
    
    
);

USE sample;
DESC emp_details;

ALTER TABLE emp_details
ADD COLUMN Role VARCHAR (100);

ALTER TABLE emp_details
MODIFY COLUMN Role VARCHAR (100) AFTER City;

ALTER TABLE emp_details
RENAME COLUMN DOJ TO DOB;

INSERT INTO emp_details (Name, Age, Gender, DOB, City, Role, Salary)
VALUES ('Jose', 28, 'M', '1995-01-12', 'Dallas', 'Data Engineer', 85000);

SELECT * FROM emp_details;

INSERT INTO emp_details (Name, Age, Gender, DOB, City, Role, Salary)
VALUES ('John', 30, 'M', '1992-05-15', 'New York', 'Manager', 60000),
('Emma', 25, 'F', '1997-09-28', 'Los Angeles', 'Engineer', 55000),
('Michael', 35, 'M', '1986-02-10', 'Chicago', 'Analyst', 50000),
('Sophia', 28, 'F', '1993-12-03', 'Houston', 'Designer', 45000);


SELECT Name, Salary
FROM emp_details
WHERE Salary>=60001
OR Role = "Engineer";

INSERT INTO emp_details (Name, Age, Gender, DOB, City, Role, Salary)
VALUES ('Jose', 38, 'M', '1990-07-12', 'Miami', 'Chemical Engineer', 185000);

INSERT INTO emp_details (Name, Age, Gender, DOB, City, Role, Salary)
VALUES ('Ana', 18, 'F', '1999-07-12', 'New York', 'Engineer', 185000);

SELECT DISTINCT Name FROM emp_details;

SELECT *
FROM emp_details
WHERE Name NOT IN ('Jose');

Select * FROM emp_details
WHERE Salary BETWEEN 50000 AND 100000;

SELECT * FROM emp_details
WHERE Salary LIKE '%55%';

SELECT * FROM emp_details
WHERE Name LIKE '_O__';

SELECT Name, Age
FROM emp_details
ORDER BY Age DESC
LIMIT 3;

SELECT Name, Age
FROM emp_details
ORDER BY Age ASC
LIMIT 4;

SELECT Role, AVG(Salary) AS ave_sal
FROM emp_details
WHERE Role LIKE '%Engineer%'
GROUP BY Role
HAVING ave_sal>100000;

SELECT Role, AVG(Salary) AS ave_sal
FROM emp_details
WHERE Role LIKE '%Engineer%'
GROUP BY Role
HAVING ave_sal>100000;

-- hols --


