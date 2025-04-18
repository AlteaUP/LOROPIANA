sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel"
], (Controller, JSONModel) => {
    "use strict";

    var oController = null;

    return Controller.extend("zsubcontracting.cockpit.app3.zsubcontractingcockpitapp3.controller.Main", {
        
        oController: oController,

        onInit: function () {
            oController = this;
        },

        onBeforeRendering: function (oEvent) {

            oController._CatalogServiceModel = oController.getOwnerComponent().getModel("CatalogServiceData");

            ///////////////////////////////////////////////////////////////////
            // COMPANIES
            ///////////////////////////////////////////////////////////////////
            //var URL = oController._TRSModel.sServiceUrl;
            //if (URL.substring(0, 1) !== "/") {
            //    URL = "/" + URL;
            //}

            // @ts-ignore

            sap.ui.core.BusyIndicator.show();
            $.ajax({
                url: oController._CatalogServiceModel.sServiceUrl + "/C_ProcmtDocSubcontrgHierarchy",
                type: "GET",
                success: function (oData) {
                    console.log("successo")
                    var data = oData.value[0].d.results
                    // elimino record con numero documento vuoto
                    data = data.filter(item => !(item.PurchasingDocument === ''));
                    
                    var oTable = oController.byId("documentPositionTable");
                    
                    var oModel = new JSONModel();
                    oModel.setData({ items: data})
                    oTable.setModel(oModel);
                    sap.ui.core.BusyIndicator.hide();

                },
                error: function (oResult) {
                    console.log("errore")
                    sap.ui.core.BusyIndicator.hide();

                }
            });
 
        }


    });
});