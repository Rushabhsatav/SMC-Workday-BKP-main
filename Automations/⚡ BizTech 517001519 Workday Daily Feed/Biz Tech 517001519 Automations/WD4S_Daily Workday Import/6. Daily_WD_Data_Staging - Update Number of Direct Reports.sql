/*
Properties
Name	Daily_WD_Data_Staging - Update Number of Direct Reports
External Key	054C3C26-742A-46B5-848E-57C07DA23CA7
Folder Location	Query
Description	

Target Data Extension
Data Extension	Daily_WD_Data_Staging
Data Action	Update
*/

SELECT
wd.Employee_ID,
Coalesce(mo.Direct_Reports, 0) AS Direct_Reports
FROM Daily_WD_Data_Staging wd
LEFT JOIN (
	SELECT
	Count(m.Employee_ID) AS Direct_Reports,
	Coalesce(
		m.Management_Chain_Level_14,
		m.Management_Chain_Level_13,
		m.Management_Chain_Level_12,
		m.Management_Chain_Level_11,
		m.Management_Chain_Level_10,
		m.Management_Chain_Level_09,
		m.Management_Chain_Level_08,
		m.Management_Chain_Level_07,
		m.Management_Chain_Level_06,
		m.Management_Chain_Level_05,
		m.Management_Chain_Level_04,
		m.Management_Chain_Level_03,
		m.Management_Chain_Level_02,
		m.Management_Chain_Level_01
	) AS Manager_ID
	FROM Daily_WD_Data_Staging m
	GROUP BY Coalesce(
		m.Management_Chain_Level_14,
		m.Management_Chain_Level_13,
		m.Management_Chain_Level_12,
		m.Management_Chain_Level_11,
		m.Management_Chain_Level_10,
		m.Management_Chain_Level_09,
		m.Management_Chain_Level_08,
		m.Management_Chain_Level_07,
		m.Management_Chain_Level_06,
		m.Management_Chain_Level_05,
		m.Management_Chain_Level_04,
		m.Management_Chain_Level_03,
		m.Management_Chain_Level_02,
		m.Management_Chain_Level_01
	)
) mo ON wd.Employee_ID = mo.Manager_ID