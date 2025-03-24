/*
Properties
Name	Daily_WD_Data_Stagign - Management Chains to Number
External Key	BFDC33E8-2B45-4C4C-944A-1F1B13CA8CC3
Folder Location	Query
Description	

Target Data Extension
Data Extension	Daily_WD_Data_Staging
Data Action	Update
*/

SELECT
Employee_ID,
REPLACE(RIGHT(Management_Chain_Level_01, (LEN(Management_Chain_Level_01) - CHARINDEX('(',Management_Chain_Level_01))),')','') AS Management_Chain_Level_01,
REPLACE(RIGHT(Management_Chain_Level_02, (LEN(Management_Chain_Level_02) - CHARINDEX('(',Management_Chain_Level_02))),')','') AS Management_Chain_Level_02,
REPLACE(RIGHT(Management_Chain_Level_03, (LEN(Management_Chain_Level_03) - CHARINDEX('(',Management_Chain_Level_03))),')','') AS Management_Chain_Level_03,
REPLACE(RIGHT(Management_Chain_Level_04, (LEN(Management_Chain_Level_04) - CHARINDEX('(',Management_Chain_Level_04))),')','') AS Management_Chain_Level_04,
REPLACE(RIGHT(Management_Chain_Level_05, (LEN(Management_Chain_Level_05) - CHARINDEX('(',Management_Chain_Level_05))),')','') AS Management_Chain_Level_05,
REPLACE(RIGHT(Management_Chain_Level_06, (LEN(Management_Chain_Level_06) - CHARINDEX('(',Management_Chain_Level_06))),')','') AS Management_Chain_Level_06,
REPLACE(RIGHT(Management_Chain_Level_07, (LEN(Management_Chain_Level_07) - CHARINDEX('(',Management_Chain_Level_07))),')','') AS Management_Chain_Level_07,
REPLACE(RIGHT(Management_Chain_Level_08, (LEN(Management_Chain_Level_08) - CHARINDEX('(',Management_Chain_Level_08))),')','') AS Management_Chain_Level_08,
REPLACE(RIGHT(Management_Chain_Level_09, (LEN(Management_Chain_Level_09) - CHARINDEX('(',Management_Chain_Level_09))),')','') AS Management_Chain_Level_09,
REPLACE(RIGHT(Management_Chain_Level_10, (LEN(Management_Chain_Level_10) - CHARINDEX('(',Management_Chain_Level_10))),')','') AS Management_Chain_Level_10,
REPLACE(RIGHT(Management_Chain_Level_11, (LEN(Management_Chain_Level_11) - CHARINDEX('(',Management_Chain_Level_11))),')','') AS Management_Chain_Level_11,
REPLACE(RIGHT(Management_Chain_Level_12, (LEN(Management_Chain_Level_12) - CHARINDEX('(',Management_Chain_Level_12))),')','') AS Management_Chain_Level_12,
REPLACE(RIGHT(Management_Chain_Level_13, (LEN(Management_Chain_Level_13) - CHARINDEX('(',Management_Chain_Level_13))),')','') AS Management_Chain_Level_13,
REPLACE(RIGHT(Management_Chain_Level_14, (LEN(Management_Chain_Level_14) - CHARINDEX('(',Management_Chain_Level_14))),')','') AS Management_Chain_Level_14
FROM Daily_WD_Data_Staging