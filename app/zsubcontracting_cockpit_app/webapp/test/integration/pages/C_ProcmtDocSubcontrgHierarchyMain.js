sap.ui.define(['sap/fe/test/TemplatePage'], function(TemplatePage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new TemplatePage(
        'zsubcontracting.cockpit.app.zsubcontractingcockpitapp::C_ProcmtDocSubcontrgHierarchyMain',
        CustomPageDefinitions
    );
});