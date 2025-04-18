const serverUrl = "https://lpappsvi.lp.corp:8001/sap/opu/odata/sap/";
const BasicAuth = "Basic " + Buffer.from("LILLAD:LoroPiana2025!").toString("base64"); // Encode the client ID and secret as base64
const axios = require("axios");
const https = require('https');

class SubcontractingManage {
    /**
   * @namespace SubcontractingManage

   */

    async _readOrders(req, srv) {
        let orderData = [];
        let orderDataWithStock = []
        let dataSingleMaterial = []
        let arrayStockOrderNoBatch = {}

         // Set the configuration options for the GET request to the destination service
         const get_config = {
            method: "GET",
            url: serverUrl + "MM_PUR_SUBCONTRACTING_COCKPIT_SRV/C_ProcmtDocSubcontrgHierarchy",
            headers: {
                "content-type": "application/json",
                Authorization: BasicAuth, // Encode the client ID and secret as base64
            },
            params: {
                //$orderby: "CountryName",
                $format: "json",
                $filter: `RequestedDeliveryDate ge datetime'2015-02-27T00:00:00' and RequestedDeliveryDate le datetime'2025-02-27T00:00:00'`,
            },
            httpsAgent: new https.Agent({  
                rejectUnauthorized: false  // Ignora il certificato non valido (solo per sviluppo)
            })
        };

        const OrderResponse = await axios(get_config);

        // Verifica se i dati sono stati ricevuti
        if (OrderResponse.status) {
            orderData = OrderResponse.data;            

            // recupero solo i singoli materiali per chiamare servizio recupero stock
            dataSingleMaterial = orderData.d.results.reduce((unique, o) => {
                if(!unique.some(obj => obj.Material === o.Material)) {
                  unique.push(o);
                }
                return unique;
            },[]);
            
            // recupero stock in base al materiale
            for(var i = 0; i < dataSingleMaterial.length; i++){
                var stockForMaterial = []
                stockForMaterial = await this.getStock(dataSingleMaterial[i])
                for(var y = 0; y < stockForMaterial.length; y++){
                    orderDataWithStock.push(stockForMaterial[y])
                }
            }

            // inserisco stock nell'array principale
            for(var z = 0; z < orderData.d.results.length; z++){
                for(var t = 0; t < orderDataWithStock.length; t++){
                    if(orderData.d.results[z].Batch !== ''){
                        if(orderData.d.results[z].Material === orderDataWithStock[t].Material && orderData.d.results[z].Batch === orderDataWithStock[t].Batch){
                            orderData.d.results[z].StockMaterial = orderDataWithStock[t].MatlWrhsStkQtyInMatlBaseUnit
                            orderData.d.results[z].StockMaterialUnitMeasure = orderDataWithStock[t].MaterialBaseUnit
                            break
                        }
                    } else {
                        arrayStockOrderNoBatch = []
                        arrayStockOrderNoBatch = orderDataWithStock.filter(obj => obj.Material === orderData.d.results[z].Material)

                        for(var v  = 0; v < arrayStockOrderNoBatch.length; v++){
                            if(orderData.d.results[z].StockMaterial === undefined || orderData.d.results[z].StockMaterial === null){
                                orderData.d.results[z].StockMaterial = Number(arrayStockOrderNoBatch[v].MatlWrhsStkQtyInMatlBaseUnit)
                            } else {
                                orderData.d.results[z].StockMaterial = Number(orderData.d.results[z].StockMaterial) + Number(arrayStockOrderNoBatch[v].MatlWrhsStkQtyInMatlBaseUnit)
                            }
                            orderData.d.results[z].StockMaterialUnitMeasure = arrayStockOrderNoBatch[v].MaterialBaseUnit
                        }
                        break
                    }
                }
            }

            return orderData; // Restituisce i dati al client
        }

        return "No data found.";

    }

    async getStock(data){
        let stockData = [];
        
        // Set the configuration options for the GET request to the destination service
        var material = data.Material
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

            return stockData.d.results; // Restituisce i dati al client
        }

        return "No data found.";
    }


}

exports.SubcontractingManage = SubcontractingManage