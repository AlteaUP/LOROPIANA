sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zsubcontractingcockpitapp5/test/integration/FirstJourney',
		'zsubcontractingcockpitapp5/test/integration/pages/SubcontrgCockpitDeliveryMain'
    ],
    function(JourneyRunner, opaJourney, SubcontrgCockpitDeliveryMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zsubcontractingcockpitapp5') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSubcontrgCockpitDeliveryMain: SubcontrgCockpitDeliveryMain
                }
            },
            opaJourney.run
        );
    }
);