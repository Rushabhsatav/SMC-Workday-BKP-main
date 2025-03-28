/*
Properties
Name	Workday_Daily_Feed - Data Tests - Stop
External Key	FF65A5FB-D552-4537-8B48-368A43A9BD72
Folder Location	Query
Description

Target Data Extension
Data Extension	Workday_Feed_Daily_Data_Stop
Data Action	Overwrite
*/

SELECT TOP 1
1 AS Stop_Automation
FROM Workday_Feed_Daily__Raw_Import_API__Log logA
JOIN Workday_Feed_Daily_Data_Tests_Log tests ON logA.BatchID = tests.BatchID
WHERE DateDiff(DAY, GetDate(), logA.[ts]) = 0
AND tests.Pass_Warn_Stop = 'Stop'