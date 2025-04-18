const { default: cds } = require("@sap/cds");

const serverUrl = "https://lpappsvi.lp.corp:8001/sap/opu/odata/sap/";
const BasicAuth = "Basic " + Buffer.from("LILLAD:LoroPiana2025!").toString("base64"); // Encode the client ID and secret as base64
const axios = require("axios");
const https = require('https');
const SubcontractingManageRequire = require('./custom_modules/SubcontractingManage');
const { equal } = require("assert");
const { json } = require("stream/consumers");

module.exports = cds.service.impl(async function (srv) {

    const SubcontractingManage = new SubcontractingManageRequire.SubcontractingManage()

    //const cdsView = await cds.connect.to('MM_PUR_SUBCONTRACTING_COCKPIT_SRV');
    //const cdsView = await cds.connect.to('ZZ1_I_UNION_CDS');
    const cdsView = await cds.connect.to('ZZ1_I_COMBORDER_COMP_CDS');
    const apiStock = await cds.connect.to('API_MATERIAL_STOCK_SRV');
    const cdsMaterialQtyDbdsSum = await cds.connect.to('ZZ1_I_ARUN_BDBSSUMQTY_CDS_CDS');
    const apiMaterialDocumentCreate = await cds.connect.to('API_MATERIAL_DOCUMENT_SRV');
    const cdsSumQtyDelivery = await cds.connect.to('ZZ1_I_SUMQTYDELIVERY_T_CDS');
    const createDeliverySD = await cds.connect.to('ZMPF_SD_CREATE_DELIVERY');
    const cdsShippingPoint = await cds.connect.to('ZZ1_I_SHIPPINGPOINT_CDS');

    this.on('READ', "MainCds", async request => {

        console.log("dentro read MainCds");

        console.log("TEST tempi -> Entro nel metodo "+new Date())

        var data = await cdsView.tx(request).run(request.query);

        // elimino record con requirementtype = 'BB' and supplier empty
        for(var g=0; g<data.length; g++){
            if(data[g].requirementtype === 'BB' && data[g].Supplier === ''){
                data.splice(g,1)
            }
        }

        console.log("data length "+data.length)

        if(Object.prototype.toString.call(data) === '[object Array]') {
            
            let dataSingleMaterial = []
            let arrayDataStock = []
            let arrayDataQtyBdbsTotDefAllocQty = []
            let arrayDataQtyBdbs = []
            let arrayDataSumQtyDelivery = []
            let arrayStockOrderNoBatch = {}

            var dataMaterial = []

            // creo array dei materiali
            dataSingleMaterial = data.reduce((unique, o) => {
                if(!unique.some(obj => obj.Material === o.Material)) {
                    unique.push(o);
                }
                return unique;
            },[]);

            for(var e=0; e<dataSingleMaterial.length;e++){
                dataMaterial.push(dataSingleMaterial[e].Material)
            }

            console.log("dataMaterial lunghezza "+dataMaterial.length)

            //console.log("dataSingleMaterial "+JSON.stringify(dataSingleMaterial))
            console.log("dataMaterial "+JSON.stringify(dataMaterial))

            const { A_MaterialStock } = apiStock.entities;
            const { ZZ1_I_ARUN_BDBSSUMQTY_CDS } = cdsMaterialQtyDbdsSum.entities;
            const { ZZ1_I_SUMQTYDELIVERY_T } = cdsSumQtyDelivery.entities;

            console.log("TEST tempi -> inizio select stock API "+new Date())

            try {
                var dataStock = await apiStock.run(SELECT(A_MaterialStock, material => {
                    material.to_MatlStkInAcctMod((to_MatlStkInAcctMod) => {
                        to_MatlStkInAcctMod('*')
                    })
                }).where({ Material: { in: dataMaterial }}));
            } catch (error) {
                console.log(error)
            }

            if(dataStock !== undefined && dataStock !== null){
                if(dataStock.length > 0){
                    for(var c=0; c<dataStock.length;c++){
                        for(var f=0; f<dataStock[c].to_MatlStkInAcctMod.length; f++){
                            arrayDataStock.push(dataStock[c].to_MatlStkInAcctMod[f])
                        }   
                    }
                }

                console.log("Lunghezza arrayDataStock "+arrayDataStock.length)

                console.log("TEST tempi -> fine select stock API "+new Date())
            }

            //console.log("Multiple Stock "+JSON.stringify(dataStock))

            // recupero quantità dal servizio BDBS
            try {
                var dataBDBS = await cdsMaterialQtyDbdsSum.run(SELECT(ZZ1_I_ARUN_BDBSSUMQTY_CDS).where({ Material: { in: dataMaterial }}).limit(100));
            } catch (error) {
                console.log(error)
            } 

            console.log("TEST tempi -> fine prima lettura BDBS "+new Date())

            // aggrego per batch
            if(dataBDBS !== null && dataBDBS !== undefined){
                if(dataBDBS.length > 0){
                    var dataBDBSByBatch = dataBDBS.reduce((acc, { Batch, TotalAllocQty, StorageLocation }) => {
                        acc[Batch] = acc[Batch] || { Batch, TotalAllocQty: 0, StorageLocation };
                        acc[Batch].TotalAllocQty += Number(TotalAllocQty);
                        return acc;  
                    }, {});
                }

                // creo array per batch + record con batch vuoto e sommma delle quantità
                if(dataBDBS.length > 0){
                    var sum = 0
                    var object = {}
                    for(var j=0; j<dataBDBS.length; j++){
                        var objectBatch = {}
                        var objectdataBDBS = {}
                        objectdataBDBS = arrayDataQtyBdbs.find((o) => o.Batch === dataBDBS[j].Batch);
                        if(dataBDBSByBatch[dataBDBS[j].Batch] !== undefined && objectdataBDBS === undefined){
                            objectBatch.Batch = dataBDBS[j].Batch
                            objectBatch.Material = dataBDBS[j].Material
                            objectBatch.TotalAllocQty = dataBDBSByBatch[dataBDBS[j].Batch].TotalAllocQty
                            objectBatch.StorageLocation = dataBDBSByBatch[dataBDBS[j].Batch].StorageLocation
                            arrayDataQtyBdbs.push(objectBatch)
                        }

                        sum = Number(sum) + Number(dataBDBS[j].TotalAllocQty)
                    }
                    object.Batch = ""
                    object.Material = dataBDBS[0].Material
                    object.TotalAllocQty = sum.toFixed(3)
                    arrayDataQtyBdbs.push(object)
                }
            }

            console.log("arrayDataQtyBdbs lunghezza "+arrayDataQtyBdbs.length)

            try {
                var dataSumQtyDelivery = await cdsSumQtyDelivery.run(SELECT(ZZ1_I_SUMQTYDELIVERY_T).where({ Material: { in: dataMaterial }}).limit(100));
            } catch (error) {
                console.log(error)
            } 

            console.log("TEST tempi -> fine prima lettura SUMQTYDELIVERY "+new Date())

            // aggrego per batch
            if(dataSumQtyDelivery !== null && dataSumQtyDelivery !== undefined){
                if(dataSumQtyDelivery.length > 0){
                    var dataSumQtyDeliveryByBatch = dataSumQtyDelivery.reduce((acc, { Batch, TotDeliveryQty, StorLoc }) => {
                        acc[Batch] = acc[Batch] || { Batch, TotDeliveryQty: 0, StorLoc };
                        acc[Batch].TotDeliveryQty += Number(TotDeliveryQty);
                        return acc;  
                    }, {});
                }

                // creo array per batch + record con batch vuoto e sommma delle quantità
                if(dataSumQtyDelivery.length > 0){
                    sum = 0
                    object = {}
                    for(var s=0; s<dataSumQtyDelivery.length; s++){
                        var objectSumQtyDelivery = {}
                        var objectdataSumQtyDelivery = {}
                        objectdataSumQtyDelivery = arrayDataSumQtyDelivery.find((o) => o.Batch === dataSumQtyDelivery[s].Batch);
                        if(dataSumQtyDeliveryByBatch[dataSumQtyDelivery[s].Batch] !== undefined && objectdataSumQtyDelivery === undefined){
                            objectSumQtyDelivery.Batch = dataSumQtyDelivery[s].Batch
                            objectSumQtyDelivery.Material = dataSumQtyDelivery[s].Material
                            objectSumQtyDelivery.TotDeliveryQty = dataSumQtyDeliveryByBatch[dataSumQtyDelivery[s].Batch].TotDeliveryQty
                            objectSumQtyDelivery.StorageLocation = dataSumQtyDeliveryByBatch[dataSumQtyDelivery[s].Batch].StorLoc
                            arrayDataSumQtyDelivery.push(objectSumQtyDelivery)
                        }

                        sum = Number(sum) + Number(dataSumQtyDelivery[s].TotDeliveryQty)
                    }
                    object.Batch = ""
                    object.Material = dataSumQtyDelivery[0].Material
                    object.TotDeliveryQty = sum.toFixed(3)
                    arrayDataSumQtyDelivery.push(object)
                }
            }

            //console.log("arrayDataQtyBdbsTotDefAllocQty "+JSON.stringify(arrayDataQtyBdbs))
            //console.log("arrayDataQtyBdbsTotDefAllocQty length "+arrayDataQtyBdbs.length)

            console.log("Lunghezza arrayDataStock "+arrayDataStock.length)

            console.log("TEST tempi -> inizio a calcolare colonne "+new Date())
            
            // integro dati dello stock nell'array principale
            var objectDataQtyBdbs = {}
            var objectDataQtyBdbsLgort1 = {}
            var objectDataQtyBdbsLgort2 = {}
            var objectDataQtyStock = {}
            var objectDataQtyStockAvaibility = {}
            var objectDataQtyStockAvaibilityLgort2 = {}
            var objectDataQtyStockAvaibilityStockO = {}
            var objectDataSumQtyDeliveryLgort1 = {}
            var objectDataSumQtyDeliveryLgort2 = {}
            var arrayStockOrderWithoutBatch = []
            var arrayStockOrderWithoutBatchAvaibility = []
            var arrayStockOrderWithoutBatchAvaibilityLgort2 = []
            var arrayStockOrderWithoutBatchAvaibilityStockO = []
            var sumStock = 0
            var sumStockAvaibility = 0
            var sumStockAvaibilityLgort2 = 0
            var sumStockAvaibilityStockO = 0
            for(var z = 0; z < data.length; z++){
                objectDataQtyBdbs = {}
                objectDataQtyBdbsLgort1 = {}
                objectDataQtyBdbsLgort2 = {}
                objectDataSumQtyDeliveryLgort1 = {}
                objectDataSumQtyDeliveryLgort2 = {}
                objectDataQtyStock = {}
                arrayStockOrderWithoutBatch = []
                sumStock = 0
                sumStockAvaibility = 0
                sumStockAvaibilityLgort2 = 0
                sumStockAvaibilityStockO = 0
                if(data[z].Batch !== ''){
                    objectDataQtyBdbs = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch);
                    objectDataQtyBdbsLgort1 = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort1);
                    objectDataQtyBdbsLgort2 = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort2);
                    objectDataSumQtyDeliveryLgort1 = arrayDataSumQtyDelivery.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort1);
                    objectDataSumQtyDeliveryLgort2 = arrayDataSumQtyDelivery.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort2);
                    objectDataQtyStock = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch);
                    objectDataQtyStockAvaibility = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.StorageLocation === data[z].Lgort1);
                    objectDataQtyStockAvaibilityLgort2  = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.StorageLocation === data[z].Lgort2);
                    objectDataQtyStockAvaibilityStockO  = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant && o.Supplier === data[z].Supplier && o.InventorySpecialStockType === 'O');
                    if(objectDataQtyBdbs !== undefined && objectDataQtyStockAvaibility !== undefined){
                        if(objectDataQtyStock !== null && objectDataQtyStock !== undefined){
                            data[z].StockMaterial = Number(objectDataQtyStock.MatlWrhsStkQtyInMatlBaseUnit) - Number(objectDataQtyBdbs.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)
                        }
                        data[z].TotalAllocQtyCustom = Number(objectDataQtyBdbs.TotalAllocQty)
                        if(objectDataQtyBdbs !== undefined && objectDataQtyBdbs !== null){
                            data[z].AvaibilityQtyDefaultStorage = Number(objectDataQtyStockAvaibility.MatlWrhsStkQtyInMatlBaseUnit) - Number(objectDataQtyBdbs.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)                         
                        } else {
                            data[z].AvaibilityQtyDefaultStorage = Number(objectDataQtyStockAvaibility.MatlWrhsStkQtyInMatlBaseUnit) + Number(data[z].TotalDefaultAllocQty)                         
                        }
                    } else {
                        if(objectDataQtyStock !== null && objectDataQtyStock !== undefined){
                            data[z].StockMaterial = Number(objectDataQtyStock.MatlWrhsStkQtyInMatlBaseUnit) + Number(data[z].TotalDefaultAllocQty)
                        }
                    }                    
                    if(data[z].requirementtype === 'AR'){
                        if(objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined){
                            data[z].AvaibilityQtyProdStorage = Number(objectDataQtyStockAvaibilityLgort2.MatlWrhsStkQtyInMatlBaseUnit) - Number(objectDataQtyBdbsLgort2.TotalAllocQty) + Number(data[z].TotalProdAllocQty) 
                            data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                        } else {
                            if(objectDataQtyStockAvaibilityLgort2 !== null && objectDataQtyStockAvaibilityLgort2 !== undefined){
                                data[z].AvaibilityQtyProdStorage = Number(objectDataQtyStockAvaibilityLgort2.MatlWrhsStkQtyInMatlBaseUnit) + Number(data[z].TotalProdAllocQty) 
                                data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                            } else {
                                data[z].AvaibilityQtyProdStorage = Number(data[z].TotalProdAllocQty) 
                                data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                            }
                        }
                    } else {
                        // BB
                        if(objectDataQtyStockAvaibilityStockO !== null && objectDataQtyStockAvaibilityStockO !== undefined){
                            data[z].AvaibilityQtyProdStorage = Number(objectDataQtyStockAvaibilityStockO.MatlWrhsStkQtyInMatlBaseUnit)
                            data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                        }
                    }
                    if(data[z].AvaibilityQtyProdStorage === "" || data[z].AvaibilityQtyProdStorage === null || data[z].AvaibilityQtyProdStorage === undefined){
                        data[z].AvaibilityQtyProdStorage = 0
                    }
                                        
                    if(objectDataSumQtyDeliveryLgort1 !== null && objectDataSumQtyDeliveryLgort1 !== undefined){
                        data[z].IssuedDefQty = Number(objectDataSumQtyDeliveryLgort1.TotDeliveryQty)
                    } else {
                        data[z].IssuedDefQty = 0
                    }
                    if(objectDataSumQtyDeliveryLgort2 !== null && objectDataSumQtyDeliveryLgort2 !== undefined){
                        data[z].IssuedProdQty = Number(objectDataSumQtyDeliveryLgort2.TotDeliveryQty)
                    } else {
                        data[z].IssuedProdQty = 0
                    }
                    if(objectDataQtyBdbsLgort1 !== null && objectDataQtyBdbsLgort1 !== undefined){
                        data[z].TotMagDefault = Number(objectDataQtyBdbsLgort1.TotalAllocQty)
                    } else {
                        data[z].TotMagDefault = 0
                    }
                    if(objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined){
                        data[z].TotMagProd = Number(objectDataQtyBdbsLgort2.TotalAllocQty)
                    } else {
                        data[z].TotMagProd = 0
                    }
                    data[z].StockMaterialUnitMeasure = data[z].BaseUnit  
                } else {
                    objectDataQtyBdbs = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.Batch === '');
                    objectDataQtyBdbsLgort1 = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.StorageLocation === data[z].Lgort1);
                    objectDataQtyBdbsLgort2 = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.StorageLocation === data[z].Lgort2);
                    objectDataSumQtyDeliveryLgort1 = arrayDataSumQtyDelivery.find((o) => o.Material === data[z].Material && o.StorageLocation === data[z].Lgort1);
                    objectDataSumQtyDeliveryLgort2 = arrayDataSumQtyDelivery.find((o) => o.Material === data[z].Material && o.StorageLocation === data[z].Lgort2);
                    arrayStockOrderWithoutBatch = arrayDataStock.filter(obj => obj.Material === data[z].Material)
                    arrayStockOrderWithoutBatchAvaibility = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.StorageLocation === data[z].Lgort1)
                    arrayStockOrderWithoutBatchAvaibilityLgort2 = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.StorageLocation === data[z].Lgort2)
                    arrayStockOrderWithoutBatchAvaibilityStockO  = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.Supplier === data[z].Supplier && obj.InventorySpecialStockType === 'O');
                    if(arrayStockOrderWithoutBatch.length > 0){
                        for(var t=0; t<arrayStockOrderWithoutBatch.length; t++){
                            sumStock = Number(sumStock) + Number(arrayStockOrderWithoutBatch[t].MatlWrhsStkQtyInMatlBaseUnit)
                        }
                        for(var x=0; x<arrayStockOrderWithoutBatchAvaibility.length; x++){
                            sumStockAvaibility = Number(sumStockAvaibility) + Number(arrayStockOrderWithoutBatchAvaibility[x].MatlWrhsStkQtyInMatlBaseUnit)
                        }
                        for(var q=0; q<arrayStockOrderWithoutBatchAvaibilityLgort2.length; q++){
                            sumStockAvaibilityLgort2 = Number(sumStockAvaibilityLgort2) + Number(arrayStockOrderWithoutBatchAvaibilityLgort2[q].MatlWrhsStkQtyInMatlBaseUnit)
                        }
                        for(var v=0; v<arrayStockOrderWithoutBatchAvaibilityStockO.length; v++){
                            sumStockAvaibilityStockO = Number(sumStockAvaibilityStockO) + Number(arrayStockOrderWithoutBatchAvaibilityStockO[v].MatlWrhsStkQtyInMatlBaseUnit)
                        }
                        if(objectDataQtyBdbs !== undefined && objectDataQtyBdbs !== null && objectDataQtyBdbs !== ""){
                            data[z].StockMaterial =  Number(sumStock) - Number(objectDataQtyBdbs.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)
                            data[z].TotalAllocQtyCustom = Number(objectDataQtyBdbs.TotalAllocQty)
                            data[z].AvaibilityQtyDefaultStorage = Number(sumStockAvaibility) - Number(objectDataQtyBdbs.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)                            
                        } else {
                            data[z].StockMaterial =  Number(sumStock) + Number(data[z].TotalDefaultAllocQty)
                            data[z].TotalAllocQtyCustom = 0
                            data[z].AvaibilityQtyDefaultStorage = Number(sumStockAvaibility) + Number(data[z].TotalDefaultAllocQty) 
                        }                             
                        if(data[z].requirementtype === 'AR'){
                            if(objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined){
                                data[z].AvaibilityQtyProdStorage = Number(sumStockAvaibilityLgort2) - Number(objectDataQtyBdbsLgort2.TotalAllocQty) + Number(data[z].TotalProdAllocQty)                  
                                data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                            } else {
                                data[z].AvaibilityQtyProdStorage = Number(sumStockAvaibilityLgort2) + Number(data[z].TotalProdAllocQty)                  
                                data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                            }
                        } else {
                            data[z].AvaibilityQtyProdStorage = Number(sumStockAvaibilityStockO)
                            data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                        }
                        if(data[z].AvaibilityQtyProdStorage === "" || data[z].AvaibilityQtyProdStorage === null || data[z].AvaibilityQtyProdStorage === undefined){
                            data[z].AvaibilityQtyProdStorage = 0
                        }
                        
                        if(objectDataSumQtyDeliveryLgort1 !== null && objectDataSumQtyDeliveryLgort1 !== undefined){
                            data[z].IssuedDefQty = Number(objectDataSumQtyDeliveryLgort1.TotDeliveryQty)
                        } else {
                            data[z].IssuedDefQty = 0 
                        }
                        if(objectDataSumQtyDeliveryLgort2 !== null && objectDataSumQtyDeliveryLgort2 !== undefined){
                            data[z].IssuedProdQty = Number(objectDataSumQtyDeliveryLgort2.TotDeliveryQty)
                        } else {
                            data[z].IssuedProdQty = 0
                        }
                        if(objectDataQtyBdbsLgort1 !== null && objectDataQtyBdbsLgort1 !== undefined){
                            data[z].TotMagDefault = Number(objectDataQtyBdbsLgort1.TotalAllocQty)
                        } else {
                            data[z].TotMagDefault = 0
                        }
                        if(objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined){
                            data[z].TotMagProd = Number(objectDataQtyBdbsLgort2.TotalAllocQty)
                        } else {
                            data[z].TotMagProd = 0
                        }
                        data[z].StockMaterialUnitMeasure = data[z].BaseUnit  
                    }
                }
            }

            console.log("TEST tempi -> fine calcolo colonne "+new Date())

            console.log("TEST tempi -> inizio calcolo semaforo "+new Date())

           for(var u = 0; u < data.length; u++){
                if(Number(data[u].TotalConfdQtyForATPInBaseUoM) === 0){
                    data[u].QtyTrafficLightStatus = 1 //red
                    data[u].QtyTrafficLight = 100
                } else if(Number(data[u].TotalConfdQtyForATPInBaseUoM) !== (Number(data[u].TotalRequiredQuantity) - Number(data[u].TotalWithdrawnQuantity))){
                    data[u].QtyTrafficLightStatus = 2 //orange
                    data[u].QtyTrafficLight = Number(data[u].TotalConfdQtyForATPInBaseUoM) / (Number(data[u].TotalRequiredQuantity) - Number(data[u].TotalWithdrawnQuantity)) * 100
                } else {
                    data[u].QtyTrafficLightStatus = 3  //green
                    data[u].QtyTrafficLight = Number(data[u].TotalConfdQtyForATPInBaseUoM) / (Number(data[u].TotalRequiredQuantity) - Number(data[u].TotalWithdrawnQuantity)) * 100
                }

                data[u].QtyToIssue = Number(data[u].TotalConfdQtyForATPInBaseUoM) - Number(data[u].TotalAllocQty) - Number(data[u].TotalDeliveryQty)
                data[u].QtyToIssue = Number(data[u].QtyToIssue).toFixed(3)
            }
                
            console.log("dati stock "+arrayDataStock.length)

            console.log("TEST tempi -> fine calcolo semaforo "+new Date())
        }

        console.log("dati finali length "+data.length)
        
        return data
    });

   /*this.on("ZZ1_I_ShippingPoint", async (req) => {
        return await cdsShippingPoint.tx(req).run(req.query);
        await cdsView.tx(request).run(request.query);

    });*/
    this.on('READ', "ZZ1_I_ShippingPoint", async request => {
        var data = await cdsShippingPoint.tx(request).run(request.query);

        return data;
    });

    /*this.on("CreateMaterialDocument", async (req) => {
        console.log("Chiamata ACTION CreateMaterialDocument")
 
        const Documents = req.data.Record.Records;

        // Controllo che l'oggetto della request sia pieno
        if (!req.data.Record.Records) return;

        var documentItemArray = []
        var documentItemObject = {}
        for(var i=0; i<Documents.length; i++){
            documentItemObject = {}
            documentItemObject.Material = Documents[i].Material
            documentItemObject.Plant = Documents[i].Plant
            documentItemObject.Batch = Documents[i].Batch
            documentItemObject.StorageLocation = "H1RP" // da SOSTITUIRE
            documentItemObject.GoodsMovementType = '313'
            documentItemObject.MaterialDocumentItemText = Documents[i].CprodOrd
            documentItemObject.QuantityInEntryUnit = Documents[i].Quantity
            documentItemObject.IssuingOrReceivingStorageLoc = "K1RP" // da SOSTITUIRE
            documentItemObject.EntryUnit = Documents[i].UnitMeasure
            documentItemArray.push(documentItemObject)
        }

        var postingCurrentDate = new Date()
        var year = postingCurrentDate.getFullYear()
        var month = postingCurrentDate.getMonth() + 1
        if(month < 10){
            month = '0' + month.toString()
        }
        var day = postingCurrentDate.getDate()
        var postingDate = year.toString() + '-' + month.toString() + '-' + day.toString()
            
        var payload = {
            "PostingDate": postingDate+"T00:00:00",
            "GoodsMovementCode": "04",
            "ReferenceDocument": Documents[0].CprodOrd,
            "to_MaterialDocumentItem": documentItemArray
        }

        
        

        var payload = {
            "PostingDate": "2025-03-21T00:00:00",
            "GoodsMovementCode": "04",
            "to_MaterialDocumentItem": [
                {
                "Material": "MAI4168H06H",
                "Plant": "PF10",
                "Batch": "0000000962",
                "StorageLocation": "H1RP",
                "GoodsMovementType": "313",
                "MaterialDocumentItemText": "GR Vendor XY", //-> cprodOrd
                "QuantityInEntryUnit": "0.032", //-> TotalConfdQtyForATPInBaseUoM
                "IssuingOrReceivingStorageLoc": "K1RP",
                "EntryUnit": "KG"//StockMaterialUnitMeasure
                }
            ]
        }

        

        try {

            console.log("SUCCESSO!")
            
            return apiMaterialDocumentCreate.tx(req).post("/A_MaterialDocumentHeader", payload)                 

        } catch (error) {

            console.log(error.message)
            return error.message
        }
    })*/

    this.on("CreateMaterialDocument", async (req) => {
        console.log("Chiamata ACTION CreateMaterialDocument")
 
        const Documents = req.data.Record.Records;

        // Controllo che l'oggetto della request sia pieno
        if (!req.data.Record.Records) return;

        var postingCurrentDate = new Date()
        var year = postingCurrentDate.getFullYear()
        var month = postingCurrentDate.getMonth() + 1
        if(month < 10){
            month = '0' + month.toString()
        }
        var day = postingCurrentDate.getDate()
        if(day < 10){
            day = '0' + day.toString()
        }        
        var postingDate = year.toString() + '-' + month.toString() + '-' + day.toString()
        
        // raggruppo risultati per Supplier
        let DocumentsBySupplier = Object.values(Documents.reduce((acc,curr)=> {
            if(!acc[curr.Supplier])acc[curr.Supplier]=[];
            acc[curr.Supplier].push(curr)
            return acc;
        },{}))

        var documentItemArray = []
        var documentItemObject = {}
        var vstel = ""
        for(var y=0; y<DocumentsBySupplier.length; y++){
            documentItemArray = []
            for(var z=0; z<DocumentsBySupplier[y].length; z++){
                vstel = DocumentsBySupplier[0][0].Vstel
                documentItemObject = {}
                documentItemObject.rfbel = "1"
                documentItemObject.rfpos = z.toString()
                documentItemObject.vstel = DocumentsBySupplier[y][z].Vstel
                documentItemObject.vkorg = "ITM1"
                documentItemObject.vtweg = "M1"
                documentItemObject.spart = "01"
                documentItemObject.lfart = DocumentsBySupplier[y][z].Lfart
                documentItemObject.matnr = DocumentsBySupplier[y][z].Material
                documentItemObject.werks = DocumentsBySupplier[y][z].Plant
                documentItemObject.wadat = postingDate
                documentItemObject.lfdat = postingDate
                documentItemObject.lfimg = Number(DocumentsBySupplier[y][z].Quantity)
                documentItemObject.vrkme = DocumentsBySupplier[y][z].UnitMeasure
                documentItemObject.meins = DocumentsBySupplier[y][z].UnitMeasure
                documentItemObject.lgort = DocumentsBySupplier[y][z].Lgort            
                documentItemObject.bwart = DocumentsBySupplier[y][z].Bwart
                documentItemObject.rblvs = DocumentsBySupplier[y][z].Bwart
                if(DocumentsBySupplier[y][z].Bwart === '313' || DocumentsBySupplier[y][z].Bwart === '311'){
                    documentItemObject.shkzg_um = "1"
                    documentItemObject.ummat = DocumentsBySupplier[y][z].Material
                    documentItemObject.umwrk = DocumentsBySupplier[y][z].Plant
                    documentItemObject.umlgo = "K1RP" // da SOSTITUIRE con StorageLocation
                    if(DocumentsBySupplier[y][z].Bwart === '313'){
                        documentItemObject.fobwa = "315"
                    }              
                    documentItemObject.fo_dlvtp = "ID"
                    documentItemObject.kzuml = "X"
                    documentItemObject.dlvtp = "OD"
                    documentItemObject.umcha = DocumentsBySupplier[y][z].Batch
                    documentItemObject.kunwe = DocumentsBySupplier[y][z].Plant
                    documentItemObject.lifnr = DocumentsBySupplier[y][z].Plant
                } else {
                    // 541
                    documentItemObject.kunwe = DocumentsBySupplier[y][z].Customer
                    documentItemObject.lifnr = DocumentsBySupplier[y][z].Supplier
                    
                }
                documentItemObject.lifex = DocumentsBySupplier[y][z].CprodOrd
                documentItemObject.charg = DocumentsBySupplier[y][z].Batch
                documentItemObject.wadat_ist = postingDate
                documentItemArray.push(documentItemObject)
            }

            var payload = {
                "vstel": vstel,
                "DeliveryItems": documentItemArray
            }
    
            try {
                          
                let callCreate = await createDeliverySD.tx(req).post("/CreateDelH", payload)     
                console.log("Risultato chiamata " + JSON.stringify(callCreate))    
    
            } catch (error) {
    
                console.log(error.message)
                //return error.message
            }
        }

        return 

        /*var documentItemArray = []
        var documentItemObject = {}
        var vstel = ""
        for(var i=0; i<Documents.length; i++){
            vstel = Documents[0].Vstel
            documentItemObject = {}
            documentItemObject.rfbel = "1"
            documentItemObject.rfpos = i.toString()
            documentItemObject.vstel = Documents[i].Vstel
            documentItemObject.vkorg = "ITM1"
            documentItemObject.vtweg = "M1"
            documentItemObject.spart = "01"
            documentItemObject.lfart = Documents[i].Lfart
            documentItemObject.matnr = Documents[i].Material
            documentItemObject.werks = Documents[i].Plant
            documentItemObject.wadat = postingDate
            documentItemObject.lfdat = postingDate
            documentItemObject.lfimg = Number(Documents[i].Quantity)
            documentItemObject.vrkme = Documents[i].UnitMeasure
            documentItemObject.meins = Documents[i].UnitMeasure
            documentItemObject.lgort = Documents[i].Lgort            
            documentItemObject.bwart = Documents[i].Bwart
            documentItemObject.rblvs = Documents[i].Bwart
            if(Documents[i].Bwart === '313' || Documents[i].Bwart === '311'){
                documentItemObject.shkzg_um = "1"
                documentItemObject.ummat = Documents[i].Material
                documentItemObject.umwrk = Documents[i].Plant
                documentItemObject.umlgo = "K1RP" // da SOSTITUIRE con StorageLocation
                if(Documents[i].Bwart === '313'){
                    documentItemObject.fobwa = "315"
                }              
                documentItemObject.fo_dlvtp = "ID"
                documentItemObject.kzuml = "X"
                documentItemObject.dlvtp = "OD"
                documentItemObject.umcha = Documents[i].Batch
                documentItemObject.kunwe = Documents[i].Plant
                documentItemObject.lifnr = Documents[i].Plant
            } else {
                // 541
                documentItemObject.kunwe = Documents[i].Customer
                documentItemObject.lifnr = Documents[i].Supplier
                
            }
            documentItemObject.lifex = Documents[i].CprodOrd
            documentItemObject.charg = Documents[i].Batch
            documentItemObject.wadat_ist = postingDate
            documentItemArray.push(documentItemObject)
        }*/

        /*var payload = {"vstel": "101S", "DeliveryItems":
            [{"vstel": "101S",
            "vkorg": "ITM1",
            "vtweg": "M1",
            "spart": "01",
            "lfart": "ZHOD",
            "dlvtp": "OD",
            "kunwe": "PF10", 
            "matnr": "MAI4168H06H",
            "werks": "PF10",
            "wadat": "2025-04-01",
            "lfdat": "2025-04-01",
            "lfimg": 1.123,
            "vrkme": "KG",
            "meins": "KG",
            "lgort": "H1RP",
            "lifnr": "PF10",
            "bwart": "313",
            "rblvs": "311",
            "shkzg_um": "1",
            "ummat": "MAI4168H06H",
            "umwrk": "PF10",
            "umlgo": "K1RP",
            "wadat_ist": "2025-04-01",
            "fobwa": "315",
            "fo_dlvtp": "ID",
            "kzuml": "X"}]
        }*/
       /*
        var payload = {
            "vstel": vstel,
            "DeliveryItems": documentItemArray
        }

        try {
                      
            return createDeliverySD.tx(req).post("/CreateDelH", payload)         

        } catch (error) {

            console.log(error.message)
            return error.message
        }*/
    })

    this.on('READ', 'A_MaterialStock', async (req) => {
        let stockData = [];

         // Set the configuration options for the GET request to the destination service
         var material = 'MAE31745'
         const get_config = {
            method: "GET",
            url: serverUrl + "API_MATERIAL_STOCK_SRV/A_MaterialStock('"+ material +"')/to_MatlStkInAcctMod",
            headers: {
                "content-type": "application/json",
                Authorization: BasicAuth, // Encode the client ID and secret as base64
            },
            params: {
                //$orderby: "CountryName",
                $format: "json",
                $filter: ``,
            },
            httpsAgent: new https.Agent({  
                rejectUnauthorized: false  // Ignora il certificato non valido (solo per sviluppo)
            })
        };

        const stockResponse = await axios(get_config);

        // Verifica se i dati sono stati ricevuti
        if (stockResponse.status) {
            stockData = stockResponse.data;

            return stockData; // Restituisce i dati al client
        }

        return "No data found.";
    })

});