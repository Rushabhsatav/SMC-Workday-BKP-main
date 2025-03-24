/*
Properties
Name	WD4S Shim
External Key	BDF4016C-2F6A-4219-A142-86793CB45E78
Folder Location	Query
Description	

Target Data Extension
Data Extension	Daily_WD_Data_Staging
Data Action	Overwrite
*/

SELECT
  [Acquired_Company] AS [Acquired_Company]
, [Birthdate_Day] AS [Birthdate_Day]
, [Birthdate_Month] AS [Birthdate_Month]
, [Business_Title] AS [Business_Title]
, [Business_Unit] AS [Business_Unit]
, [City] AS [Work_Address_City]
, [Company] AS [Company]
, [Department] AS [Department]
, [Direct_Reports] AS [Direct_Reports]
, [Division] AS [Division]
, [Email_Address] AS [Email]
, [Employee_ID] AS [Employee_ID]
, [Employee_Type] AS [Employee_Type]
, [First_Name] AS [First_Name]
, [Hire_Date] AS [Hire_Date]
, [Home_Address-Address_Line_1] AS [Home_Address_Address_Line_1]
, [Home_Address-Address_Line_2] AS [Home_Address_Address_Line_2]
, [Home_Address-City] AS [Home_Address_City]
, [Home_Address-Country] AS [Home_Address_Country]
, [Home_Address-Postal_Code] AS [Home_Address_Postal_Code]
, [Home_Address-State-Province] AS [Home_Address_State_Province]
, [Job_Title] AS [Job_Title]
, [Last_Name] AS [Last_Name]
, [Location] AS [Location]
, [Management_Chain_01] AS [Management_Chain_Level_01]
, [Management_Chain_02] AS [Management_Chain_Level_02]
, [Management_Chain_03] AS [Management_Chain_Level_03]
, [Management_Chain_04] AS [Management_Chain_Level_04]
, [Management_Chain_05] AS [Management_Chain_Level_05]
, [Management_Chain_06] AS [Management_Chain_Level_06]
, [Management_Chain_07] AS [Management_Chain_Level_07]
, [Management_Chain_08] AS [Management_Chain_Level_08]
, [Management_Chain_09] AS [Management_Chain_Level_09]
, [Management_Chain_10] AS [Management_Chain_Level_10]
, [Management_Chain_11] AS [Management_Chain_11]
, [Management_Chain_12] AS [Management_Chain_12]
, [Management_Chain_13] AS [Management_Chain_13]
, [Management_Chain_14] AS [Management_Chain_14]
, [Manager] AS [Manager]
, [Manager_Division] AS [Manager_Division]
, [Manager_Email] AS [Manager_Email]
, [Manager_ID] AS [Manager_ID]
, [Manager_Location] AS [Manager_Location]
, [Manager_Title] AS [Manager_Title]
, [Postal_Code] AS [Work_Address_Postal_Code]
, [Preferred_Name] AS [Preferred_Name]
, [Primary_Coverage_Country] AS [Primary_Coverage_Country]
, [Record_Last_Updated] AS [Import_Date]
, [State_Province] AS [Work_Address_State_Province]
, [Work_Space] AS [Work_Space]
FROM [WD4S_Shim]