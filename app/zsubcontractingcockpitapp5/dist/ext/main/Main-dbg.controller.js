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

        return PageController.extend('zsubcontractingcockpitapp5.ext.main.Main', {
            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf zsubcontractingcockpitapp5.ext.main.Main
             */
            onInit: function () {
                oController = this;
                PageController.prototype.onInit.apply(this, arguments); // needs to be called to properly initialize the page controller                
            },

            /**
             * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
             * (NOT before the first rendering! onInit() is used for that one!).
             * @memberOf zsubcontractingcockpitapp5.ext.main.Main
             */
              onBeforeRendering: function() {
                oController._mainService = oController.getOwnerComponent().getModel();
              },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf zsubcontractingcockpitapp5.ext.main.Main
             */
            onAfterRendering: function() {
                oController._mainService = oController.getOwnerComponent().getModel();
            },
    
            closeCreateMaterialDocumentsDialog: function() {
    
                oController.pManualNumberingDialog.close();
    
            },

            loadTableData: function(oEvent){
                var mBindingParams = oEvent.getParameter("collectionBindingInfo");
                //Event handlers for the binding
                mBindingParams.collectionBindingInfo.events = {
                    "dataReceived" : function(oEvent){
                        var aReceivedData = oEvent.getParameter('data');
                        },
                        //More event handling can be done here
                };
            },

            onCreateMaterialDocuments: function(oEvent) {

                if(oController.pManualNumberingDialog === null || oController.pManualNumberingDialog === undefined){
                    oController.pManualNumberingDialog = sap.ui.xmlfragment(this.getView().getId(), "zsubcontractingcockpitapp5.ext.Fragment.MaterialDocumentCreation",
                    oController);
                    oController.getView().addDependent(oController.pManualNumberingDialog);
                }

                oController.pManualNumberingDialog.open();

                // setto dato per sapere quale pulsante sia stato premuto
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

                // creo array dei materiali selezionati
                var selectedMaterialArray = []
                var found543 = false
                for(var i=0; i<oController.byId("TableOrderId").getSelectedContexts().length; i++){
                    
                    // se è presente un 543, disabilito obbligatorietà dello shipping point
                    if(oController.byId("TableOrderId").getSelectedContexts()[i].getObject().requirementtype === "BB" && oController.byId("ManualAccountingDialog").data("buttonPressed") === "factory"){
                        found543 = true                        
                    }
                    selectedMaterialArray.push(oController.byId("TableOrderId").getSelectedContexts()[i].getObject())
                    if(oController.byId("TableOrderId").getSelectedContexts()[i].getObject().requirementtype === "BB" && oController.byId("ManualAccountingDialog").data("buttonPressed") === "factory"){
                        if(selectedMaterialArray[i].QtyToIssue > selectedMaterialArray[i].AvaibilityQtyProdStorage){
                            selectedMaterialArray[i].QtyToIssue = selectedMaterialArray[i].AvaibilityQtyProdStorage
                        }
                    } else if(oController.byId("TableOrderId").getSelectedContexts()[i].getObject().requirementtype === "BB" && oController.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                        if(selectedMaterialArray[i].QtyToIssue > selectedMaterialArray[i].AvaibilityQtyProdStorage){
                            selectedMaterialArray[i].TotalWithdrawnQuantity = selectedMaterialArray[i].AvaibilityQtyProdStorage
                        } else {
                            selectedMaterialArray[i].TotalWithdrawnQuantity = selectedMaterialArray[i].QtyToIssue
                        }
                        selectedMaterialArray[i].QtyToIssue =  Number(selectedMaterialArray[i].QtyToIssue) - Number(selectedMaterialArray[i].AvaibilityQtyProdStorage)
                        if(selectedMaterialArray[i].QtyToIssue < 0){
                            selectedMaterialArray[i].QtyToIssue = 0
                        }
                    }
                }

                if(found543){
                    oController.byId("shippingPointID").setRequired(false)
                } else {
                    oController.byId("shippingPointID").setRequired(true)
                }

                var oTable = oController.byId("selectedMaterialTableId");
                    
                var oModel = new JSONModel();
                oModel.setData({ SelectedMaterial: selectedMaterialArray})
                oTable.setModel(oModel);                
                
            },

            zeroPad: function(num, totDigit) {
                return num.toString().padStart(totDigit, "0");
            },

            onConfirmMaterialDocumentCreationDialog: async function() {

                // controllo che VSTEL sia valorizzato
                if(!this.byId("shippingPointID").getRequired() || ( this.byId("shippingPointID").getValue() !== null && this.byId("shippingPointID").getValue() !== undefined && this.byId("shippingPointID").getValue() !== "")){
                    var oBusyDialog = new sap.m.BusyDialog();

                    oBusyDialog.open();

                    var dataObject = oController.byId("ManualAccountingDialog").data();  // a JS object containing ALL data

                    var dataToSend = []
                    var dataToSendObject = {}
                    for(var i=0; i<this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial.length; i++){
                        if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].requirementtype === "BB" && this.byId("ManualAccountingDialog").data("buttonPressed") === "factory"){ //&& this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].InventorySpecialStockType === 'O'){
                            //543

                            var qtyInserted = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue

                            // recupero array dei componenti
                            const oModel = oController.getView().getModel();

                            const oList = oModel.bindList("/ZZ1_I_UNION_SUBCONCTR_COMP");
                            const filterMatnr = new sap.ui.model.Filter("Material", 'EQ', this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Material)
                            const filterCombined = new sap.ui.model.Filter("CprodOrd", 'EQ', this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].CprodOrd)
                            const filterBatch = new sap.ui.model.Filter("Batch", 'EQ', this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Batch)
                            oList.filter([filterCombined, filterMatnr, filterBatch]);

                            const pContexts = await oList.requestContexts(0, 20)
                            var arrayComponents = pContexts.map(oContext => oContext.getObject());

                            // chiamata action per recuperare stock passando material e fornitore
                            const oModel2 = oController.getView().getModel();                            

                            let requestObjectStockAPI = {}
                            requestObjectStockAPI.Material = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Material
                            requestObjectStockAPI.Supplier = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Supplier

                            var oBindingContext = oModel2.bindContext("/GetMaterialStock(...)");
                            oBindingContext.setParameter("Object", 
                                requestObjectStockAPI
                            );
                            await oBindingContext.execute().then(async () => {
                                var oContext = oBindingContext.getBoundContext();                                 
                                var arrayStock = oContext.getObject().value
                                //oBusyDialog.close();

                                // calcolo array da passare all'API di creazione documento materiale
                                let objectToCreateMaterialDocument = {}
                                let arrayToCreateMaterialDocument = []
                                var totalQty = 0
                                var remainingQty = 0
                                for(var y=0; y<arrayComponents.length; y++){
                                    if(totalQty <= Number(qtyInserted)){
                                        let qty = Number(arrayComponents[y].RequiredQuantity - arrayComponents[y].WithdrawnQuantity)
                                        for(var z=0; z<arrayStock.length; z++){    
                                            if(qty > 0 && totalQty <= Number(qtyInserted)){                                    
                                                if(qty < Number(arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit) && qty < Number(qtyInserted)){
                                                    objectToCreateMaterialDocument = {}
                                                    //objectToCreateMaterialDocument.Reservation = arrayComponents[y].Reservation
                                                    //objectToCreateMaterialDocument.ReservationItem = arrayComponents[y].ReservationItem
                                                    objectToCreateMaterialDocument.MasterProductionOrder = arrayComponents[y].MasterProductionOrder
                                                    if(arrayStock[z].Batch !== undefined && arrayStock[z].Batch !== null && arrayStock[z].Batch !== ""){
                                                        objectToCreateMaterialDocument.Batch = oController.zeroPad(arrayStock[z].Batch, 10)
                                                    } else {
                                                        objectToCreateMaterialDocument.Batch = arrayStock[z].Batch
                                                    }
                                                    objectToCreateMaterialDocument.Quantity = qty
                                                    objectToCreateMaterialDocument.Material = arrayComponents[y].Material
                                                    objectToCreateMaterialDocument.Plant = arrayComponents[y].Plant
                                                    objectToCreateMaterialDocument.CprodOrd = arrayComponents[y].CprodOrd
                                                    objectToCreateMaterialDocument.UnitMeasure = arrayComponents[y].BaseUnit
                                                    objectToCreateMaterialDocument.PurchaseOrder = arrayComponents[y].PurchaseOrder
                                                    objectToCreateMaterialDocument.PurchaseOrderItem = arrayComponents[y].PurchaseOrderItem
                                                    objectToCreateMaterialDocument.Supplier = oController.zeroPad(arrayComponents[y].Supplier, 10)
                                                    objectToCreateMaterialDocument.ManufacturingOrder = oController.zeroPad(arrayComponents[y].ManufacturingOrder, 12)
                                                    objectToCreateMaterialDocument.ManufacturingOrderOperation = arrayComponents[y].ManufacturingOrderOperation
                                                    arrayToCreateMaterialDocument.push(objectToCreateMaterialDocument)
                                                    arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit = arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit - qty
                                                    qty = qty - objectToCreateMaterialDocument.Quantity
                                                    totalQty = Number(totalQty) + Number(objectToCreateMaterialDocument.Quantity)
                                                    remainingQty = Number(qtyInserted) - totalQty
                                                } else {
                                                    if(arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit > 0){
                                                        objectToCreateMaterialDocument = {}
                                                        //objectToCreateMaterialDocument.Reservation = arrayComponents[y].Reservation
                                                        //objectToCreateMaterialDocument.ReservationItem = arrayComponents[y].ReservationItem
                                                        objectToCreateMaterialDocument.MasterProductionOrder = arrayComponents[y].MasterProductionOrder
                                                        if(arrayStock[z].Batch !== undefined && arrayStock[z].Batch !== null && arrayStock[z].Batch !== ""){
                                                            objectToCreateMaterialDocument.Batch = oController.zeroPad(arrayStock[z].Batch, 10)
                                                        } else {
                                                            objectToCreateMaterialDocument.Batch = arrayStock[z].Batch
                                                        }
                                                        if(totalQty >= Number(arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit)){
                                                            objectToCreateMaterialDocument.Quantity = remainingQty                                                            
                                                        } else {
                                                            objectToCreateMaterialDocument.Quantity = Number(arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit)
                                                        }                                
                                                        objectToCreateMaterialDocument.Material = arrayComponents[y].Material                     
                                                        objectToCreateMaterialDocument.Plant = arrayComponents[y].Plant
                                                        objectToCreateMaterialDocument.CprodOrd = arrayComponents[y].CprodOrd
                                                        objectToCreateMaterialDocument.UnitMeasure = arrayComponents[y].BaseUnit
                                                        objectToCreateMaterialDocument.PurchaseOrder = arrayComponents[y].PurchaseOrder
                                                        objectToCreateMaterialDocument.PurchaseOrderItem = arrayComponents[y].PurchaseOrderItem
                                                        objectToCreateMaterialDocument.Supplier = oController.zeroPad(arrayComponents[y].Supplier, 10) 
                                                        objectToCreateMaterialDocument.ManufacturingOrder = oController.zeroPad(arrayComponents[y].ManufacturingOrder, 12)
                                                        objectToCreateMaterialDocument.ManufacturingOrderOperation = arrayComponents[y].ManufacturingOrderOperation  
                                                        arrayToCreateMaterialDocument.push(objectToCreateMaterialDocument)
                                                        qty = qty - arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit
                                                        arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit = arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit - objectToCreateMaterialDocument.Quantity
                                                        totalQty = Number(totalQty) + Number(objectToCreateMaterialDocument.Quantity)
                                                        remainingQty = Number(qtyInserted) - totalQty
                                                    }
                                                }
                                                if(Number(remainingQty) === 0){
                                                    break
                                                }
                                            }
                                        }
                                    } else {
                                        break
                                    }                                    
                                }

                                console.log("finito di creare array")

                                // chiamata API di creazione documento materiale
                                const oModel3 = oController.getView().getModel();
                                var oBindingContext2 = oModel3.bindContext("/CreateMaterialDocument(...)");

                                await oBindingContext2.setParameter("Record", 
                                    arrayToCreateMaterialDocument
                                );
                                oBindingContext2.execute().then((oResult) => {
                                    oBusyDialog.close();
                                    // TODO - gestione errore
                                    //alert("Material Document Created!")
                                    oController.openDialogMessageText("", "I");
                                }).catch((oError) => {
                                    oBusyDialog.close();
                                    // TODO - gestione errore
                                    oController.openDialogMessageText("", "E");
                                });
                                
                            }).catch((oError) => {
                                oBusyDialog.close();
                                // TODO - gestione errore
                            });

                        } else {
                            dataToSendObject = {}
                            dataToSendObject.Material = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Material
                            dataToSendObject.Batch = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Batch
                            dataToSendObject.Stock = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].StockMaterial
                            dataToSendObject.Quantity = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue
                            dataToSendObject.CprodOrd = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].CprodOrd
                            dataToSendObject.CprodOrd = oController.zeroPad(dataToSendObject.CprodOrd, 12)
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
                    }

                    var URL = oController._mainService.sServiceUrl;
                    /*if (URL.substring(0, 1) !== "/") {
                        URL = "/" + URL;
                    }*/

                    // @ts-ignore
                    /*$.ajax({
                        url: URL + "/CreateDelivery",
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
                    });*/
                    const oModel = oController.getView().getModel();
                    const oBindingContext3 = oModel.bindContext("/CreateDelivery(...)");

                    oBindingContext3.setParameter("Record", 
                        dataToSend
                    );
                    oBindingContext3.execute().then((oResult) => {
                        oBusyDialog.close();
                        oController.openDialogMessageText("", "I");
                    }).catch((oError) => {
                        oBusyDialog.close();
                        oController.openDialogMessageText("", "E");
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
                    oController.pShippingPointDialog = sap.ui.xmlfragment(this.getView().getId(), "zsubcontractingcockpitapp5.ext.Fragment.ShippingPointList",
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
             * @memberOf zsubcontractingcockpitapp5.ext.main.Main
             */
            //  onExit: function() {
            //
            //  }
        });
    }
);
