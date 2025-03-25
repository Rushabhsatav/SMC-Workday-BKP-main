/*
Properties
Name	WD4S Shim
External Key	1140CB4D-D567-4B3E-9C93-DCCB5B3EB2FC
Folder Location	Query/_Workday_Feed_Daily
Description	

Target Data Extension
Data Extension	xxWORKDAY_FEED_Dailyxx_S8_Internal
Data Action	Overwrite
*/


/* WD4S Shim (ETL) Query */
/* Usage: To adjust and/or add any fields needed for backwards compatiblity */

SELECT
  e.[Acquired_Company] AS [Acquired_Company],
  e.[Additional_Email_Address] AS [Additional_Email_Address],
  e.[Business_Title] AS [Business_Title],
  e.[Business_Unit] AS [Business_Unit],
  e.[City] AS [City],
  e.[Company] AS [Company],
  e.[Compensation_Grade] AS [Compensation_Grade],
  e.[Continuous_Service_Date] AS [Continuous_Service_Date],
  e.[Country] AS [Country],
  e.[Department] AS [Department],
  e.[Direct_Reports] AS [Direct_Reports],

  /* Division: Move Korean employees to 'APAC' (from 'Japan') */
  CASE
    WHEN e.[Location] LIKE 'Korea%'                 THEN 'APAC - All Countries'
    WHEN e.[Country]  = 'United States of America'  THEN 'Americas - USA'
    WHEN e.[Country]  = 'Canada'                    THEN 'Americas - Canada'
    WHEN e.[Division] = 'LATAM'                     THEN 'Americas - Latin America'
    WHEN e.[Division] = 'APAC'                      THEN 'APAC - All Countries'
    WHEN e.[Division] = 'EMEA'                      THEN 'EMEA - All Countries'
    WHEN e.[Division] IS NULL                       THEN 'Americas - USA'
    ELSE e.[Division]
  END AS Division,

  e.[Email_Address] AS [Email_Address],
  e.[Employee_ID] AS [Employee_ID],

  /* Employee_Type: Force backwards compatibility */
  CASE
     WHEN e.[Employee_Type] = 'Regular' THEN 'Perm/FTE'
     ELSE e.[Employee_Type]
  END AS Employee_Type,

  e.[First_Name] AS [First_Name],
  e.[Hire_Date] AS [Hire_Date],
  e.[Is_Manager] AS [Is_Manager],
  e.[Job_Family_Group] AS [Job_Family_Group],
  e.[Job_Title] AS [Job_Title],
  e.[Last_Name] AS [Last_Name],
  e.[Length_Of_Service_From_Seniority_Date] AS [Length_Of_Service_From_Seniority_Date],
  e.[Location] AS [Location],
  e.[Management_Chain_01] AS [Management_Chain_01],
  e.[Management_Chain_02] AS [Management_Chain_02],
  e.[Management_Chain_03] AS [Management_Chain_03],
  e.[Management_Chain_04] AS [Management_Chain_04],
  e.[Management_Chain_05] AS [Management_Chain_05],
  e.[Management_Chain_06] AS [Management_Chain_06],
  e.[Management_Chain_07] AS [Management_Chain_07],
  e.[Management_Chain_08] AS [Management_Chain_08],
  e.[Management_Chain_09] AS [Management_Chain_09],
  e.[Management_Chain_10] AS [Management_Chain_10],
  e.[Management_Chain_11] AS [Management_Chain_11],
  e.[Management_Chain_12] AS [Management_Chain_12],
  e.[Management_Chain_13] AS [Management_Chain_13],
  e.[Management_Chain_14] AS [Management_Chain_14],
  e.[Manager_ID] AS [Manager_ID],
  e.[Manager] AS [Manager],

  /* Manager_Division: Move Korean managers to 'APAC' (from 'Japan') */
  CASE
    WHEN m.[Location] LIKE 'Korea%'                 THEN 'APAC - All Countries'
    WHEN m.[Country]  = 'United States of America'  THEN 'Americas - USA'
    WHEN m.[Country]  = 'Canada'                    THEN 'Americas - Canada'
    WHEN m.[Division] = 'LATAM'                     THEN 'Americas - Latin America'
    WHEN m.[Division] = 'APAC'                      THEN 'APAC - All Countries'
    WHEN m.[Division] = 'EMEA'                      THEN 'EMEA - All Countries'
    WHEN m.[Division] IS NULL                       THEN 'Americas - USA'
    ELSE m.[Division]
  END AS [Manager_Division],

  e.[Manager_Email] AS [Manager_Email],
  e.[Manager_Location] AS [Manager_Location],
  e.[Manager_Title] AS [Manager_Title],
  e.[Original_Hire_Date] AS [Original_Hire_Date],
  e.[Pay_Rate_Type] AS [Pay_Rate_Type],
  e.[Postal_Code] AS [Postal_Code],
  e.[Preferred_Name] AS [Preferred_Name],
  e.[Primary_Coverage_Country] AS [Primary_Coverage_Country],
  e.[Seniority_Date] AS [Seniority_Date],
  e.[State_Province] AS [State_Province],

  /* NULL out [Voluntary_Termination_Effective_Date] until fix is in place */ 
  NULL AS [Voluntary_Termination_Effective_Date],

  e.[Work_Space] AS [Work_Space],

  /* Use Is_Manager field to rebuild Job_Category for backwards compatibility */
  CASE
    WHEN e.[Is_Manager] = 1 THEN 'P' 
    ELSE 'C'
  END AS [Job_Category],
  e.[Is_Rehired] AS [Is_Rehired]

FROM [Workday_Feed_Daily_Final] e

LEFT JOIN [Workday_Feed_Daily_Final] m
  ON e.[Manager_ID] = m.[Employee_ID]

