/*
Properties
Name	Workday_Daily_Feed - Data Tests - Checksum
External Key	a0bc731f-8c22-4ce8-bc4d-434a16581b58
Folder Location	Query
Description

Target Data Extension
Data Extension	Workday_Feed_Daily_Data_Tests_Log
Data Action	Update
*/

SELECT TOP 1
logC.BatchID,
'Checksum' AS Test_Name,
GETDATE() AS Test_Date,
CASE
    WHEN test.percent_float < 0.25 THEN 'Pass'
    ELSE 'Fail'
END AS Test_Result,
CASE
    WHEN test.percent_float < 0.25 THEN CONCAT('Checksum test passed with ', test.percent_float*100, '% of records changed since yesterday.')
    ELSE CONCAT('Checksum test failed with ', test.percent_float*100, '% of records changed since yesterday.')
END AS Test_Result_Desc,
test.percent_float*100 AS Test_Result_Numeric,
tests.Test_Result AS Test_Result_Yesterday,
CASE
    WHEN test.percent_float < 0.25 THEN 'Pass'
    ELSE 'Warn'
END AS Pass_Warn_Stop
FROM (
    SELECT
    CAST(SUM(IIF(today.check_sum <> yesterday.check_sum,1,0)) AS FLOAT) / CAST(Count(today.Employee_ID) AS FLOAT) AS percent_float
    FROM (
        SELECT
        rawA.Employee_ID,
        CHECKSUM(rawA.[Preferred_Name], rawA.[First_Name], rawA.[Last_Name], rawA.[Employee_Type], rawA.[Direct_Reports], rawA.[Business_Title], rawA.[Division], rawA.[Location], rawA.[Work_Space], rawA.[State_Province], rawA.[Postal_Code], rawA.[Department], rawA.[Primary_Coverage_Country], rawA.[Business_Unit], rawA.[Acquired_Company], rawA.[Company], rawA.[Email_Address], rawA.[Manager], rawA.[Manager_Title], rawA.[Manager_Email], rawA.[Manager_Location], rawA.[Manager_Division], rawA.[Management_Chain_01], rawA.[Management_Chain_02], rawA.[Management_Chain_03], rawA.[Management_Chain_04], rawA.[Management_Chain_05], rawA.[Management_Chain_06], rawA.[Management_Chain_07], rawA.[Management_Chain_08], rawA.[Management_Chain_09], rawA.[Management_Chain_10], rawA.[Management_Chain_11], rawA.[Management_Chain_12], rawA.[Management_Chain_13], rawA.[Management_Chain_14], rawA.[Job_Title], rawA.[Employee_ID], rawA.[City], rawA.[Country], rawA.[Compensation_Grade], rawA.[Is_Manager], rawA.[Pay_Rate_Type], rawA.[Additional_Email_Address], rawA.[Birthdate_Day], rawA.[Birthdate_Month], rawA.[Home_Address-Address_Line_1], rawA.[Home_Address-Address_Line_2], rawA.[Home_Address-City], rawA.[Home_Address-Country], rawA.[Home_Address-Postal_Code], rawA.[Home_Address-State-Province], rawA.[Manager_ID], rawA.[Job_Family_Group]) AS check_sum
        FROM [Workday_Feed_Daily__Raw_Import_API] rawA
        JOIN (
            SELECT
            logI.BatchID,
            ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), logI.[ts]) ORDER BY logI.[ts_api_end] DESC) AS row_num
            FROM Workday_Feed_Daily__Raw_Import_API__Log logI
            WHERE DateDiff(DAY, GetDate(), logI.[ts]) = 0
        ) logA ON logA.[BatchID] = rawA.[BatchID]
        WHERE logA.row_num = 1
    ) today
    JOIN (
        SELECT
        rawB.Employee_ID,
        CHECKSUM(rawB.[Preferred_Name], rawB.[First_Name], rawB.[Last_Name], rawB.[Employee_Type], rawB.[Direct_Reports], rawB.[Business_Title], rawB.[Division], rawB.[Location], rawB.[Work_Space], rawB.[State_Province], rawB.[Postal_Code], rawB.[Department], rawB.[Primary_Coverage_Country], rawB.[Business_Unit], rawB.[Acquired_Company], rawB.[Company], rawB.[Email_Address], rawB.[Manager], rawB.[Manager_Title], rawB.[Manager_Email], rawB.[Manager_Location], rawB.[Manager_Division], rawB.[Management_Chain_01], rawB.[Management_Chain_02], rawB.[Management_Chain_03], rawB.[Management_Chain_04], rawB.[Management_Chain_05], rawB.[Management_Chain_06], rawB.[Management_Chain_07], rawB.[Management_Chain_08], rawB.[Management_Chain_09], rawB.[Management_Chain_10], rawB.[Management_Chain_11], rawB.[Management_Chain_12], rawB.[Management_Chain_13], rawB.[Management_Chain_14], rawB.[Job_Title], rawB.[Employee_ID], rawB.[City], rawB.[Country], rawB.[Compensation_Grade], rawB.[Is_Manager], rawB.[Pay_Rate_Type], rawB.[Additional_Email_Address], rawB.[Birthdate_Day], rawB.[Birthdate_Month], rawB.[Home_Address-Address_Line_1], rawB.[Home_Address-Address_Line_2], rawB.[Home_Address-City], rawB.[Home_Address-Country], rawB.[Home_Address-Postal_Code], rawB.[Home_Address-State-Province], rawB.[Manager_ID], rawB.[Job_Family_Group]) AS check_sum
        FROM [Workday_Feed_Daily__Raw_Import_API] rawB
        JOIN (
            SELECT
            logBI.BatchID,
            ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), logBI.[ts]) ORDER BY logBI.[ts_api_end] DESC) AS row_num
            FROM Workday_Feed_Daily__Raw_Import_API__Log logBI
            WHERE DateDiff(DAY, GetDate(), logBI.[ts]) = -1
        ) logB ON logB.[BatchID] = rawB.[BatchID]
        WHERE logB.row_num = 1
    ) yesterday ON today.Employee_ID = yesterday.Employee_ID
) test
JOIN Workday_Feed_Daily__Raw_Import_API__Log logC ON DateDiff(DAY, GetDate(), logC.[ts]) = 0
LEFT JOIN Workday_Feed_Daily_Data_Tests_Log tests ON DateDiff(DAY, GetDate(), tests.[Test_Date]) = -1 AND tests.Test_Name = 'Checksum'