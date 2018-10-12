USE RelationDataModeling

CREATE TABLE Employee (
    SSID int NOT NULL PRIMARY KEY,
	ManagerSSID int,
    Name varchar(255)
);

CREATE TABLE ProjectMapping (
    ProjectID int,
	EmployeeSSID int   
);

CREATE TABLE Project (
	ID int NOT NULL PRIMARY KEY,
	Name varchar(255)
)

/* 1. Return a list of employees' names, and their manager's names (except the highest level employee who will have no manager - his or her manager should show "NULL" or empty). */
SELECT e1.Name, e2.name AS ManagerName
FROM employee e1
left outer join employee e2
ON e1.ManagerSSID = e2.SSID

/*2. Return a list of projects, and how many people are assigned to them */

SELECT Project.Name, COUNT(ProjectMapping.EmployeeSSID) FROM Project inner join ProjectMapping on ID = ProjectID GROUP BY Project.Name

/*3. Return the most senior person on the org chart assigned to a given project*/

/*Given a Project, return the Employees and Employee IDs of the Project*/
DECLARE @ProjectID int;
SET @ProjectID = 101;

WITH EmployeeCTE AS (
	SELECT SSID, Name, ManagerSSID, 0 AS recursionOrder
	FROM Employee LEFT OUTER JOIN ProjectMapping ON SSID = ProjectMapping.EmployeeSSID
	WHERE ProjectMapping.ProjectID = @ProjectID
	
	UNION ALL

	SELECT Employee.SSID, Employee.Name, Employee.ManagerSSID, recursionOrder + 1
	FROM Employee
	JOIN EmployeeCTE
	ON Employee.SSID = EmployeeCTE.ManagerSSID JOIN ProjectMapping ON Employee.SSID = ProjectMapping.EmployeeSSID
	WHERE ProjectMapping.ProjectID = @ProjectID
)

/*Given an SSID, find their top level manager*/
SELECT Project.Name, s.Name
FROM
(SELECT ProjectMapping.ProjectID, Name
	FROM
	(SELECT TOP (1)  CTE1.Name, CTE1.SSID, CTE1.recursionOrder as rOrder 
		from EmployeeCTE CTE1
		Left Outer Join EmployeeCTE CTE2
			ON CTE1.ManagerSSID = CTE2.SSID ORDER BY rOrder DESC)r
				INNER JOIN ProjectMapping ON ProjectMapping.EmployeeSSID = r.SSID)s
		INNER JOIN Project on Project.ID = s.ProjectID WHERE ProjectID = @ProjectID
