sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zsubcontractingcockpitapp2/test/integration/FirstJourney',
		'zsubcontractingcockpitapp2/test/integration/pages/C_ProcmtDocSubcontrgHierarchyMain'
    ],
    function(JourneyRunner, opaJourney, C_ProcmtDocSubcontrgHierarchyMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zsubcontractingcockpitapp2') + '/index.html'
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