/*
Properties
Name	Daily_WD_Data_Staging - Update Management Chain Names
External Key	2526CC0A-1ED8-4690-8CB1-BF3A9B6AB65A
Folder Location	Query
Description	

Target Data Extension
Data Extension	Daily_WD_Data_Staging
Data Action	Update
*/

SELECT
wd.Employee_ID,
Coalesce(wda.mgmt_chain, wd.Management_Chain_Level_01) AS Management_Chain_Level_01,
Coalesce(wdb.mgmt_chain, wd.Management_Chain_Level_02) AS Management_Chain_Level_02,
Coalesce(wdc.mgmt_chain, wd.Management_Chain_Level_03) AS Management_Chain_Level_03,
Coalesce(wdd.mgmt_chain, wd.Management_Chain_Level_04) AS Management_Chain_Level_04,
Coalesce(wde.mgmt_chain, wd.Management_Chain_Level_05) AS Management_Chain_Level_05,
Coalesce(wdf.mgmt_chain, wd.Management_Chain_Level_06) AS Management_Chain_Level_06,
Coalesce(wdg.mgmt_chain, wd.Management_Chain_Level_07) AS Management_Chain_Level_07,
Coalesce(wdh.mgmt_chain, wd.Management_Chain_Level_08) AS Management_Chain_Level_08,
Coalesce(wdi.mgmt_chain, wd.Management_Chain_Level_09) AS Management_Chain_Level_09,
Coalesce(wdj.mgmt_chain, wd.Management_Chain_Level_10) AS Management_Chain_Level_10
FROM Daily_WD_Data_Staging wd
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wda ON wda.Employee_ID = wd.Management_Chain_Level_01
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdb ON wdb.Employee_ID = wd.Management_Chain_Level_02
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdc ON wdc.Employee_ID = wd.Management_Chain_Level_03
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdd ON wdd.Employee_ID = wd.Management_Chain_Level_04
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wde ON wde.Employee_ID = wd.Management_Chain_Level_05
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdf ON wdf.Employee_ID = wd.Management_Chain_Level_06
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdg ON wdg.Employee_ID = wd.Management_Chain_Level_07
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdh ON wdh.Employee_ID = wd.Management_Chain_Level_08
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdi ON wdi.Employee_ID = wd.Management_Chain_Level_09
LEFT JOIN (
	SELECT
	Concat(Preferred_Name, ' (', Employee_ID, ')') AS mgmt_chain,
	Employee_ID
	FROM Daily_WD_Data_Staging
) wdj ON wdj.Employee_ID = wd.Management_Chain_Level_10