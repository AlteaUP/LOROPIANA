sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zsubcontractingcockpitapp4/test/integration/FirstJourney',
		'zsubcontractingcockpitapp4/test/integration/pages/SubcontrgCockpitDeliveryMain'
    ],
    function(JourneyRunner, opaJourney, SubcontrgCockpitDeliveryMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zsubcontractingcockpitapp4') + '/index.html'
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