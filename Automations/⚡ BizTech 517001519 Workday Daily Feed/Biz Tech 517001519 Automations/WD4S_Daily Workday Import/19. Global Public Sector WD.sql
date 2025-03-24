/*
Properties
Name	Global Public Sector WD
External Key	3d1ffddf-154b-470c-ad44-5ae4df399efd
Folder Location	Query
Description	WD feed for Dave Rey Org for GPS BU

Target Data Extension
Data Extension	Dave Rey Org
Data Action	Overwrite
*/

SELECT
[Email], 
[First_Name] AS [Preferred Name - First Name],
[Last_Name] AS [Preferred Name - Last Name],
[Preferred_Name] AS [Preferred Name_Full Name],
Direct_Reports AS [Direct Reports],
[Department],
[Primary_Coverage_Country] AS [Primary Coverage Country],
[Employee_ID] AS [Employee ID],
[Hire_Date] AS [Hire Date],
[Job_Title] AS [Job Title],
[Division],
[Location],
[Company],
[Manager],
[Management_Chain_Level_01] AS [Management Chain - Level 01],
[Management_Chain_Level_02] AS [Management Chain - Level 02],
[Management_Chain_Level_03] AS [Management Chain - Level 03],
[Management_Chain_Level_04] AS [Management Chain - Level 04],
[Management_Chain_Level_05] AS [Management Chain - Level 05],
[Management_Chain_Level_06] AS [Management Chain - Level 06],
[Management_Chain_Level_07] AS [Management Chain - Level 07]
FROM [Daily_WD_Data_Normalized]
WHERE ([Department] not like '%9999%' 
AND [Management_Chain_Level_03] = 'Dave Rey (713687)')
OR [Employee_ID] = '713687'