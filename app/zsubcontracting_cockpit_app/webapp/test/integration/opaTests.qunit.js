sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zsubcontracting/cockpit/app/zsubcontractingcockpitapp/test/integration/FirstJourney',
		'zsubcontracting/cockpit/app/zsubcontractingcockpitapp/test/integration/pages/C_ProcmtDocSubcontrgHierarchyMain'
    ],
    function(JourneyRunner, opaJourney, C_ProcmtDocSubcontrgHierarchyMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zsubcontracting/cockpit/app/zsubcontractingcockpitapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheC_ProcmtDocSubcontrgHierarchyMain: C_ProcmtDocSubcontrgHierarchyMain
                }
            },
            opaJourney.run
        );
    }
);