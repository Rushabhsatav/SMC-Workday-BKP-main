/*
Properties
Name	Workday_Daily_Feed - Stage Today's Batch
External Key	2d5a37b2-ac35-4f16-ac10-761431ff76c2
Folder Location	Query
Description	

Target Data Extension
Data Extension	Workday_Feed_Daily_Staging
Data Action	Overwrite

*/

SELECT
wdraw.[Preferred_Name],
wdraw.[First_Name],
wdraw.[Last_Name],
wdraw.[Employee_Type],
wdraw.[Direct_Reports],
wdraw.[Business_Title],
wdraw.[Division],
wdraw.[Location],
wdraw.[Work_Space],
wdraw.[State_Province],
wdraw.[Postal_Code],
wdraw.[Department],
wdraw.[Primary_Coverage_Country],
wdraw.[Business_Unit],
wdraw.[Acquired_Company],
wdraw.[Company],
wdraw.[Email_Address],
wdraw.[Manager],
wdraw.[Manager_Title],
wdraw.[Manager_Email],
wdraw.[Manager_Location],
wdraw.[Manager_Division],
wdraw.[Management_Chain_01],
wdraw.[Management_Chain_02],
wdraw.[Management_Chain_03],
wdraw.[Management_Chain_04],
wdraw.[Management_Chain_05],
wdraw.[Management_Chain_06],
wdraw.[Management_Chain_07],
wdraw.[Management_Chain_08],
wdraw.[Management_Chain_09],
wdraw.[Management_Chain_10],
wdraw.[Job_Title],
wdraw.[Employee_ID],
wdraw.[City],
wdraw.[Country],
wdraw.[Hire_Date],
wdraw.[Continuous_Service_Date],
wdraw.[Original_Hire_Date],
wdraw.[Length_Of_Service_From_Seniority_Date],
wdraw.[Seniority_Date],
wdraw.[Compensation_Grade],
wdraw.[Is_Manager],
wdraw.[Pay_Rate_Type],
wdraw.[Additional_Email_Address],
wdraw.[Voluntary_Termination_Effective_Date],
wdraw.[BatchID],
wdraw.[Management_Chain_11],
wdraw.[Management_Chain_12],
wdraw.[Management_Chain_13],
wdraw.[Management_Chain_14],
wdraw.[Birthdate_Day],
wdraw.[Birthdate_Month],
wdraw.[Home_Address-Address_Line_1],
wdraw.[Home_Address-Address_Line_2],
wdraw.[Home_Address-City],
wdraw.[Home_Address-Country],
wdraw.[Home_Address-Postal_Code],
wdraw.[Home_Address-State-Province],
wdraw.[Manager_ID],
wdraw.[Job_Family_Group],
wdraw.[Is_Rehired],
wdraw.[InsertedOn] AS Record_Last_Updated
FROM [Workday_Feed_Daily__Raw_Import_API] wdraw
JOIN (
    SELECT
    batch.[BatchID],
    ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), batch.[ts]) ORDER BY batch.[ts_api_end] DESC) AS row_num
    FROM [Workday_Feed_Daily__Raw_Import_API__Log] batch
    WHERE batch.[ts_api_end] IS NOT NULL
    AND DateDiff(DAY, GetDate(), batch.[ts]) = 0
) last_batch ON wdraw.[BatchID] = last_batch.[BatchID]
WHERE last_batch.row_num = 1