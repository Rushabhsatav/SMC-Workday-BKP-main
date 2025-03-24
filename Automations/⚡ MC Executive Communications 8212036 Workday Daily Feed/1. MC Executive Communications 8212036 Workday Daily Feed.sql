/*
Properties
Name	MC Executive Communications 8212036 Workday Daily Feed
External Key	126F8825-5F32-48EB-83F9-6B5F7C705942
Folder Location	Query
Description	

Target Data Extension
Data Extension	Workday_Feed_Daily_MC_Executive_Communications_8212036
Data Action	Overwrite
*/

SELECT Preferred_Name, First_Name, Last_Name, Email_Address, Employee_ID, Original_Hire_Date
FROM Workday_Feed_Daily_Final
WHERE Management_Chain_05 LIKE '%(716063)' /* Nate Romance */