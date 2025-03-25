/*
Properties
Name	TMP_New_Hire_Welcome - Update TMP_Onboarding_New_Hire_History
External Key	f5f32002-35e3-4b65-96a2-8153bd7240a6
Folder Location	Query
Description	

Target Data Extension
Data Extension	TMP_Onboarding_New_Hire_History
Data Action	Update
*/

SELECT
we.Employee_ID,
GETDATE() AS Created_Date
FROM TMP_Onboarding_Welcome we
WHERE we.Employee_ID NOT IN (
    SELECT
    h.Employee_ID
    FROM TMP_Onboarding_New_Hire_History h
)