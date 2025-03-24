/*
Properties
Name	Workday Daily Feed - Run Data Distribution Automations
External Key	9e10fec4-88b7-4d05-b915-2df906c91897
Folder Location	Scripts
Description	This is the final step of the Workday_Daily_Feed automation to start all downstream data distribution automations.
*/

<script runat="server">
Platform.Load('core', '1');

function handleError(error) {
    // https://mateuszdabrowski.pl/docs/ssjs/debugging-ssjs/#logging-to-data-extension
    // DE Location: Data Extensions > DATA FEEDS > Workday Feed - INT0080 > Ingest > troubleshooting > Automation_Chain_Log
    Platform.Function.InsertData(
        'Automation_Chain_Log',
        ['id', 'errorSource', 'errorMessage', 'errorDescription'],
        [GUID(), 'handleError', error, error]
    );
};

try {
    // Workday Daily Feed Automations
    var automations = [
        "bc995d84-a486-46cb-8503-e47d574b6b16", // 517005801 - Tech Office
        "42a5ff25-bea7-455f-aaa8-0da51940846d", // 517001890 - BT M&A Acquisitions
        "ce88d2f6-ac0a-b1a4-efe8-e3e3a0cdfec2", // 8200448   - Business Technology
        "e3da00ef-6bd1-7cb5-f79a-5ad6139c34d6", // 517001519 - BizTech
        "6218e24d-34a4-ca9f-994d-2ba681d95c9b", // 8200437   - Employee Engagement 
        "4bda5dd6-6b09-45e9-89e9-f88191dfb253", // 8211856   - Peopleforce
        "0849e191-7118-16c5-7fa6-0856da04467a", // 517022758 - GO Center
       // "49a5c91e-6a66-5050-2833-01aa07f6f5f5", // 517002683 - Technology and Product Training
        "475a67d2-46fe-6612-f006-7b0910f166ab"  // 8212036   - MC Executive Communications 
    ];
    var api = new Script.Util.WSProxy();
    api.setClientId({ "ID": 517011263 });

    for (var i = 0; i < automations.length; i++) {
        try {
            var data = api.performItem("Automation", { CustomerKey: automations[i] }, "Start");
            handleError(Stringify(data));
        } catch(e) {
            handleError(Stringify(e));
        }
    }
} catch(e) {
    handleError(Stringify(e));
}

</script> 
