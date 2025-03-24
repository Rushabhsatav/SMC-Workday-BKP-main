/*
Properties
Name	Daily_WD_CMO_Office
External Key	045ED7BF-DB3E-4367-86FD-59462A7B52C7
Folder Location	Query
Description	

Target Data Extension
Data Extension	Colin_Customer_Snapshot
Data Action	Overwrite
*/

SELECT [Email]
FROM [Daily_WD_Data_Normalized]
WHERE [Management_Chain_Level_04] IS NULL
AND [Email] NOT LIKE '%marcb@salesforce.com%'