/*
Properties
Name	Workday_Daily_Feed - Data Tests - RowCountChange
External Key	114e689c-8e53-4cad-8fbf-ab46fb45ca84
Folder Location	Query
Description

Target Data Extension
Data Extension	Workday_Feed_Daily_Data_Tests_Log
Data Action	Update
*/

SELECT
recordCounts.BatchID,
'RowCountChange' AS Test_Name,
GETDATE() AS Test_Date,
CASE
    WHEN recordCounts.percent_float < 0.9 THEN 'Fail'
    WHEN recordCounts.percent_float > 1.1 THEN 'Fail'
    ELSE 'Pass'
END AS Test_Result,
CASE
    WHEN recordCounts.percent_float < 1 THEN Concat('The record count has decreased by ', (1-recordCounts.percent_float)*100, '%')
    WHEN recordCounts.percent_float > 1 THEN Concat('The record count has increased by ', (recordCounts.percent_float-1)*100, '%')
    ELSE Concat('The record count has changed by ', (1-recordCounts.percent_float)*100, '%')
END AS Test_Result_Desc,
recordCounts.today_recordCount - recordCounts.yesterday_recordCount AS Test_Result_Numeric,
yesterday.Test_Result AS Test_Result_Yesterday,
CASE
    WHEN recordCounts.percent_float < 0.9 OR recordCounts.percent_float > 1.1 THEN 'Stop'
    WHEN recordCounts.percent_float < 0.95 OR recordCounts.percent_float > 1.05 THEN 'Warn'
    ELSE 'Pass'
END AS Pass_Warn_Stop
FROM (
    SELECT
    today.BatchID,
    today.recordCount AS today_recordCount,
    lastPassingDay.recordCount AS yesterday_recordCount,
    CAST(today.recordCount AS FLOAT) / CAST(lastPassingDay.recordCount AS FLOAT) AS percent_float
    FROM (
        SELECT
        logA.BatchID,
        COUNT(rawA.Employee_ID) AS recordCount
        FROM (
            SELECT
            logI.BatchID,
            ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), logI.[ts]) ORDER BY logI.[ts_api_end] DESC) AS row_num
            FROM Workday_Feed_Daily__Raw_Import_API__Log logI
            WHERE DateDiff(DAY, GetDate(), logI.[ts]) = 0
        ) logA
        JOIN Workday_Feed_Daily__Raw_Import_API rawA ON logA.BatchID = rawA.BatchID
        WHERE logA.row_num = 1
        GROUP BY logA.BatchID
    ) today
    JOIN (
        SELECT
        logB.BatchID,
        COUNT(rawB.Employee_ID) AS recordCount
        FROM (
            SELECT TOP 1
            b.BatchID
            FROM (
                SELECT
                MAX(a.Test_Date) AS Test_Date
                FROM Workday_Feed_Daily_Data_Tests_Log a
                WHERE a.Test_Name = 'RowCountChange'
                AND a.Test_Result = 'Pass'
                AND DateDiff(DAY, GetDate(), a.[Test_Date]) < 0
            ) c
            JOIN Workday_Feed_Daily_Data_Tests_Log b ON b.Test_Date = c.Test_Date
                AND b.Test_Name = 'RowCountChange'
                AND b.Test_Result = 'Pass'
        ) logB
        JOIN Workday_Feed_Daily__Raw_Import_API rawB ON logB.BatchID = rawB.BatchID
        GROUP BY logB.BatchID
    ) lastPassingDay ON 1 = 1
) recordCounts
LEFT JOIN (
    SELECT
    tests.Test_Result,
    ROW_NUMBER() OVER(PARTITION BY DateDiff(DAY, GetDate(), tests.[Test_Date]) ORDER BY tests.[Test_Date] DESC) AS rn
    FROM Workday_Feed_Daily_Data_Tests_Log tests
    WHERE DateDiff(DAY, GetDate(), tests.[Test_Date]) = -1
    AND tests.Test_Name = 'RowCountChange'
) yesterday ON 1 = 1
WHERE yesterday.rn = 1