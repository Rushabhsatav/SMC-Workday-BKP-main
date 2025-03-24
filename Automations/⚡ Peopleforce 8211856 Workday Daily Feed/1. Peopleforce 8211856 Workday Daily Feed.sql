/*
Properties
Name	Peopleforce 8211856 Workday Daily Feed
External Key	80899A29-8E85-4CAE-B271-B5386F749CC6
Folder Location	Query
Description	

Target Data Extension
Data Extension	Workday_Feed_Daily_Peopleforce_8211856
Data Action	Overwrite
*/

SELECT
Preferred_Name, First_Name, Last_Name, Employee_Type,
Direct_Reports, Business_Title, Division, Location,
Work_Space, State_Province, Postal_Code, Department,
Primary_Coverage_Country, Business_Unit, Acquired_Company,
Company, Email_Address, Manager, Manager_Title, Manager_Email,
Manager_Location, Manager_Division, Management_Chain_01,
Management_Chain_02, Management_Chain_03, Management_Chain_04,
Management_Chain_05, Management_Chain_06, Management_Chain_07,
Management_Chain_08, Management_Chain_09, Management_Chain_10,
Job_Title, Employee_ID, City, Country, Hire_Date, Continuous_Service_Date,
[Original_Hire_Date], [Length_Of_Service_From_Seniority_Date], [Seniority_Date],
[Compensation_Grade], Is_Manager, Pay_Rate_Type,
Additional_Email_Address, Voluntary_Termination_Effective_Date, Management_Chain_11,
Management_Chain_12, Management_Chain_13, Management_Chain_14, Manager_ID,
Record_Last_Updated, Job_Family_Group, Is_Rehired
FROM Workday_Feed_Daily_Final