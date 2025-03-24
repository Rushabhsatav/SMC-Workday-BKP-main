/*
Properties
Name	Daily_WD_Data_Staging - Update Management Chain List
External Key	2C737213-967E-4DF2-B8CC-0C49C1207776
Folder Location	Query
Description	

Target Data Extension
Data Extension	Daily_WD_Data_Staging
Data Action	Update
*/

SELECT
m.Employee_ID,
Reverse(
	Stuff(
		Reverse(
			Concat(
				CASE WHEN m.Management_Chain_Level_01 IS NOT NULL THEN Concat(m.Management_Chain_Level_01, ', ') END,
				CASE WHEN m.Management_Chain_Level_02 IS NOT NULL THEN Concat(m.Management_Chain_Level_02, ', ') END,
				CASE WHEN m.Management_Chain_Level_03 IS NOT NULL THEN Concat(m.Management_Chain_Level_03, ', ') END,
				CASE WHEN m.Management_Chain_Level_04 IS NOT NULL THEN Concat(m.Management_Chain_Level_04, ', ') END,
				CASE WHEN m.Management_Chain_Level_05 IS NOT NULL THEN Concat(m.Management_Chain_Level_05, ', ') END,
				CASE WHEN m.Management_Chain_Level_06 IS NOT NULL THEN Concat(m.Management_Chain_Level_06, ', ') END,
				CASE WHEN m.Management_Chain_Level_07 IS NOT NULL THEN Concat(m.Management_Chain_Level_07, ', ') END,
				CASE WHEN m.Management_Chain_Level_08 IS NOT NULL THEN Concat(m.Management_Chain_Level_08, ', ') END,
				CASE WHEN m.Management_Chain_Level_09 IS NOT NULL THEN Concat(m.Management_Chain_Level_09, ', ') END,
				CASE WHEN m.Management_Chain_Level_10 IS NOT NULL THEN Concat(m.Management_Chain_Level_10, ', ') END,
				CASE WHEN m.Management_Chain_Level_11 IS NOT NULL THEN Concat(m.Management_Chain_Level_11, ', ') END,
				CASE WHEN m.Management_Chain_Level_12 IS NOT NULL THEN Concat(m.Management_Chain_Level_12, ', ') END,
				CASE WHEN m.Management_Chain_Level_13 IS NOT NULL THEN Concat(m.Management_Chain_Level_13, ', ') END,
				CASE WHEN m.Management_Chain_Level_14 IS NOT NULL THEN Concat(m.Management_Chain_Level_14, ', ') END
			)
		)
	, 1, 2, '')
) AS Management_Chain
FROM Daily_WD_Data_Staging m