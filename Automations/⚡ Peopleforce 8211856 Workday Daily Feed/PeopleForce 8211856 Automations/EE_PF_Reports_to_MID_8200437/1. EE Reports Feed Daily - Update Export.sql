/*
Properties
Name	EE Reports Feed Daily - Update Export
External Key	3241E3E8-438F-482E-834E-D5D507705D16
Folder Location	Query/Reports
Description	

Target Data Extension
Data Extension	EE_Reports_Feed_Daily_Export
Data Action	Update
*/

SELECT	*

FROM [EE_Reports]

WHERE Delivered > 0

AND Folder_Path LIKE 'My tracking\Journeys\PF_%'