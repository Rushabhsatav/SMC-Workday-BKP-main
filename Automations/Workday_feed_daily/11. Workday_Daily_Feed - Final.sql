/*
Properties
Name	Workday_Daily_Feed - Final
External Key	d7220ee1-9090-408a-be61-143d9579971e
Folder Location	Query
Description	

Target Data Extension
Data Extension	Workday_Feed_Daily_Final
Data Action	Overwrite
*/

SELECT * 

FROM [Workday_Feed_Daily_Staging] s

WHERE
  /* "INT0080 - Day 1 Fix" adds new hire rows up to one day early depending on
     local timezone. The following code releases these rows more carefully based
     on Division: 
       - Hold back rows for AMER and LATAM until the next day (too early).
       - Allow rows for EMEA, APAC, and Japan today since their local Day 1 
         starts within the next 24 hours.
  */
  NOT (
    DATEDIFF(d, s.Hire_Date, GetDate()) < 0
    AND Division IN ('AMER', 'LATAM')
  )
