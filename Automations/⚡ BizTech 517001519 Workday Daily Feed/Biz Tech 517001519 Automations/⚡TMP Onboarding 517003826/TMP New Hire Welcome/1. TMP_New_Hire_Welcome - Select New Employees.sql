/*
Properties
Name	TMP_New_Hire_Welcome - Select New Employees
External Key	678c2204-83f1-4d38-96ed-97f391cb3ecb
Folder Location	Query
Description	

Target Data Extension
Data Extension	TMP_Onboarding_Welcome
Data Action	Update
*/

SELECT wd.*
FROM ENT.Daily_WD_Data_TMP_Onboarding wd
WHERE wd.Management_Chain_Level_03 IN (
    'Bradford Burns (751453)',
    'David Schmaier (778000)',
    'Srinivas Tallapragada (709100)',
    'Mark Nelson (783128)',
    'Brent Hayward (749690)'
)
AND wd.Management_Chain_Level_05 NOT IN (
    'Bijan Bedroud (765673)',
    'Travis Fabian (100920)',
    'Marc Ferris (702301)',
    'Kevin Francis (767849)',
    'Allyson Fryhoff (703035)',
    'Jim Stroka (100283)'
)
AND wd.Management_Chain_Level_06 != 'Jessica Hood (714144)'
AND wd.Management_Chain_Level_04 != 'Kevin Gibbs (734993)'
AND wd.Business_Unit NOT IN (
    '1631-Salesforce.org NGO',
    '1621-Quip'
)
AND wd.Employee_ID NOT IN (
    SELECT
    h.Employee_ID
    FROM TMP_Onboarding_New_Hire_History h
)