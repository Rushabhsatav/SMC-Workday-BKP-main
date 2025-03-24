/*
Properties
Name	Workday_Daily_Feed - Data Tests - Warn
External Key	4CCEE80D-0632-46FE-A3C2-15EE2D17C411
Folder Location	Query
Description

Target Data Extension
Data Extension	Workday_Feed_Daily_Data_Warn
Data Action	Overwrite
*/

SELECT TOP 1
1 AS Warn_Automation
FROM Workday_Feed_Daily__Raw_Import_API__Log logA
JOIN Workday_Feed_Daily_Data_Tests_Log tests ON logA.BatchID = tests.BatchID
WHERE DateDiff(DAY, GetDate(), logA.[ts]) = 0
AND tests.Pass_Warn_Stop = 'Warn'