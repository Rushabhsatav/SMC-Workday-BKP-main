/*
Properties
Name	Workday_Daily_Feed - Truncate Staging DE
External Key	b9cdc9c6-75c0-47d3-9587-64fefb5983e7
Folder Location	Query
Description

Target Data Extension
Data Extension	Workday_Feed_Daily_Staging
Data Action	Overwrite

*/

SELECT
Email_Address, Employee_ID
FROM Workday_Feed_Daily__Raw_Import_API
WHERE 1 = 0