/*
Properties
Name	BT M&A Acquisitions 517001890 Workday Daily Feed
External Key	994AA911-1A95-4A05-B1E4-A8F3119F8FD7
Folder Location	Query
Description	

Target Data Extension
Data Extension	Workday_Feed_Daily_517001890 BT M A Acquisitions
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