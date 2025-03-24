/*
Properties
Name	Business Technology 8200448 Workday Daily Feed
External Key	F129E8DD-014C-4F41-9DB4-393F7562148A
Folder Location	Query
Description	

Target Data Extension
Data Extension	Workday_Feed_Daily_8200448 Business Technology
Data Action	Overwrite
*/

SELECT
Preferred_Name, First_Name, Last_Name, Employee_Type, Direct_Reports,
Business_Title, Division, Location, Work_Space, State_Province, Department,
[Primary_Coverage_Country], Business_Unit, Acquired_Company, Company, Email_Address,
Manager, Manager_Title, Manager_Email, Manager_Location, Manager_Division,
Management_Chain_01, Management_Chain_02, Management_Chain_03, Management_Chain_04,
Management_Chain_05, Management_Chain_06, Job_Title, Employee_ID, City, Country, Hire_Date,
[Continuous_Service_Date], [Length_Of_Service_From_Seniority_Date], [Is_Manager], Manager_ID, Job_Family_Group
FROM Workday_Feed_Daily_Final