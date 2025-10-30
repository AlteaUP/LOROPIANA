const { default: cds } = require("@sap/cds");

const serverUrl = "https://lpappsvi.lp.corp:8001/sap/opu/odata/sap/";
const BasicAuth = "Basic " + Buffer.from("LILLAD:LoroPiana2025!").toString("base64"); // Encode the client ID and secret as base64
//const axios = require("axios");
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
    const cdsWorkCenter = await cds.connect.to('ZZ1_I_WORKCENTERTXT_CDS');
    const cdsPlant = await cds.connect.to('ZZ1_I_PLANTTXT_CDS');
    const cdsCombOrder = await cds.connect.to('ZZ1_I_COMBORDMATCHCODE_CDS');
    const cdsOrderType = await cds.connect.to('ZZ1_I_PRODTYPEMATCHCOD_CDS');
    const componentsPoint = await cds.connect.to('ZZ1_I_UNION_SUBCONCTR_COMP_CDS');
    const cdsAtpRules = await cds.connect.to('ZZ1_I_PRDCORD_ATP_RULES_CDS');
    const cdsStock = await cds.connect.to('ZZ1_I_COMB_COMPSTOCK_CDS');
    const cdsUserParams = await cds.connect.to('ZZ1_C_MFG_USERPARAMS_CDS');
    const cdsCustomParams = await cds.connect.to('ZZ1_MFI_LUOGOSPED_TIPOCONS_CDS');

    this.on('READ', "MainCds", async request => {

        console.log("dentro read MainCds");

        console.log("TEST tempi -> Entro nel metodo " + new Date())

        // rimuovo orderBy per ID
        if (request.query.SELECT.orderBy !== null && request.query.SELECT.orderBy !== undefined) {
            if (request.query.SELECT.orderBy.length === 1) {
                if (request.query.SELECT.orderBy[0].ref[0] === 'ID') {
                    delete request.query.SELECT.orderBy
                }
            } else {
                if (request.query.SELECT.orderBy[0].ref[0] === 'ID') {
                    request.query.SELECT.orderBy.splice(0, 1)
                }
            }
        }

        // modifica DL - 21/05/2025 - elimino record con combined order vuoto
        if(request.query.SELECT.where !== null && request.query.SELECT.where !== undefined){
            request.query.SELECT.where.push('and')
            request.query.SELECT.where.push({ref: ['CprodOrd']})
            request.query.SELECT.where.push('<>')
            request.query.SELECT.where.push({val: ''})
        } else {
            request.query.SELECT.where = []
            request.query.SELECT.where.push({ref: ['CprodOrd']})
            request.query.SELECT.where.push('<>')
            request.query.SELECT.where.push({val: ''})
        }
        // modifica DL - 21/05/2025 - elimino record con combined order vuoto - FINE

        var data = await cdsView.tx(request).run(request.query);
        //var data = await cdsView.tx(request).run(SELECT.from(cdsView));

        // modifica 09/05/2025 - elimino record con combined order vuoto, spostata logica sopra
        //data = data.filter(item => item.CprodOrd !== "");

        // elimino record con requirementtype = 'BB' and supplier empty
        /*for(var g=0; g<data.length; g++){
            if(data[g].requirementtype === 'BB' && data[g].Supplier === ''){
                data.splice(g,1)
            }
        }*/
        data = data.filter(item => {
            return !(item.requirementtype === 'BB' && item.Supplier === '');
        });

        console.log("data length " + data.length)

        if (Object.prototype.toString.call(data) === '[object Array]') {

            let dataSingleMaterial = []
            let arrayDataStock = []
            let arrayDataQtyBdbsTotDefAllocQty = []
            let arrayDataQtyBdbs = []
            let arrayDataSumQtyDelivery = []
            let arrayStockOrderNoBatch = {}

            var dataMaterial = []

            if (Number(data.length) > 0) {

                // creo array dei materiali
                dataSingleMaterial = data.reduce((unique, o) => {
                    if (!unique.some(obj => obj.Material === o.Material)) {
                        unique.push(o);
                    }
                    return unique;
                }, []);

                for (var e = 0; e < dataSingleMaterial.length; e++) {
                    dataMaterial.push(dataSingleMaterial[e].Material)
                }

                console.log("dataMaterial lunghezza " + dataMaterial.length)

                //console.log("dataSingleMaterial "+JSON.stringify(dataSingleMaterial))
                console.log("dataMaterial " + JSON.stringify(dataMaterial))

                const { A_MaterialStock } = apiStock.entities;
                const { ZZ1_I_ARUN_BDBSSUMQTY_CDS } = cdsMaterialQtyDbdsSum.entities;
                const { ZZ1_I_SUMQTYDELIVERY_T } = cdsSumQtyDelivery.entities;
                const { ZZ1_I_COMB_COMPSTOCK } = cdsStock.entities;

                console.log("TEST tempi -> inizio select stock API " + new Date())

                // modifica DL - 24/06/2025 - nuova CDS per lo stock
                try {
                    arrayDataStock = await cdsStock.run(SELECT(ZZ1_I_COMB_COMPSTOCK).where({ Material: { in: dataMaterial } }).limit(1000));
                } catch (error) {
                    console.log(error)
                }
                // modifica DL - 24/06/2025 - nuova CDS per lo stock - FINE

                /*try {
                    var dataStock = await apiStock.run(SELECT(A_MaterialStock, material => {
                        material.to_MatlStkInAcctMod((to_MatlStkInAcctMod) => {
                            to_MatlStkInAcctMod('*')
                        })
                    }).where({ Material: { in: dataMaterial } }));
                } catch (error) {
                    console.log(error)
                }

                if (dataStock !== undefined && dataStock !== null) {
                    if (dataStock.length > 0) {
                        for (var c = 0; c < dataStock.length; c++) {
                            for (var f = 0; f < dataStock[c].to_MatlStkInAcctMod.length; f++) {
                                arrayDataStock.push(dataStock[c].to_MatlStkInAcctMod[f])
                            }
                        }
                    }

                    console.log("Lunghezza arrayDataStock " + arrayDataStock.length)

                    console.log("TEST tempi -> fine select stock API " + new Date())
                }*/

                //console.log("Multiple Stock "+JSON.stringify(dataStock))

                // recupero quantità dal servizio BDBS
                try {
                    var dataBDBS = await cdsMaterialQtyDbdsSum.run(SELECT(ZZ1_I_ARUN_BDBSSUMQTY_CDS).where({ Material: { in: dataMaterial } }).limit(100));
                } catch (error) {
                    console.log(error)
                }

                console.log("TEST tempi -> fine prima lettura BDBS " + new Date())

                // aggrego per batch
                if (dataBDBS !== null && dataBDBS !== undefined) {
                    if (dataBDBS.length > 0) {
                        var dataBDBSByBatch = dataBDBS.reduce((acc, { Batch, TotalAllocQty, StorageLocation, Material }) => {
                            acc[Batch + Material] = acc[Batch + Material] || { Batch, TotalAllocQty: 0, StorageLocation, Material };
                            acc[Batch + Material].TotalAllocQty += Number(TotalAllocQty);
                            return acc;
                        }, {});
                    }

                    // creo array per batch + record con batch vuoto e sommma delle quantità
                    if (dataBDBS.length > 0) {
                        var sum = 0
                        var object = {}
                        for (var j = 0; j < dataBDBS.length; j++) {
                            var objectBatch = {}
                            var objectdataBDBS = {}
                            objectdataBDBS = arrayDataQtyBdbs.find((o) => o.Batch === dataBDBS[j].Batch);
                            if (dataBDBSByBatch[dataBDBS[j].Batch + dataBDBS[j].Material] !== undefined && objectdataBDBS === undefined) {
                                objectBatch.Batch = dataBDBS[j].Batch
                                objectBatch.Material = dataBDBS[j].Material
                                objectBatch.TotalAllocQty = dataBDBSByBatch[dataBDBS[j].Batch + dataBDBS[j].Material].TotalAllocQty
                                objectBatch.StorageLocation = dataBDBSByBatch[dataBDBS[j].Batch + dataBDBS[j].Material].StorageLocation
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

                console.log("arrayDataQtyBdbs lunghezza " + arrayDataQtyBdbs.length)

                try {
                    var dataSumQtyDelivery = await cdsSumQtyDelivery.run(SELECT(ZZ1_I_SUMQTYDELIVERY_T).where({ Material: { in: dataMaterial } }).limit(100));
                } catch (error) {
                    console.log(error)
                }

                console.log("TEST tempi -> fine prima lettura SUMQTYDELIVERY " + new Date())

                // aggrego per batch
                if (dataSumQtyDelivery !== null && dataSumQtyDelivery !== undefined) {
                    if (dataSumQtyDelivery.length > 0) {
                        var dataSumQtyDeliveryByBatch = dataSumQtyDelivery.reduce((acc, { Batch, TotDeliveryQty, StorLoc, Material }) => {
                            acc[Batch + Material] = acc[Batch + Material] || { Batch, TotDeliveryQty: 0, StorLoc, Material };
                            acc[Batch + Material].TotDeliveryQty += Number(TotDeliveryQty);
                            return acc;
                        }, {});
                    }

                    // creo array per batch + record con batch vuoto e sommma delle quantità
                    if (dataSumQtyDelivery.length > 0) {
                        sum = 0
                        object = {}
                        for (var s = 0; s < dataSumQtyDelivery.length; s++) {
                            var objectSumQtyDelivery = {}
                            var objectdataSumQtyDelivery = {}
                            objectdataSumQtyDelivery = arrayDataSumQtyDelivery.find((o) => o.Batch === dataSumQtyDelivery[s].Batch);
                            if (dataSumQtyDeliveryByBatch[dataSumQtyDelivery[s].Batch + dataSumQtyDelivery[s].Material] !== undefined && objectdataSumQtyDelivery === undefined) {
                                objectSumQtyDelivery.Batch = dataSumQtyDelivery[s].Batch
                                objectSumQtyDelivery.Material = dataSumQtyDelivery[s].Material
                                objectSumQtyDelivery.TotDeliveryQty = dataSumQtyDeliveryByBatch[dataSumQtyDelivery[s].Batch + dataSumQtyDelivery[s].Material].TotDeliveryQty
                                objectSumQtyDelivery.StorageLocation = dataSumQtyDeliveryByBatch[dataSumQtyDelivery[s].Batch + dataSumQtyDelivery[s].Material].StorLoc
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

                console.log("Lunghezza arrayDataStock " + arrayDataStock.length)

                console.log("TEST tempi -> inizio a calcolare colonne " + new Date())

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
                for (var z = 0; z < data.length; z++) {

                    // modifica DL - 24/06/2025 - recupero stock segment associati
                    const atpRulesPromise = cdsAtpRules.run(
                        SELECT.from('ZZ1_I_PRDCORD_ATP_RULES')
                          .where({
                            CprodOrd: data[z].CprodOrd,
                            Material: data[z].Material,
                            Plant: data[z].Plant,
                            //StorageLocation: data[z].StorageLocation,
                            Batch: data[z].Batch,
                            BillOfMaterialItemNumber_2: data[z].BillOfMaterialItemNumber_2
                        })
                    );

                    const [atpRulesData] = await Promise.all([atpRulesPromise]);

                    console.log("Ordine ATP "+data[z].CprodOrd)
                    console.log("Materiale ATP "+data[z].Material)

                    if(atpRulesData.length > 0){
                        console.log(JSON.stringify(atpRulesData[0].atp))
                        var atpRulesArray = JSON.parse(atpRulesData[0].atp)
                    }
                    // modifica DL - 24/06/2025 - recupero stock segment associati - FINE

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
                    if (data[z].Batch !== '') {
                        objectDataQtyBdbs = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch);
                        objectDataQtyBdbsLgort1 = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort1);
                        objectDataQtyBdbsLgort2 = arrayDataQtyBdbs.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort2);
                        objectDataSumQtyDeliveryLgort1 = arrayDataSumQtyDelivery.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort1);
                        objectDataSumQtyDeliveryLgort2 = arrayDataSumQtyDelivery.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.StorageLocation === data[z].Lgort2);
                        if(data[z].RequirementSegment !== null && data[z].RequirementSegment !== undefined && data[z].RequirementSegment !== ""){
                            objectDataQtyStock = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && atpRulesArray.includes(o.StockSegment));
                            objectDataQtyStockAvaibility = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.StorageLocation === data[z].Lgort1 && atpRulesArray.includes(o.StockSegment));
                            objectDataQtyStockAvaibilityLgort2 = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.StorageLocation === data[z].Lgort2 && atpRulesArray.includes(o.StockSegment));
                            objectDataQtyStockAvaibilityStockO = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.Supplier === data[z].Supplier && o.InventorySpecialStockType === 'O' && atpRulesArray.includes(o.StockSegment));
                        } else {
                            objectDataQtyStock = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch );
                            objectDataQtyStockAvaibility = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.StorageLocation === data[z].Lgort1 );
                            objectDataQtyStockAvaibilityLgort2 = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.StorageLocation === data[z].Lgort2 );
                            objectDataQtyStockAvaibilityStockO = arrayDataStock.find((o) => o.Material === data[z].Material && o.Batch === data[z].Batch && o.Plant === data[z].Plant && o.Supplier === data[z].Supplier && o.InventorySpecialStockType === 'O' );
                        }
                        if (objectDataQtyBdbs !== undefined && objectDataQtyStockAvaibility !== undefined) {
                            if (objectDataQtyStock !== null && objectDataQtyStock !== undefined) {
                                data[z].StockMaterial = Number(objectDataQtyStock.MatlWrhsStkQtyInMatlBaseUnit) - Number(objectDataQtyBdbs.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)
                            }
                            data[z].TotalAllocQtyCustom = Number(objectDataQtyBdbs.TotalAllocQty)
                            if (objectDataQtyBdbs !== undefined && objectDataQtyBdbs !== null) {
                                data[z].AvaibilityQtyDefaultStorage = Number(objectDataQtyStockAvaibility.MatlWrhsStkQtyInMatlBaseUnit) - Number(objectDataQtyBdbs.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)
                            } else {
                                data[z].AvaibilityQtyDefaultStorage = Number(objectDataQtyStockAvaibility.MatlWrhsStkQtyInMatlBaseUnit) + Number(data[z].TotalDefaultAllocQty)
                            }
                        } else {
                            if (objectDataQtyStock !== null && objectDataQtyStock !== undefined) {
                                data[z].StockMaterial = Number(objectDataQtyStock.MatlWrhsStkQtyInMatlBaseUnit) + Number(data[z].TotalDefaultAllocQty)
                            }
                        }
                        if (data[z].requirementtype === 'AR') {
                            if (objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined) {
                                data[z].AvaibilityQtyProdStorage = Number(objectDataQtyStockAvaibilityLgort2.MatlWrhsStkQtyInMatlBaseUnit) - Number(objectDataQtyBdbsLgort2.TotalAllocQty) + Number(data[z].TotalProdAllocQty)
                                data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                            } else {
                                if (objectDataQtyStockAvaibilityLgort2 !== null && objectDataQtyStockAvaibilityLgort2 !== undefined) {
                                    data[z].AvaibilityQtyProdStorage = Number(objectDataQtyStockAvaibilityLgort2.MatlWrhsStkQtyInMatlBaseUnit) + Number(data[z].TotalProdAllocQty)
                                    data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                                } else {
                                    data[z].AvaibilityQtyProdStorage = Number(data[z].TotalProdAllocQty)
                                    data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                                }
                            }
                        } else {
                            // BB
                            if (objectDataQtyStockAvaibilityStockO !== null && objectDataQtyStockAvaibilityStockO !== undefined) {
                                data[z].AvaibilityQtyProdStorage = Number(objectDataQtyStockAvaibilityStockO.MatlWrhsStkQtyInMatlBaseUnit)
                                data[z].AvaibilityQtyProdStorage = data[z].AvaibilityQtyProdStorage.toFixed(3)
                            }
                        }
                        if (data[z].AvaibilityQtyProdStorage === "" || data[z].AvaibilityQtyProdStorage === null || data[z].AvaibilityQtyProdStorage === undefined) {
                            data[z].AvaibilityQtyProdStorage = 0
                        }

                        if (objectDataSumQtyDeliveryLgort1 !== null && objectDataSumQtyDeliveryLgort1 !== undefined) {
                            data[z].IssuedDefQty = Number(objectDataSumQtyDeliveryLgort1.TotDeliveryQty)
                        } else {
                            data[z].IssuedDefQty = 0
                        }
                        if (objectDataSumQtyDeliveryLgort2 !== null && objectDataSumQtyDeliveryLgort2 !== undefined) {
                            data[z].IssuedProdQty = Number(objectDataSumQtyDeliveryLgort2.TotDeliveryQty)
                        } else {
                            data[z].IssuedProdQty = 0
                        }
                        if (objectDataQtyBdbsLgort1 !== null && objectDataQtyBdbsLgort1 !== undefined) {
                            data[z].TotMagDefault = Number(objectDataQtyBdbsLgort1.TotalAllocQty)
                        } else {
                            data[z].TotMagDefault = 0
                        }
                        if (objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined) {
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
                        if(data[z].RequirementSegment !== null && data[z].RequirementSegment !== undefined && data[z].RequirementSegment !== ""){
                            arrayStockOrderWithoutBatch = arrayDataStock.filter(obj => obj.Material === data[z].Material && atpRulesArray.includes(obj.StockSegment ))
                            arrayStockOrderWithoutBatchAvaibility = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.StorageLocation === data[z].Lgort1 && atpRulesArray.includes(obj.StockSegment ))
                            arrayStockOrderWithoutBatchAvaibilityLgort2 = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.StorageLocation === data[z].Lgort2 && atpRulesArray.includes(obj.StockSegment ))
                            arrayStockOrderWithoutBatchAvaibilityStockO = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.Supplier === data[z].Supplier && obj.InventorySpecialStockType === 'O' && atpRulesArray.includes(obj.StockSegment ))
                        } else {
                            arrayStockOrderWithoutBatch = arrayDataStock.filter(obj => obj.Material === data[z].Material )
                            arrayStockOrderWithoutBatchAvaibility = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.StorageLocation === data[z].Lgort1 )
                            arrayStockOrderWithoutBatchAvaibilityLgort2 = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.StorageLocation === data[z].Lgort2 )
                            arrayStockOrderWithoutBatchAvaibilityStockO = arrayDataStock.filter(obj => obj.Material === data[z].Material && obj.Plant === data[z].Plant && obj.Supplier === data[z].Supplier && obj.InventorySpecialStockType === 'O' )
                        }
                        if (arrayStockOrderWithoutBatch.length > 0) {
                            for (var t = 0; t < arrayStockOrderWithoutBatch.length; t++) {
                                sumStock = Number(sumStock) + Number(arrayStockOrderWithoutBatch[t].MatlWrhsStkQtyInMatlBaseUnit)
                            }
                            for (var x = 0; x < arrayStockOrderWithoutBatchAvaibility.length; x++) {
                                sumStockAvaibility = Number(sumStockAvaibility) + Number(arrayStockOrderWithoutBatchAvaibility[x].MatlWrhsStkQtyInMatlBaseUnit)
                            }
                            for (var q = 0; q < arrayStockOrderWithoutBatchAvaibilityLgort2.length; q++) {
                                sumStockAvaibilityLgort2 = Number(sumStockAvaibilityLgort2) + Number(arrayStockOrderWithoutBatchAvaibilityLgort2[q].MatlWrhsStkQtyInMatlBaseUnit)
                            }
                            for (var v = 0; v < arrayStockOrderWithoutBatchAvaibilityStockO.length; v++) {
                                sumStockAvaibilityStockO = Number(sumStockAvaibilityStockO) + Number(arrayStockOrderWithoutBatchAvaibilityStockO[v].MatlWrhsStkQtyInMatlBaseUnit)
                            }
                            if (objectDataQtyBdbsLgort1 !== undefined && objectDataQtyBdbsLgort1 !== null && objectDataQtyBdbsLgort1 !== "") {
                                data[z].StockMaterial = Number(sumStock) - Number(objectDataQtyBdbsLgort1.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)
                                data[z].TotalAllocQtyCustom = Number(objectDataQtyBdbsLgort1.TotalAllocQty)
                                data[z].AvaibilityQtyDefaultStorage = Number(sumStockAvaibility) - Number(objectDataQtyBdbsLgort1.TotalAllocQty) + Number(data[z].TotalDefaultAllocQty)
                            } else {
                                data[z].StockMaterial = Number(sumStock) + Number(data[z].TotalDefaultAllocQty)
                                data[z].TotalAllocQtyCustom = 0
                                data[z].AvaibilityQtyDefaultStorage = Number(sumStockAvaibility) + Number(data[z].TotalDefaultAllocQty)
                            }
                            if (data[z].requirementtype === 'AR') {
                                if (objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined) {
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
                            if (data[z].AvaibilityQtyProdStorage === "" || data[z].AvaibilityQtyProdStorage === null || data[z].AvaibilityQtyProdStorage === undefined) {
                                data[z].AvaibilityQtyProdStorage = 0
                            }

                            if (objectDataSumQtyDeliveryLgort1 !== null && objectDataSumQtyDeliveryLgort1 !== undefined) {
                                data[z].IssuedDefQty = Number(objectDataSumQtyDeliveryLgort1.TotDeliveryQty)
                            } else {
                                data[z].IssuedDefQty = 0
                            }
                            if (objectDataSumQtyDeliveryLgort2 !== null && objectDataSumQtyDeliveryLgort2 !== undefined) {
                                data[z].IssuedProdQty = Number(objectDataSumQtyDeliveryLgort2.TotDeliveryQty)
                            } else {
                                data[z].IssuedProdQty = 0
                            }
                            if (objectDataQtyBdbsLgort1 !== null && objectDataQtyBdbsLgort1 !== undefined) {
                                data[z].TotMagDefault = Number(objectDataQtyBdbsLgort1.TotalAllocQty)
                            } else {
                                data[z].TotMagDefault = 0
                            }
                            if (objectDataQtyBdbsLgort2 !== null && objectDataQtyBdbsLgort2 !== undefined) {
                                data[z].TotMagProd = Number(objectDataQtyBdbsLgort2.TotalAllocQty)
                            } else {
                                data[z].TotMagProd = 0
                            }
                            data[z].StockMaterialUnitMeasure = data[z].BaseUnit
                        }
                    }
                    if(data[z].StockMaterial !== undefined && data[z].StockMaterial !== null){
                        data[z].StockMaterial = data[z].StockMaterial.toFixed(3)
                    }
                    // DL - 29/04/2025: modifico campo Prod Storage con fornitore in caso di lavorazione esterna
                    if (data[z].requirementtype === 'BB') {
                        data[z].Lgort2 = data[z].Supplier
                    }
                    data[z].SupplierWithDescription = data[z].Supplier + ' - ' + data[z].BPSupplierName
                    // modifica DL - 21/07/2025 - valorizzo fornitore con Plant se vuoto
                    if(data[z].Supplier === null || data[z].Supplier === undefined || data[z].Supplier === ""){
                        data[z].Supplier = data[z].Plant
                        data[z].SupplierWithDescription = data[z].Plant + ' - Prod. Interna'
                    }
                    // modifica DL - 21/07/2025 - valorizzo fornitore con Plant se vuoto - FINE
                }

                console.log("TEST tempi -> fine calcolo colonne " + new Date())

                console.log("TEST tempi -> inizio calcolo semaforo " + new Date())

                for (var u = 0; u < data.length; u++) {
                    if (Number(data[u].TotalConfdQtyForATPInBaseUoM) === 0) {
                        data[u].QtyTrafficLightStatus = 1 //red
                        data[u].QtyTrafficLight = 100
                    } else if (Number(data[u].TotalConfdQtyForATPInBaseUoM) !== (Number(data[u].TotalRequiredQuantity) - Number(data[u].TotalWithdrawnQuantity))) {
                        data[u].QtyTrafficLightStatus = 2 //orange
                        data[u].QtyTrafficLight = Number(data[u].TotalConfdQtyForATPInBaseUoM) / (Number(data[u].TotalRequiredQuantity) - Number(data[u].TotalWithdrawnQuantity)) * 100
                    } else {
                        data[u].QtyTrafficLightStatus = 3  //green
                        data[u].QtyTrafficLight = Number(data[u].TotalConfdQtyForATPInBaseUoM) / (Number(data[u].TotalRequiredQuantity) - Number(data[u].TotalWithdrawnQuantity)) * 100
                    }

                    data[u].QtyToIssue = Number(data[u].TotalConfdQtyForATPInBaseUoM) - Number(data[u].TotalAllocQty) - Number(data[u].TotalDeliveryQty) - Number(data[u].TotalWithdrawnQuantity)
                    data[u].QtyToIssue = Number(data[u].QtyToIssue).toFixed(3)

                    // modifica DL - 29/10/2025 - setto stato delivery per colore riga tabella
                    console.log("data[u].TotalDeliveryQty "+parseFloat(data[u].TotalDeliveryQty))
                    console.log("data[u].QtyToIssue "+parseFloat(data[u].QtyToIssue))
                    if(parseFloat(data[u].TotalDeliveryQty) > 0 && parseFloat(data[u].QtyToIssue) === 0){
                        data[u].StatusDelivery = 'completed'
                    } else if(parseFloat(data[u].TotalDeliveryQty) > 0 && parseFloat(data[u].QtyToIssue) > 0) {
                        data[u].StatusDelivery = 'partial'
                    } else {
                        data[u].StatusDelivery = ''
                    }                
                    // modifica DL - 29/10/2025 - setto stato delivery per colore riga tabella - FINE
                }

                console.log("dati stock " + arrayDataStock.length)

                console.log("TEST tempi -> fine calcolo semaforo " + new Date())
            }
        }

        console.log("dati finali length " + data.length)

        return data
    });

    /*this.on("ZZ1_I_ShippingPoint", async (req) => {
         return await cdsShippingPoint.tx(req).run(req.query);
         await cdsView.tx(request).run(request.query);
 
     });*/
    this.on('READ', "ZZ1_I_ShippingPoint", async request => {
        request.query.SELECT.count = false
        var data = await cdsShippingPoint.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_I_WORKCENTERTXT", async request => {
        request.query.SELECT.count = false
        var data = await cdsWorkCenter.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_I_PLANTTXT", async request => {
        request.query.SELECT.count = false
        var data = await cdsPlant.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_I_COMBORDMATCHCODE", async request => {
        request.query.SELECT.count = false
        var data = await cdsCombOrder.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_I_PRODTYPEMATCHCOD", async request => {
        request.query.SELECT.count = false
        var data = await cdsOrderType.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_I_UNION_SUBCONCTR_COMP", async request => {
        var data = await componentsPoint.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_C_PRODUCT", async request => {
        var data = await componentsPoint.tx(request).run(request.query);

        return data;
    });

    this.on("CreateMaterialDocument", async (req) => {
        console.log("Chiamata ACTION CreateMaterialDocument")

        const Documents = req.data.Record;

        // Controllo che l'oggetto della request sia pieno
        if (req.data.Record.length === 0) return;

        var documentItemArray = []
        var documentItemObject = {}
        for (var i = 0; i < Documents.length; i++) {
            documentItemObject = {}
            documentItemObject.Material = Documents[i].Material
            documentItemObject.Plant = Documents[i].Plant
            documentItemObject.Batch = Documents[i].Batch
            documentItemObject.GoodsMovementType = '543'
            documentItemObject.QuantityInEntryUnit = (Documents[i].Quantity).toString()
            documentItemObject.EntryUnit = Documents[i].UnitMeasure
            documentItemObject.InventorySpecialStockType = 'O'
            documentItemObject.PurchaseOrder = Documents[i].PurchaseOrder
            documentItemObject.PurchaseOrderItem = Documents[i].PurchaseOrderItem
            documentItemObject.Supplier = Documents[i].Supplier
            documentItemObject.ManufacturingOrder = Documents[i].ManufacturingOrder
            //documentItemObject.ManufacturingOrderItem = Documents[i].ManufacturingOrderOperation
            documentItemArray.push(documentItemObject)
        }

        var postingCurrentDate = new Date()
        var year = postingCurrentDate.getFullYear()
        var month = postingCurrentDate.getMonth() + 1
        if (month < 10) {
            month = '0' + month.toString()
        }
        var day = postingCurrentDate.getDate()
        var postingDate = year.toString() + '-' + month.toString() + '-' + day.toString()

        var payload = {
            "PostingDate": postingDate + "T00:00:00",
            //"DocumentDate": "2025-04-22T00:00:00",
            "GoodsMovementCode": "03",
            //"ReferenceDocument": Documents[0].CprodOrd,
            "to_MaterialDocumentItem": documentItemArray
        }

        try {

            console.log("SUCCESSO!")

            let callCreate = await apiMaterialDocumentCreate.tx(req).post("/A_MaterialDocumentHeader", payload)
            console.log("RITORNO chiamata " + callCreate) 
            console.log("Risultato chiamata " + JSON.stringify(callCreate))

            return callCreate

            //return apiMaterialDocumentCreate.tx(req).post("/A_MaterialDocumentHeader", payload)                 

        } catch (error) {

            console.log("MESSAGGIO ERRORE "+error.message)
            return error.message
        }
    })

    this.on("CreateDelivery", async (req) => {
        console.log("Chiamata ACTION CreateDelivery")

        const Documents = req.data.Record;

        // Controllo che l'oggetto della request sia pieno
        if (req.data.Record.length === 0) return;

        var postingCurrentDate = new Date()
        var year = postingCurrentDate.getFullYear()
        var month = postingCurrentDate.getMonth() + 1
        if (month < 10) {
            month = '0' + month.toString()
        }
        var day = postingCurrentDate.getDate()
        if (day < 10) {
            day = '0' + day.toString()
        }
        var postingDate = year.toString() + '-' + month.toString() + '-' + day.toString()

        // raggruppo risultati per Supplier
        let DocumentsBySupplier = Object.values(Documents.reduce((acc, curr) => {
            if (!acc[curr.Supplier]) acc[curr.Supplier] = [];
            acc[curr.Supplier].push(curr)
            return acc;
        }, {}))

        // modifica DL - 17/06/2025 split per lfart diversi
        var multipleDelivery = false
        if(DocumentsBySupplier[0].length > 1){
            // raggruppo per lfart
            const groupedMap = DocumentsBySupplier[0].reduce((map, item) => {
                if (!map.has(item.Lfart)) {
                    map.set(item.Lfart, []);
                }
                map.get(item.Lfart).push(item);
                return map;
            }, new Map());
            // controllo che esistano lfart diversi tra di loro
            if(groupedMap.size > 1){
                multipleDelivery = true
                DocumentsBySupplier = [...groupedMap.values()];
            }
        }
        // modifica DL - 17/06/2025 split per lfart diversi - FINE

        // modifica DL - 24/07/2025 - leggo parametri utenti
        const cdsUserParams = await cds.connect.to('ZZ1_C_MFG_USERPARAMS_CDS');
        var resultUserParams = await cdsUserParams.run(
            SELECT.from('ZZ1_C_MFG_USERPARAMS_CDS.ZZ1_C_MFG_USERPARAMS')
          );
        // modifica DL - 24/07/2025 - leggo parametri utenti - FINE

        var documentItemArray = []
        var documentItemObject = {}
        var vstel = ""
        var lprio = ""
        var lfdat = ""
        var lfdatFormatted = ""
        var response = ""
        var error = ""
        for (var y = 0; y < DocumentsBySupplier.length; y++) {
            documentItemArray = []
            for (var z = 0; z < DocumentsBySupplier[y].length; z++) {
                vstel = DocumentsBySupplier[0][0].Vstel
                lprio = DocumentsBySupplier[0][0].Lprio
                lfdat = DocumentsBySupplier[0][0].Wadak
                documentItemObject = {}
                documentItemObject.rfbel = "1"
                documentItemObject.rfpos = z.toString()
                documentItemObject.vstel = DocumentsBySupplier[y][z].Vstel
                documentItemObject.vkorg = (resultUserParams.find(p => p.UserParameter === 'VKO')).UserParameterValue //"ITM1" //VKO
                documentItemObject.vtweg = (resultUserParams.find(p => p.UserParameter === 'VTW')).UserParameterValue //"M1" //VTW
                documentItemObject.spart = (resultUserParams.find(p => p.UserParameter === 'SPA')).UserParameterValue //"01" //SPA
                documentItemObject.lfart = DocumentsBySupplier[y][z].Lfart
                documentItemObject.matnr = DocumentsBySupplier[y][z].Material
                documentItemObject.werks = DocumentsBySupplier[y][z].Plant
                documentItemObject.wadat = postingDate
                if (lfdat !== null && lfdat !== undefined && lfdat !== "") {
                    var yearLfdat = "20" + lfdat.split("/")[2]
                    lfdatFormatted = yearLfdat + "-" + lfdat.split("/")[1] + "-" + lfdat.split("/")[0]
                    documentItemObject.lfdat = lfdatFormatted
                } else {
                    documentItemObject.lfdat = postingDate
                }
                documentItemObject.lfimg = Number(DocumentsBySupplier[y][z].Quantity)
                documentItemObject.vrkme = DocumentsBySupplier[y][z].UnitMeasure
                documentItemObject.meins = DocumentsBySupplier[y][z].UnitMeasure
                documentItemObject.lgort = DocumentsBySupplier[y][z].Lgort
                documentItemObject.bwart = DocumentsBySupplier[y][z].Bwart
                documentItemObject.rblvs = DocumentsBySupplier[y][z].Bwart
                if (DocumentsBySupplier[y][z].Bwart === '313' || DocumentsBySupplier[y][z].Bwart === '311') {
                    documentItemObject.shkzg_um = "1"
                    documentItemObject.ummat = DocumentsBySupplier[y][z].Material
                    documentItemObject.umwrk = DocumentsBySupplier[y][z].Plant
                    documentItemObject.umlgo = DocumentsBySupplier[y][z].StorageLocation //"K1RP" 
                    if (DocumentsBySupplier[y][z].Bwart === '313') {
                        documentItemObject.fobwa = "315"
                    }
                    if(DocumentsBySupplier[y][z].ButtonType === 'factory'){
                        documentItemObject.dlvtp = "TP"
                        documentItemObject.fo_dlvtp = ""
                    } else {
                        documentItemObject.dlvtp = "OD"
                        documentItemObject.fo_dlvtp = "ID"
                    }                    
                    documentItemObject.kzuml = "X"                    
                    documentItemObject.umcha = DocumentsBySupplier[y][z].Batch
                    documentItemObject.kunwe = DocumentsBySupplier[y][z].Plant
                    documentItemObject.lifnr = DocumentsBySupplier[y][z].Plant
                } else {
                    // 541
                    documentItemObject.kunwe = DocumentsBySupplier[y][z].Customer
                    documentItemObject.lifnr = DocumentsBySupplier[y][z].Supplier

                }
                //documentItemObject.lifex = DocumentsBySupplier[y][z].CprodOrd
                documentItemObject.kdmat = DocumentsBySupplier[y][z].Kdmat //DocumentsBySupplier[y][z].CprodOrd
                documentItemObject.charg = DocumentsBySupplier[y][z].Batch
                // modifica DL - 04/06/2025 - commento wadat_ist come richiesto da Amedeo in chat di gruppo teams
                //documentItemObject.wadat_ist = postingDate
                // modifica DL - 03/06/2025 - aggiungo campi segmentation
                documentItemObject.sgt_scat = DocumentsBySupplier[y][z].SgtScat
                documentItemObject.sgt_rcat = DocumentsBySupplier[y][z].SgtRcaT
                // modifica DL - 03/06/2025 - aggiungo campi segmentation - FINE
                // modifica DL - 29/10/2025 - aggiungo campo priorità
                documentItemObject.lprio = DocumentsBySupplier[y][z].Lprio
                // modifica DL - 29/10/2025 - aggiungo campo priorità - FINE
                documentItemArray.push(documentItemObject)
            }

            var payload = {
                "vstel": vstel,
                "DeliveryItems": documentItemArray
            }

            try {

                let callCreate = await createDeliverySD.tx(req).post("/CreateDelH", payload)
                console.log("Risultato chiamata " + JSON.stringify(callCreate))
                if(multipleDelivery){
                    var error = JSON.parse(JSON.stringify(callCreate)).DeliveryItems[0].FlErr
                    if(error){
                        response = response + "; " + "Errore: " + JSON.parse(JSON.stringify(callCreate)).DeliveryItems[0].LogMess
                    } else {
                        response = response + "; " + JSON.parse(JSON.stringify(callCreate)).DeliveryItems[0].vbeln
                    }
                } else {
                    return callCreate
                }

            } catch (error) {

                console.log(error.message)
                
                if(multipleDelivery){
                    response = response + "|| " + error.message
                } else {
                    return error.message
                }                
            }
        }
        
        if(multipleDelivery){
            return response   
        } else {
            return
        }

    })

    this.on("GetMaterialStock", async (req) => {

        // Connect to the material stock service using the CDS framework
        const apiStock = await cds.connect.to('API_MATERIAL_STOCK_SRV');
        const { A_MaterialStock } = apiStock.entities;

        let arrayDataStock = []

        try {
            var dataStock = await apiStock.run(SELECT(A_MaterialStock, material => {
                material.to_MatlStkInAcctMod((to_MatlStkInAcctMod) => {
                    to_MatlStkInAcctMod('*')
                })
            }).where({ Material: req.data.Object.Material }));
        } catch (error) {
            console.log(error)
        }

        if (dataStock !== undefined && dataStock !== null) {
            if (dataStock.length > 0) {
                for (var c = 0; c < dataStock.length; c++) {
                    for (var f = 0; f < dataStock[c].to_MatlStkInAcctMod.length; f++) {
                        if (dataStock[c].to_MatlStkInAcctMod[f].Supplier === req.data.Object.Supplier && dataStock[c].to_MatlStkInAcctMod[f].InventorySpecialStockType === 'O') {
                            arrayDataStock.push(dataStock[c].to_MatlStkInAcctMod[f])
                        }
                    }
                }
            }

            console.log("Lunghezza arrayDataStock " + arrayDataStock.length)

            console.log("TEST tempi -> fine select stock API " + new Date())
        }

        return arrayDataStock;

    })

    this.on('READ', 'A_MaterialStock', async (req) => {
        let stockData = [];

        // Set the configuration options for the GET request to the destination service
        var material = 'MAE31745'
        const get_config = {
            method: "GET",
            url: serverUrl + "API_MATERIAL_STOCK_SRV/A_MaterialStock('" + material + "')/to_MatlStkInAcctMod",
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

        //const stockResponse = await axios(get_config);

        // Verifica se i dati sono stati ricevuti
        /*if (stockResponse.status) {
            stockData = stockResponse.data;

            return stockData; // Restituisce i dati al client
        }

        return "No data found.";*/
    })

    this.on('READ', "ZZ1_I_PRDCORD_ATP_RULES", async request => {
        request.query.SELECT.count = false
        var data = await cdsAtpRules.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_I_COMB_COMPSTOCK", async request => {
        var data = await cdsStock.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_C_MFG_USERPARAMS", async request => {
        var data = await cdsUserParams.tx(request).run(request.query);

        return data;
    });

    this.on('READ', "ZZ1_MFI_LUOGOSPED_TIPOCONS", async request => {
        var data = await cdsCustomParams.tx(request).run(request.query);

        return data;
    });

});