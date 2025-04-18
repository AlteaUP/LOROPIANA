sap.ui.define([
    "sap/ui/core/UIComponent",
    "zsubcontracting/cockpit/app3/zsubcontractingcockpitapp3/model/models",
    "sap/ui/model/odata/ODataModel",
	"sap/ui/model/json/JSONModel"
], (UIComponent, models, ODataModel, JSONModel) => {
    "use strict";

    return UIComponent.extend("zsubcontracting.cockpit.app3.zsubcontractingcockpitapp3.Component", {
        metadata: {
            manifest: "json",
            interfaces: [
                "sap.ui.core.IAsyncContentCreation"
            ]
        },

        init() {
            // call the base component's init function
            UIComponent.prototype.init.apply(this, arguments);

            // set the device model
            this.setModel(models.createDeviceModel(), "device");

            // enable routing
            this.getRouter().initialize();

            //******************************************************************************************************************//				
            //******************************************************************************************************************//	
            // SETTIAMO MODELLO PRINCIPALE oDATA
            //******************************************************************************************************************//				
            //******************************************************************************************************************//	
            //create odata model for kapsel application
            var param = {
                "json": true,
                loadMetadataAsync: false
            };

            var sServiceUrl = "/odata/v4/catalog/";
            var oModel = new ODataModel(sServiceUrl, param);

            //disabilita HEAD per gestione del token
            oModel.bDisableHeadRequestForToken = true;
            oModel.setDefaultCountMode(false);
            //this.getModel().bUseBatch = true;
            oModel.iSizeLimit = 1000000; //Limite righe di DEFAULT a 100

            oModel.setDefaultBindingMode("TwoWay");

            this.setModel(oModel, "CatalogServiceData");
        }
    });
});