SELECT TOP (1000) [EmployeeID]
      ,[Name]
      ,[Position]
      ,[StartDate]
      ,[EndDate]
  FROM [dbo].[user]

SELECT * FROM [dbo].[user]
GROUP BY EmployeeID
ORDER BY EndDate

  truncate table [dbo].[user]