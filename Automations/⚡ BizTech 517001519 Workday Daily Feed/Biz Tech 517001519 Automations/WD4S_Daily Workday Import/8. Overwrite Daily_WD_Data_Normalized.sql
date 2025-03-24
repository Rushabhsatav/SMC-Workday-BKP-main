/*
Properties
Name	Overwrite Daily_WD_Data_Normalized
External Key	40D775F7-25BE-4166-AC95-3CAB7387CF9C
Folder Location	Query
Description	

Target Data Extension
Data Extension	Daily_WD_Data_Normalized
Data Action	Overwrite
*/

SELECT Employee_ID, Preferred_Name, First_Name, Last_Name, Employee_Type,
Market_Segment_Extract, Hire_Date, Direct_Reports, Business_Title, Job_Title,
Division, Location, Work_Space, Work_Address_Street_1, Work_Address_Street_2,
Work_Address_City, Work_Address_State_Province, Work_Address_Postal_Code, Work_Address_Country,
Department, Primary_Coverage_Country, Business_Unit, Acquired_Company, Company, Email, Manager,
Manager_Title, Manager_Email, Manager_Location, Manager_Division, Management_Chain_Level_01,
Management_Chain_Level_02, Management_Chain_Level_03, Management_Chain_Level_04, Management_Chain_Level_05,
Management_Chain_Level_06, Management_Chain_Level_07, Management_Chain_Level_08, Management_Chain_Level_09,
Management_Chain_Level_10, Management_Chain, Manager_ID, Birthdate_Month, Birthdate_Day,
Home_Address_Address_Line_1, Home_Address_Address_Line_2, Home_Address_City, Home_Address_State_Province,
Home_Address_Postal_Code, Home_Address_Country, Import_Date
FROM Daily_WD_Data_Staging