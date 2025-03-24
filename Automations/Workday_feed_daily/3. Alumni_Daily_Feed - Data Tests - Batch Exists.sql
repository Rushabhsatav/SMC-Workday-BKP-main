/* 
Properties
Name	Alumni_Daily_Feed - Data Tests - Batch Exists
External Key	507E7B19-0DE5-4C31-A032-804E64DCBC95
Folder Location	Query
Description

Target Data Extension
Data Extension	Alumni_Feed_Daily_Data_Tests_Log
Data Action	Update
*/

SELECT TOP 1
 COALESCE(logB.BatchID, NEWID()) AS BatchID,
 'BatchExists' AS Test_Name,
 GETDATE() AS Test_Date,
 CASE WHEN logB.BatchID IS NOT NULL
    THEN 'Pass'
    ELSE 'Fail'
 END AS Test_Result,
 CASE WHEN logB.BatchID IS NOT NULL
    THEN Concat('Found a batch with timestamp of ', logB.ts)
    ELSE 'Unable to find a batch for today'
 END AS Test_Result_Desc,
 CASE WHEN logB.BatchID IS NOT NULL
    THEN 100
    ELSE 0
 END AS Test_Result_Numeric,
 tests.Test_Result AS Test_Result_Yesterday,
 CASE WHEN logB.BatchID IS NOT NULL
    THEN 'Pass'
    ELSE 'Stop'
 END AS Pass_Warn_Stop

FROM [Alumni_raw_data__Raw_Import_API] x 
/*it doesn't matter what DE is selected because we're not selecting data*/

LEFT JOIN [Alumni_raw_data__Raw_Import_API__Log] logB 
 ON DateDiff(DAY, GetDate(), logB.[ts]) = 0

LEFT JOIN [Alumni_Feed_Daily_Data_Tests_Log] tests 
 ON DateDiff(DAY, GetDate(), tests.[Test_Date]) = -1 
 AND tests.Test_Name = 'BatchExists'