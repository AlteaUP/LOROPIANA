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
                        // gestione errore
                        if(oEvent.mParameters.error !== undefined && oEvent.mParameters.error !== null){
                            oController.openDialogMessageText(oEvent.mParameters.error.message , "E");
                        }
                        },
                        //More event handling can be done here
                };

                //delete mBindingParams.collectionBindingInfo.parameters.$$getKeepAliveContext
            },

            clearFields: function(oEvent){
                oController.byId("shippingPointID").setValue();
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
                        if(Number(selectedMaterialArray[i].QtyToIssue) > Number(selectedMaterialArray[i].AvaibilityQtyProdStorage)){
                            selectedMaterialArray[i].QtyToIssue = selectedMaterialArray[i].AvaibilityQtyProdStorage
                        }
                        if(Number(selectedMaterialArray[i].QtyToIssue) > Number(selectedMaterialArray[i].AvaibilityQtyProdStorage)){
                            selectedMaterialArray[i].TotalWithdrawnQuantity = selectedMaterialArray[i].AvaibilityQtyProdStorage
                        } else {
                            selectedMaterialArray[i].TotalWithdrawnQuantity = selectedMaterialArray[i].QtyToIssue
                        }
                        selectedMaterialArray[i].QtyToIssue =  Number(selectedMaterialArray[i].QtyToIssue) - Number(selectedMaterialArray[i].AvaibilityQtyProdStorage)
                        if(selectedMaterialArray[i].QtyToIssue < 0){
                            selectedMaterialArray[i].QtyToIssue = 0
                        }
                    } else if(oController.byId("TableOrderId").getSelectedContexts()[i].getObject().requirementtype === "BB" && oController.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                        if(Number(selectedMaterialArray[i].QtyToIssue) > Number(selectedMaterialArray[i].AvaibilityQtyProdStorage)){
                            selectedMaterialArray[i].TotalWithdrawnQuantity = selectedMaterialArray[i].AvaibilityQtyProdStorage
                        } else {
                            selectedMaterialArray[i].TotalWithdrawnQuantity = selectedMaterialArray[i].QtyToIssue
                        }
                        selectedMaterialArray[i].QtyToIssue =  Number(selectedMaterialArray[i].QtyToIssue) - Number(selectedMaterialArray[i].AvaibilityQtyProdStorage)
                        if(selectedMaterialArray[i].QtyToIssue < 0){
                            selectedMaterialArray[i].QtyToIssue = 0
                        }
                    }
                    selectedMaterialArray[i].QtyToIssue = this.parseAndFormatNumber(selectedMaterialArray[i].QtyToIssue);
                    selectedMaterialArray[i].TotalConfdQtyForATPInBaseUoM = this.parseAndFormatNumber(selectedMaterialArray[i].TotalConfdQtyForATPInBaseUoM);
                    selectedMaterialArray[i].TotalWithdrawnQuantity = this.parseAndFormatNumber(selectedMaterialArray[i].TotalWithdrawnQuantity);
                    selectedMaterialArray[i].QtyToIssueOriginal = selectedMaterialArray[i].QtyToIssue
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

            parseAndFormatNumber: function(input) {
                //if (typeof input !== "string") return "";
            
                // Rimuove i punti usati come separatori delle migliaia
                const cleaned = input.toString().replace(/\,/g, '');
            
                // Sostituisce la virgola decimale con il punto
                const normalized = cleaned.toString().replace(',', '.');
            
                // Converte in numero
                const num = parseFloat(normalized);
            
                if (isNaN(num)) return "";
            
                // Format secondo lo stile italiano
                return num.toLocaleString('it-IT', {
                  minimumFractionDigits: num % 1 !== 0 ? 2 : 0,
                  maximumFractionDigits: 20
                });
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
                    var objectToCreateMaterialDocument = {}
                    var arrayToCreateMaterialDocument = []
                    var found543 = false
                    for(var i=0; i<this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial.length; i++){
                        if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].requirementtype === "BB" && this.byId("ManualAccountingDialog").data("buttonPressed") === "factory"){ //&& this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].InventorySpecialStockType === 'O'){
                            //543
                            found543 = true
                            var qtyInserted = ''
                            if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue !== "" && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue !== null && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue !== undefined && Number(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue > 0)){
                                qtyInserted = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue
                            } else {
                                qtyInserted = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].TotalWithdrawnQuantity
                            }

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
                                //let objectToCreateMaterialDocument = {}
                                //let arrayToCreateMaterialDocument = []
                                var totalQty = 0
                                var remainingQty = qtyInserted
                                for(var y=0; y<arrayComponents.length; y++){
                                    if(totalQty <= Number(qtyInserted)){
                                        let qty = Number(arrayComponents[y].RequiredQuantity - arrayComponents[y].WithdrawnQuantity)
                                        for(var z=0; z<arrayStock.length; z++){    
                                            if(qty > 0 && totalQty <= Number(qtyInserted) && Number(remainingQty) > 0){                                    
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
                                                        if(Number(qtyInserted) <= Number(arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit)){
                                                            objectToCreateMaterialDocument.Quantity = qtyInserted
                                                        } else if(totalQty >= Number(arrayStock[z].MatlWrhsStkQtyInMatlBaseUnit)){
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
                                                // modifica DL - 07/05/2025, aggiungo controllo su array con almeno 1 elemento
                                                if(Number(remainingQty) === 0 && arrayToCreateMaterialDocument.length > 0){
                                                    break
                                                }
                                            }
                                        }
                                    } else {
                                        break
                                    }                                    
                                }

                                console.log("finito di creare array")                                
                                
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
                            // modifica DL - 10/06/2025 - problema decimali
                            if((dataToSendObject.Quantity).indexOf(",") > -1){
                                dataToSendObject.Quantity = dataToSendObject.Quantity.replace(",",".")
                            }
                            // modifica DL - 10/06/2025 - problema decimali - FINE
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
                                // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock
                                let parentStockSegment = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].ParentStockSegment
                                if(parentStockSegment === "" || parentStockSegment === null || parentStockSegment === undefined){
                                    dataToSendObject.Lfart = "ZHOD"
                                } else {                                    
                                    switch (parentStockSegment) {
                                        case "CAM":
                                          dataToSendObject.Lfart = "ZCAE"
                                          break;
                                        case "ESS":
                                          dataToSendObject.Lfart = "ZESE"
                                          break;
                                        case "MTO":
                                          dataToSendObject.Lfart = "ZMTE"
                                          break;
                                        case "PRO":
                                          dataToSendObject.Lfart = "ZPRE"
                                          break;
                                        case "REG":
                                          dataToSendObject.Lfart = "ZREE"
                                          break;
                                        case "BUY":
                                          dataToSendObject.Lfart = "ZBUE"
                                          break;
                                        case "BUY US":
                                          dataToSendObject.Lfart = "ZBUE"
                                          break;
                                        case "TRU":
                                          dataToSendObject.Lfart = "ZTRE"
                                          break;
                                        case "ESS US":
                                          dataToSendObject.Lfart = "ZESE"
                                          break;
                                        case "BES":
                                          dataToSendObject.Lfart = "ZBEE"
                                          break;
                                        case "":
                                          dataToSendObject.Lfart = "ZHOD"
                                          break;
                                      }
                                }
                                // Set the delivery type for the material document to "LB" (which typically indicates a delivery type for goods movements)
                                //dataToSendObject.Lfart = "LB"
                                // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock
                                dataToSendObject.Customer = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Customer
                                dataToSendObject.Supplier = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Supplier
                            } else {
                                if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                                    dataToSendObject.Bwart = "313"
                                } else {
                                    // pulsante Factory
                                    dataToSendObject.Bwart = "311"
                                }
                                // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock
                                let parentStockSegment = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].ParentStockSegment
                                if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                                    if(parentStockSegment === "" || parentStockSegment === null || parentStockSegment === undefined){
                                        dataToSendObject.Lfart = "ZHOD"
                                    } else {                
                                        switch (parentStockSegment) {
                                            case "CAM":
                                            dataToSendObject.Lfart = "ZCAM"
                                            break;
                                            case "ESS":
                                            dataToSendObject.Lfart = "ZESS"
                                            break;
                                            case "MTO":
                                            dataToSendObject.Lfart = "ZMTO"
                                            break;
                                            case "PRO":
                                            dataToSendObject.Lfart = "ZPRO"
                                            break;
                                            case "REG":
                                            dataToSendObject.Lfart = "ZREG"
                                            break;
                                            case "BUY":
                                            dataToSendObject.Lfart = "ZBUY"
                                            break;
                                            case "BUY US":
                                            dataToSendObject.Lfart = "ZBUE"
                                            break;
                                            case "TRU":
                                            dataToSendObject.Lfart = "ZTRE"
                                            break;
                                            case "ESS US":
                                            dataToSendObject.Lfart = "ZESE"
                                            break;
                                            case "BES":
                                            dataToSendObject.Lfart = "ZBEE"
                                            break;
                                            case "":
                                            dataToSendObject.Lfart = "ZHOD"
                                            break;
                                        }
                                    }
                                } else {
                                    // modifica DL - 24/07/2025 - valorizzo lfart
                                    if(parentStockSegment === "" || parentStockSegment === null || parentStockSegment === undefined){
                                        dataToSendObject.Lfart = "ZTRK"
                                    } else {                                    
                                        switch (parentStockSegment) {
                                            case "CAM":
                                            dataToSendObject.Lfart = "ZCAF"
                                            break;
                                            case "ESS":
                                            dataToSendObject.Lfart = "ZESF"
                                            break;
                                            case "MTO":
                                            dataToSendObject.Lfart = "ZMTF"
                                            break;
                                            case "PRO":
                                            dataToSendObject.Lfart = "ZPRF"
                                            break;
                                            case "REG":
                                            dataToSendObject.Lfart = "ZREF"
                                            break;
                                            case "BUY":
                                            dataToSendObject.Lfart = "ZBUF"
                                            break;
                                            case "BUY US":
                                            dataToSendObject.Lfart = "ZBUF"
                                            break;
                                            case "TRU":
                                            dataToSendObject.Lfart = "ZTRF"
                                            break;
                                            case "ESS US":
                                            dataToSendObject.Lfart = "ZESF"
                                            break;
                                            case "BES":
                                            dataToSendObject.Lfart = "ZBEF"
                                            break;
                                            case "":
                                            dataToSendObject.Lfart = "ZTRK"
                                            break;
                                        }
                                    }                                    
                                // modifica DL - 24/07/2025 - valorizzo lfart - FINE
                                }
                                //dataToSendObject.Lfart = "ZHOD"
                                // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock                                
                            }
                            dataToSendObject.Wadak = this.byId("WadakID").getValue()
                            dataToSendObject.StorageLocation = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].StorageLocation
                            if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyProdStorage !== null && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyProdStorage !== undefined){
                            // and is not undefined (using the variable 'u' to represent undefined).
                                dataToSendObject.AvaibilityQtyProdStorage = (this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyProdStorage).toString()
                            }
                            if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyDefaultStorage !== undefined && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyDefaultStorage !== null){
                                dataToSendObject.AvaibilityQtyDefaultStorage = (this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyDefaultStorage).toString()
                            }
                            dataToSendObject.Kdmat = dataToSendObject.CprodOrd
                            // modifica DL - 03/06/2025 - aggiungo campi segmentation
                            dataToSendObject.SgtScat = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].StockSegment
                            dataToSendObject.SgtRcaT = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].RequirementSegment
                            // modifica DL - 03/06/2025 - aggiungo campi segmentation - FINE
                            // modifica DL - 29/07/2025 aggiungo tipo bottone selezionato    
                            dataToSendObject.ButtonType = this.byId("ManualAccountingDialog").data("buttonPressed")
                            // modifica DL - 29/07/2025 aggiungo tipo bottone selezionato - FINE 
                            dataToSend.push(dataToSendObject)
                            // modifica DL - 28/05/2025 - se quantità da sperdire supera disponibilità, allora appendo nuovo record
                            if(Number(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue) > Number(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssueOriginal)){
                                dataToSendObject = {}
                                dataToSendObject.Kdmat = ""
                                // modifica DL - 03/06/2025 - aggiungo campi segmentation
                                dataToSendObject.SgtScat = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].StockSegment
                                dataToSendObject.SgtRcaT = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].RequirementSegment
                                // modifica DL - 03/06/2025 - aggiungo campi segmentation - FINE
                                dataToSendObject.Material = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Material
                                dataToSendObject.Batch = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Batch
                                dataToSendObject.Stock = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].StockMaterial
                                dataToSendObject.Quantity = (this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssue - this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssueOriginal).toString()
                                // modifica DL - 10/06/2025 - problema decimali
                                if((dataToSendObject.Quantity).indexOf(",") > -1){
                                    dataToSendObject.Quantity = dataToSendObject.Quantity.replace(",",".")
                                }
                                // modifica DL - 10/06/2025 - problema decimali - FINE
                                dataToSendObject.CprodOrd = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].CprodOrd
                                dataToSendObject.CprodOrd = oController.zeroPad(dataToSendObject.CprodOrd, 12)
                                dataToSendObject.UnitMeasure = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].EntryUnit
                                dataToSendObject.Plant = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Plant
                                dataToSendObject.WorkCenterInternalID = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].WorkCenterInternalID
                                if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                                    dataToSendObject.Lgort = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Lgort1
                                } else {
                                    dataToSendObject.Lgort = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Lgort2
                                }                    
                                dataToSendObject.Vstel = this.byId("shippingPointID").getValue()
                                dataToSendObject.Supplier = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Supplier
                                if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].requirementtype === "BB"){
                                    dataToSendObject.Bwart = "541"
                                     // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock
                                     let parentStockSegment = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].ParentStockSegment
                                     if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                                        if(parentStockSegment === "" || parentStockSegment === null || parentStockSegment === undefined){
                                            dataToSendObject.Lfart = "ZHOD"
                                        } else {                                        
                                            switch (parentStockSegment) {
                                                case "CAM":
                                                    dataToSendObject.Lfart = "ZCAE"
                                                    break;
                                                case "ESS":
                                                    dataToSendObject.Lfart = "ZESE"
                                                    break;
                                                case "MTO":
                                                    dataToSendObject.Lfart = "ZMTE"
                                                    break;
                                                case "PRO":
                                                    dataToSendObject.Lfart = "ZPRE"
                                                    break;
                                                case "REG":
                                                    dataToSendObject.Lfart = "ZREE"
                                                    break;
                                                case "BUY":
                                                    dataToSendObject.Lfart = "ZBUY"
                                                    break;
                                                case "BUY US":
                                                    dataToSendObject.Lfart = "ZBUY"
                                                    break;
                                                case "TRU":
                                                    dataToSendObject.Lfart = "ZTRU"
                                                    break;
                                                case "ESS US":
                                                    dataToSendObject.Lfart = "ZESS"
                                                    break;
                                                case "BES":
                                                    dataToSendObject.Lfart = "ZBES"
                                                    break;
                                                case "":
                                                    dataToSendObject.Lfart = "ZHOD"
                                                    break;
                                            }
                                        }
                                     } else {
                                    // modifica DL - 24/07/2025 - valorizzo lfart
                                        if(parentStockSegment === "" || parentStockSegment === null || parentStockSegment === undefined){
                                            dataToSendObject.Lfart = "DTR"
                                        } else {                                    
                                            switch (parentStockSegment) {
                                                case "CAM":
                                                dataToSendObject.Lfart = "ZCAF"
                                                break;
                                                case "ESS":
                                                dataToSendObject.Lfart = "ZESF"
                                                break;
                                                case "MTO":
                                                dataToSendObject.Lfart = "ZMTF"
                                                break;
                                                case "PRO":
                                                dataToSendObject.Lfart = "ZPRF"
                                                break;
                                                case "REG":
                                                dataToSendObject.Lfart = "ZREF"
                                                break;
                                                case "BUY":
                                                dataToSendObject.Lfart = "ZBUF"
                                                break;
                                                case "BUY US":
                                                dataToSendObject.Lfart = "ZBUF"
                                                break;
                                                case "TRU":
                                                dataToSendObject.Lfart = "ZTRF"
                                                break;
                                                case "ESS US":
                                                dataToSendObject.Lfart = "ZESF"
                                                break;
                                                case "BES":
                                                dataToSendObject.Lfart = "ZBEF"
                                                break;
                                                case "":
                                                dataToSendObject.Lfart = "DTR"
                                                break;
                                            }
                                        }                                    
                                    // modifica DL - 24/07/2025 - valorizzo lfart - FINE
                                    }
                                    // Set the delivery type for the material document to "LB" (which typically indicates a delivery type for goods movements)
                                    //dataToSendObject.Lfart = "LB"
                                    // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock
                                    dataToSendObject.Customer = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Customer
                                    dataToSendObject.Supplier = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].Supplier
                                } else {
                                    if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                                        dataToSendObject.Bwart = "313"
                                    } else {
                                        // pulsante Factory
                                        dataToSendObject.Bwart = "311"
                                    }
                                    // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock
                                    let parentStockSegment = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].ParentStockSegment
                                    if(this.byId("ManualAccountingDialog").data("buttonPressed") === "HUB"){
                                        if(parentStockSegment === "" || parentStockSegment === null || parentStockSegment === undefined){
                                            dataToSendObject.Lfart = "ZHOD"
                                        } else {
                                            switch (parentStockSegment) {
                                                case "CAM":
                                                    dataToSendObject.Lfart = "ZCAM"
                                                    break;
                                                case "ESS":
                                                    dataToSendObject.Lfart = "ZESS"
                                                    break;
                                                case "MTO":
                                                    dataToSendObject.Lfart = "ZMTO"
                                                    break;
                                                case "PRO":
                                                    dataToSendObject.Lfart = "ZPRO"
                                                    break;
                                                case "REG":
                                                    dataToSendObject.Lfart = "ZREG"
                                                    break;
                                                case "BUY":
                                                    dataToSendObject.Lfart = "ZBUY"
                                                    break;
                                                case "BUY US":
                                                    dataToSendObject.Lfart = "ZBUY"
                                                    break;
                                                case "TRU":
                                                    dataToSendObject.Lfart = "ZTRU"
                                                    break;
                                                case "ESS US":
                                                    dataToSendObject.Lfart = "ZESS"
                                                    break;
                                                case "BES":
                                                    dataToSendObject.Lfart = "ZBES"
                                                    break;
                                                case "":
                                                    dataToSendObject.Lfart = "ZHOD"
                                                    break;
                                            }
                                        }
                                    } else {
                                        // modifica DL - 24/07/2025 - valorizzo lfart
                                        if(parentStockSegment === "" || parentStockSegment === null || parentStockSegment === undefined){
                                            dataToSendObject.Lfart = "DTR"
                                        } else {                                    
                                            switch (parentStockSegment) {
                                                case "CAM":
                                                dataToSendObject.Lfart = "ZCAF"
                                                break;
                                                case "ESS":
                                                dataToSendObject.Lfart = "ZESF"
                                                break;
                                                case "MTO":
                                                dataToSendObject.Lfart = "ZMTF"
                                                break;
                                                case "PRO":
                                                dataToSendObject.Lfart = "ZPRF"
                                                break;
                                                case "REG":
                                                dataToSendObject.Lfart = "ZREF"
                                                break;
                                                case "BUY":
                                                dataToSendObject.Lfart = "ZBUF"
                                                break;
                                                case "BUY US":
                                                dataToSendObject.Lfart = "ZBUF"
                                                break;
                                                case "TRU":
                                                dataToSendObject.Lfart = "ZTRF"
                                                break;
                                                case "ESS US":
                                                dataToSendObject.Lfart = "ZESF"
                                                break;
                                                case "BES":
                                                dataToSendObject.Lfart = "ZBEF"
                                                break;
                                                case "":
                                                dataToSendObject.Lfart = "DTR"
                                                break;
                                            }
                                        }                                    
                                    // modifica DL - 24/07/2025 - valorizzo lfart - FINE
                                    }
                                    //dataToSendObject.Lfart = "ZHOD"
                                    // modifica DL - 16/06/2025 - cambio LFART in base al segment Stock 
                                }
                                dataToSendObject.Wadak = this.byId("WadakID").getValue()
                                dataToSendObject.StorageLocation = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].StorageLocation
                                if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyProdStorage !== null && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyProdStorage !== undefined){
                                    dataToSendObject.AvaibilityQtyProdStorage = (this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyProdStorage).toString()
                                }
                                if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyDefaultStorage !== undefined && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyDefaultStorage !== null){
                                    dataToSendObject.AvaibilityQtyDefaultStorage = (this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].AvaibilityQtyDefaultStorage).toString()
                                }
                                // aggiorno quantità precedente
                                var lengthDataToSend = dataToSend.length
                                if(this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssueOriginal !== undefined && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssueOriginal !== null && this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssueOriginal !== ""){
                                    dataToSend[lengthDataToSend-1].Quantity = this.byId("selectedMaterialTableId").getModel().getData().SelectedMaterial[i].QtyToIssueOriginal
                                    // modifica DL - 10/06/2025 - problema decimali
                                    if((dataToSend[lengthDataToSend-1].Quantity).indexOf(",") > -1){
                                        dataToSend[lengthDataToSend-1].Quantity = (dataToSend[lengthDataToSend-1].Quantity).replace(",",".")
                                    }
                                    // modifica DL - 10/06/2025 - problema decimali - FINE
                                } else {
                                    dataToSend[lengthDataToSend-1].Quantity = "0"
                                }   
                                // modifica DL - 10/06/2025 - richiesta di Caterina
                                if(Number(dataToSend[lengthDataToSend-1].Quantity) === 0){
                                    dataToSend.splice(lengthDataToSend-1, 1)
                                }
                                // modifica DL - 10/06/2025 - richiesta di Caterina - FINE            
                                // modifica DL - 29/07/2025 aggiungo tipo bottone selezionato    
                                dataToSendObject.ButtonType = this.byId("ManualAccountingDialog").data("buttonPressed")
                                // modifica DL - 29/07/2025 aggiungo tipo bottone selezionato - FINE                                             
                                dataToSend.push(dataToSendObject)                                
                            }
                            // modifica DL - 28/05/2025 - se quantità da sperdire supera disponibilità, allora appendo nuovo record - FINE
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

                    // chiamata API di creazione documento materiale
                    const oModel3 = oController.getView().getModel();
                    var oBindingContext2 = oModel3.bindContext("/CreateMaterialDocument(...)");

                    await oBindingContext2.setParameter("Record", 
                        arrayToCreateMaterialDocument
                    );

                    if(arrayToCreateMaterialDocument.length > 0){
                        oBindingContext2.execute().then((oResult) => {
                            oBusyDialog.close();
                            // TODO - gestione errore
                            //alert("Material Document Created!")
                            oController.openDialogMessageText("", "I");
                            oController.byId("TableOrderId").getModel().refresh()
                            
                        }).catch((oError) => {
                            oBusyDialog.close();
                            // TODO - gestione errore
                            oController.openDialogMessageText(oError.error.message, "E");
                            return
                        });
                    } else {
                        if(found543){ 
                            //MessageToast.show(oController.getResourceBundle().getText("noDataToSendforMaterialDocument"))
                            oController.openDialogMessageText(oController.getResourceBundle().getText("noDataToSendforMaterialDocument"), "E");
                            oBusyDialog.close();
                        }
                    }

                    // modifica DL - 12/05/2025 - aggiungo controllo su Stock > 0, altrimenti non creiamo delivery
                    var noDeliveryCreation = false
                    if(this.byId("ManualAccountingDialog").data("buttonPressed") === "factory"){
                        for(var s=0; s<dataToSend.length; s++){
                            if(Number(dataToSend[s].AvaibilityQtyProdStorage) === 0){
                                noDeliveryCreation = true
                                break
                            }
                        }
                    } else {
                        for(var s=0; s<dataToSend.length; s++){
                            if(Number(dataToSend[s].AvaibilityQtyDefaultStorage) === 0){
                                noDeliveryCreation = true
                                break
                            }
                        }
                    }
                    // modifica DL - 12/05/2025 - aggiungo controllo su Stock > 0, altrimenti non creiamo delivery - FINE

                    const oModel = oController.getView().getModel();
                    var oBindingContext3 = oModel.bindContext("/CreateDelivery(...)");

                    oBindingContext3.setParameter("Record", 
                        dataToSend
                    );

                    if(dataToSend.length > 0 && !noDeliveryCreation){
                        if(!noDeliveryCreation){
                            oBindingContext3.execute().then((oResult) => {
                                var oContext = oBindingContext3.getBoundContext(); 
                                var vbeln;                                
                                oBusyDialog.close();
                                if(oContext.getObject().value.DeliveryItems !== undefined){
                                    if(oContext.getObject().value.DeliveryItems[0].FlErr){
                                        // modifica DL - 26/05/2025 - espongo delivery
                                        if(oContext.getObject().value.DeliveryItems[oContext.getObject().value.DeliveryItems.length-1].vbeln !== ""){
                                            vbeln = oContext.getObject().value.DeliveryItems[oContext.getObject().value.DeliveryItems.length-1].vbeln
                                            oController.openDialogMessageText(oController.getResourceBundle().getText("delivery") + " " + vbeln + " " + oController.getResourceBundle().getText("created"), "I");
                                            oController.byId("TableOrderId").getModel().refresh()
                                        } else {
                                            oController.openDialogMessageText(oContext.getObject().value.DeliveryItems[0].LogMess, "E");
                                        }
                                    } else {
                                        if(oContext.getObject().value.DeliveryItems[oContext.getObject().value.DeliveryItems.length-1].vbeln !== ""){
                                            vbeln = oContext.getObject().value.DeliveryItems[oContext.getObject().value.DeliveryItems.length-1].vbeln
                                            oController.openDialogMessageText(oController.getResourceBundle().getText("delivery") + " " + vbeln + " " + oController.getResourceBundle().getText("created"), "I");
                                        } else {
                                            oController.openDialogMessageText("", "I");
                                        }
                                        oController.byId("TableOrderId").getModel().refresh()
                                    }
                                } else {
                                    // modifica DL - 18/06/2025 - gestione messaggi creazione multipla
                                    if(oContext.getObject().value.indexOf(";") > -1){
                                        var messageArray = oContext.getObject().value.split(";")
                                        var message = ""
                                        for(var p=0; p<messageArray.length; p++){
                                            if(messageArray[p] !== ""){
                                                if(messageArray[p].indexOf("Errore") > -1){
                                                    oController.openDialogMessageText(messageArray[p], "E");
                                                } else {
                                                    if(message === ""){
                                                        message = messageArray[p]
                                                    } else {
                                                        message = message + ", " +messageArray[p]
                                                    }                                                    
                                                }
                                            }
                                        }
                                        oController.openDialogMessageText(oController.getResourceBundle().getText("delivery") + " " + message + " " + oController.getResourceBundle().getText("created"), "I");
                                    } else {
                                        oController.openDialogMessageText(oContext.getObject().value, "E");
                                    }
                                    oController.byId("TableOrderId").getModel().refresh()
                                }
                            }).catch((oError) => {
                                oBusyDialog.close();
                                if(oError.error !== undefined && oError.error !== null){
                                    oController.openDialogMessageText(oError.error.message, "E");
                                } else {
                                    oController.openDialogMessageText(oError, "E");
                                }
                            });
                        } else {
                           oController.openDialogMessageText(oController.getResourceBundle().getText("noStockNoDelivery"), "E"); 
                           oBusyDialog.close();
                        }
                    } else {
                        //MessageToast.show(oController.getResourceBundle().getText("noDataToSend"))
                        oController.openDialogMessageText(oController.getResourceBundle().getText("noDataToSend"), "E");
                        oBusyDialog.close();
                    }

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
