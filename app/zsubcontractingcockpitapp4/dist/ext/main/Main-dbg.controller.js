sap.ui.define(
    [
        'sap/fe/core/PageController',
        "sap/ui/model/json/JSONModel",
        "sap/m/Dialog",
        'sap/m/MessageToast'
    ],
    function(PageController, JSONModel, Dialog, MessageToast) {
        'use strict';

        var oController;

        return PageController.extend('zsubcontractingcockpitapp4.ext.main.Main', {
            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf zsubcontractingcockpitapp4.ext.main.Main
             */
            onInit: function () {
                oController = this;
                PageController.prototype.onInit.apply(this, arguments); // needs to be called to properly initialize the page controller
            },

            /**
             * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
             * (NOT before the first rendering! onInit() is used for that one!).
             * @memberOf zsubcontractingcockpitapp4.ext.main.Main
             */
              onBeforeRendering: function() {
                oController._mainService = oController.getOwnerComponent().getModel();
              },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf zsubcontractingcockpitapp4.ext.main.Main
             */
            onAfterRendering: function() {
                oController._mainService = oController.getOwnerComponent().getModel();
            },
    
            closeCreateMaterialDocumentsDialog: function() {
    
                oController.pManualNumberingDialog.close();
    
            },

            onCreateMaterialDocuments: function(oEvent) {

                if(oController.pManualNumberingDialog === null || oController.pManualNumberingDialog === undefined){
                    oController.pManualNumberingDialog = sap.ui.xmlfragment(this.getView().getId(), "zsubcontractingcockpitapp4.ext.Fragment.MaterialDocumentCreation",
                    oController);
                    oController.getView().addDependent(oController.pManualNumberingDialog);
                }

                oController.pManualNumberingDialog.open();

                // creo array dei materiali selezionati
                var selectedMaterialArray = []
                for(var i=0; i<oController.byId("TableOrderId").getSelectedContexts().length; i++){
                    selectedMaterialArray.push(oController.byId("TableOrderId").getSelectedContexts()[i].getObject())
                }

                if(oEvent.getParameters().id.indexOf("customAction2") > -1){
                    // from HUB
                    oController.byId("lgort1ID").setVisible(true)
                    oController.byId("lgort2ID").setVisible(false)
                    oController.byId("ManualAccountingDialog").data("buttonPressed", "HUB")
                } else {
                    // from Factory
                    oController.byId("lgort1ID").setVisible(false)
                    oController.byId("lgort2ID").setVisible(true)
                    oController.byId("ManualAccountingDialog").data("buttonPressed", "factory")
                }

                var oTable = oController.byId("selectedMaterialTableId");
                    
                var oModel = new JSONModel();
                oModel.setData({ SelectedMaterial: selectedMaterialArray})
                oTable.setModel(oModel);                
                
            },

            zeroPad: function(num) {
                return num.toString().padStart(12, "0");
            },

            onConfirmMaterialDocumentCreationDialog: function() {

                // controllo che VSTEL sia valorizzato
                if(this.byId("shippingPointID").getValue() !== null && this.byId("shippingPointID").getValue() !== undefined && this.byId("shippingPointID").getValue() !== ""){
                    var oBusyDialog = new sap.m.BusyDialog();

                    oBusyDialog.open();

                    var dataObject = oController.byId("ManualAccountingDialog").data();  // a JS object containing ALL data

                    var dataToSend = []
                    var dataToSendObject = {}
                    for(var i=0; i<this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial.length; i++){
                        dataToSendObject = {}
                        dataToSendObject.Material = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Material
                        dataToSendObject.Batch = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Batch
                        dataToSendObject.Stock = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].StockMaterial
                        dataToSendObject.Quantity = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].TotalConfdQtyForATPInBaseUoM
                        dataToSendObject.CprodOrd = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].CprodOrd
                        dataToSendObject.CprodOrd = oController.zeroPad(dataToSendObject.CprodOrd)
                        dataToSendObject.UnitMeasure = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].EntryUnit
                        dataToSendObject.Plant = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Plant
                        dataToSendObject.WorkCenterInternalID = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].WorkCenterInternalID
                        //if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Lgort1 !== null && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Lgort1 !== undefined && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Lgort1 !== ""){
                        if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                            dataToSendObject.Lgort = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Lgort1
                        } else {
                            dataToSendObject.Lgort = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Lgort2
                        }                    
                        dataToSendObject.Vstel = this.byId("shippingPointID").getValue()
                        dataToSendObject.Supplier = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Supplier
                        if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].requirementtype === "BB"){
                            dataToSendObject.Bwart = "541"
                            dataToSendObject.Lfart = "LB"
                            dataToSendObject.Customer = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Customer
                            dataToSendObject.Supplier = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Supplier
                        } else {
                            if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                                dataToSendObject.Bwart = "313"
                            } else {
                                // pulsante Factory
                                dataToSendObject.Bwart = "311"
                            }
                            dataToSendObject.Lfart = "ZHOD"
                        }
                        dataToSend.push(dataToSendObject)
                    }

                    var URL = oController._mainService.sServiceUrl;
                    /*if (URL.substring(0, 1) !== "/") {
                        URL = "/" + URL;
                    }*/

                    // @ts-ignore
                    $.ajax({
                        url: URL + "/CreateMaterialDocument",
                        type: "POST",
                        data: JSON.stringify({Record:{Records:dataToSend}}),
                        //data: dataToSend,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (oData, oResponse, oContext) {
                            oBusyDialog.close();
                            if (oData) {
                                if(oData.Error){
                                    oController.openDialogMessageText(oData.Message, "E");
                                } else {
                                    oController.openDialogMessageText(oData.Message, "I");
                                }
                            } else {
                                oController.openDialogMessageText("", "I");
                            }
                        },

                        error: function (oResult) {
                            oBusyDialog.close();
                            if (oResult) {
                                if (oResult.responseJSON) {
                                    oController.openDialogMessageText(oResult.responseJSON.error.message, "E");
                                } else {
                                    oController.openDialogMessageText("", "E");
                                }
                            } else {
                                oController.openDialogMessageText("", "E");
                            }

                        }
                    });

                    oController.pManualNumberingDialog.close();
                } else {
                    MessageToast.show(oController.getResourceBundle().getText("vstelMandatory"))
                }
            
            },

            onCloseMaterialDocumentCreationDialog: function() {
                oController.pManualNumberingDialog.close();
            },

            getResourceBundle: function () {
                return oController.getOwnerComponent().getModel("i18n").getResourceBundle();
            },
    
            openDialogMessageText: function (text, messType) {
                var vTitle = "Message";
                var vState = "Error";
    
                if (messType === "E") {
                    vTitle = this.getResourceBundle().getText("errorTitle");
                    vState = "Error";
                } else
                    if (messType === "I") {
                        vTitle = this.getResourceBundle().getText("successTitle");
                        vState = "Success";
                    }
    
                var dialog = new Dialog({
                    title: vTitle,
                    type: "Message",
                    state: vState,
                    content: new sap.m.Text({
                        text: text
                    }),
    
                    beginButton: new sap.m.Button({
                        text: "OK",
                        press: function () {
                            dialog.close();
                        }
                    }),
                    afterClose: function () {
                        dialog.destroy();
                    }
                });
    
                dialog.open();
            },

            onValueHelpRequestShippingPoint: function (oEvent) {
                this.byId("shippingPointID").setValue();
                if(oController.pShippingPointDialog === null || oController.pShippingPointDialog === undefined){
                    oController.pShippingPointDialog = sap.ui.xmlfragment(this.getView().getId(), "zsubcontractingcockpitapp4.ext.Fragment.ShippingPointList",
                    oController);
                    oController.getView().addDependent(oController.pShippingPointDialog);
                }

                oController.pShippingPointDialog.open();
            },

            onValueHelpShippingPointConfirm: function(oEvent){
                var oSelectedItem = oEvent.getParameter("selectedItem");
                oEvent.getSource().getBinding("items").filter([]);

                if (!oSelectedItem) {
                    return;
                }

                this.byId("shippingPointID").setValue(oSelectedItem.getTitle());

                oController.pShippingPointDialog.close();
            },

            onValueHelpShippingPointClose: function(oEvent){
                oController.pShippingPointDialog.close();
            },

            onValueHelpShippingPointSearch: function(oEvent){
                var sValue = oEvent.getParameter("value");
			    var oFilter = new Filter("Name", FilterOperator.Contains, sValue);

			    oEvent.getSource().getBinding("items").filter([oFilter]);
            }   

            /**
             * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
             * @memberOf zsubcontractingcockpitapp4.ext.main.Main
             */
            //  onExit: function() {
            //
            //  }
        });
    }
);
