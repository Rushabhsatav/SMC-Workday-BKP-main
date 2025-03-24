/*
Properties
Name	GO Center 517022758 Workday Daily Feed
External Key	5B73FC6E-6912-4CD6-AFC8-56914E03BEFD
Folder Location	Query
Description	

Target Data Extension
Data Extension	Workday_Feed_Daily_GO_Center_517022758
Data Action	Overwrite
*/

SELECT
Preferred_Name, First_Name, Last_Name, Employee_Type, Direct_Reports, Business_Title, Division,
Location, Work_Space, State_Province, Postal_Code, Department, Primary_Coverage_Country, Business_Unit,
Acquired_Company, Company, Email_Address, Manager, Manager_Title, Manager_Email, Manager_Location,
Manager_Division, Management_Chain_01, Management_Chain_02, Management_Chain_03, Management_Chain_04,
Management_Chain_05, Management_Chain_06, Management_Chain_07, Management_Chain_08, Management_Chain_09,
Management_Chain_10, Job_Title, Employee_ID, City, Country, Is_Manager, Additional_Email_Address,
Management_Chain_11, Management_Chain_12, Management_Chain_13, Management_Chain_14,
[Home_Address-Address_Line_1], [Home_Address-Address_Line_2], [Home_Address-City], [Home_Address-Country], [Home_Address-Postal_Code], [Home_Address-State-Province],
Manager_ID, Record_Last_Updated, Job_Family_Group
FROM Workday_Feed_Daily_Final