/*
Properties
Name	Workday_Daily_Feed - Data Tests - ExpectedRowCount
External Key	d0d5ebfe-9af0-4845-a6c6-7ba17e23267a
Folder Location	Query
Description

Target Data Extension
Data Extension	Workday_Feed_Daily_Data_Tests_Log
Data Action	Update
*/

SELECT TOP 1
today.BatchID,
'ExpectedRowCount' AS Test_Name,
GETDATE() AS Test_Date,
CASE
    WHEN today.ExpectedRowCount = today.recordCount THEN 'Pass'
    WHEN today.recordCount > today.ExpectedRowCount - 10 THEN 'Pass'
    WHEN today.recordCount < today.ExpectedRowCount + 10 THEN 'Pass'
    ELSE 'Fail'
END AS Test_Result,
CASE
    WHEN today.recordCount = today.ExpectedRowCount THEN 'The number of records matches the ExpectedRowCount'
    WHEN today.recordCount > today.ExpectedRowCount - 10 THEN 'The number of records is close to ExpectedRowCount'
    WHEN today.recordCount < today.ExpectedRowCount + 10 THEN 'The number of records is close to ExpectedRowCount'
    ELSE Concat('There are ', (today.ExpectedRowCount-today.recordCount), ' records missing.')
END AS Test_Result_Desc,
(today.ExpectedRowCount-today.recordCount)*-1 AS Test_Result_Numeric,
tests.Test_Result AS Test_Result_Yesterday,
CASE
    WHEN today.ExpectedRowCount = today.recordCount THEN 'Pass'
    WHEN today.recordCount > today.ExpectedRowCount - 10 THEN 'Pass'
    WHEN today.recordCount < today.ExpectedRowCount + 10 THEN 'Pass'
    ELSE 'Stop'
END AS Pass_Warn_Stop
FROM (
    SELECT
    logA.BatchID,
    logA.ExpectedRowCount,
    COUNT(rawA.Employee_ID) AS recordCount
    FROM (
        SELECT
        logI.BatchID,
        logI.ExpectedRowCount,
        ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), logI.[ts]) ORDER BY logI.[ts_api_end] DESC) AS row_num
        FROM Workday_Feed_Daily__Raw_Import_API__Log logI
        WHERE DateDiff(DAY, GetDate(), logI.[ts]) = 0
    ) logA
    LEFT JOIN Workday_Feed_Daily__Raw_Import_API rawA ON logA.BatchID = rawA.BatchID
    WHERE logA.row_num = 1
    GROUP BY logA.BatchID, logA.ExpectedRowCount
) today
LEFT JOIN Workday_Feed_Daily_Data_Tests_Log tests ON DateDiff(DAY, GetDate(), tests.[Test_Date]) = -1 AND tests.Test_Name = 'ExpectedRowCount'