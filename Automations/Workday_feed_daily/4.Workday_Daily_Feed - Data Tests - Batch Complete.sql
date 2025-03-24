/*
Properties
Name	Workday_Daily_Feed - Data Tests - Batch Complete
External Key	74ad3a30-aec9-4191-a894-7b70872b024a
Folder Location	Query
Description

Target Data Extension
Data Extension	Workday_Feed_Daily_Data_Tests_Log
Data Action	Update
*/

SELECT
logA.BatchID,
'BatchComplete' AS Test_Name,
GETDATE() AS Test_Date,
CASE
    WHEN logA.ts_api_end IS NOT NULL THEN 'Pass'
    ELSE 'Fail'
END AS Test_Result,
CASE
    WHEN logA.ts_api_end IS NOT NULL THEN Concat('The batch completed with a ts_api_end date of ', logA.ts_api_end)
    ELSE 'The batch ts_api_end is null'
END AS Test_Result_Desc,
CASE
    WHEN logA.ts_api_end IS NOT NULL THEN 100
    ELSE 0
END AS Test_Result_Numeric,
tests.Test_Result AS Test_Result_Yesterday,
CASE
    WHEN logA.ts_api_end IS NOT NULL THEN 'Pass'
    ELSE 'Stop'
END AS [Pass_Warn_Stop]
FROM (
    SELECT
    logI.BatchID,
    logI.ts_api_end,
    ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), logI.[ts]) ORDER BY logI.[ts_api_end] DESC) AS row_num
    FROM [Workday_Feed_Daily__Raw_Import_API__Log] logI
    WHERE DateDiff(DAY, GetDate(), logI.[ts]) = 0
) logA
LEFT JOIN (
    SELECT
    testsI.Test_Result
    FROM (
        SELECT
        testsII.Test_Result,
        ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), testsII.[Test_Date]) ORDER BY testsII.[Date] DESC) AS rn
        FROM [Workday_Feed_Daily_Data_Tests_Log] testsII
        WHERE DateDiff(DAY, GetDate(), testsII.[Test_Date]) = -1
        AND testsII.Test_Name = 'BatchComplete'
    ) testsI
    WHERE testsI.rn = 1
) tests ON 1 = 1
WHERE logA.row_num = 1