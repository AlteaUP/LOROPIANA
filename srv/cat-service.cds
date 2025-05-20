using {LoroPianaCAP.zsubcontracting_cockpit.db.TYPES as TYPES} from '../db/TYPES';

using my.bookshop as my from '../db/schema';
using { MM_PUR_SUBCONTRACTING_COCKPIT_SRV as main_service} from './EXTERNAL/MM_PUR_SUBCONTRACTING_COCKPIT_SRV';
using { API_MATERIAL_STOCK_SRV as stock_service} from './EXTERNAL/API_MATERIAL_STOCK_SRV';
//using { ZZ1_I_UNION_CDS as customCDS} from './EXTERNAL/ZZ1_I_UNION_CDS';
using { ZZ1_I_COMBORDER_COMP_CDS as customCDS } from './EXTERNAL/ZZ1_I_COMBORDER_COMP_CDS';
using { ZZ1_I_ARUN_BDBSSUMQTY_CDS_CDS as materialQtySumCDS } from './EXTERNAL/ZZ1_I_ARUN_BDBSSUMQTY_CDS_CDS';
using { API_MATERIAL_DOCUMENT_SRV as material_document} from './EXTERNAL/API_MATERIAL_DOCUMENT_SRV';
using { ZZ1_I_SUMQTYDELIVERY_T_CDS as sumQtyDelivery } from './EXTERNAL/ZZ1_I_SUMQTYDELIVERY_T_CDS';
using { ZMPF_SD_CREATE_DELIVERY as create_sd_delivery } from './EXTERNAL/ZMPF_SD_CREATE_DELIVERY';
using { ZZ1_I_SHIPPINGPOINT_CDS as ShippingPointCDS} from './EXTERNAL/ZZ1_I_SHIPPINGPOINT_CDS';
using { ZZ1_I_UNION_SUBCONCTR_COMP_CDS as ComponentCDS } from './EXTERNAL/ZZ1_I_UNION_SUBCONCTR_COMP_CDS';
using { ZZ1_I_WORKCENTERTXT_CDS as WorkCenterCDS } from './EXTERNAL/ZZ1_I_WORKCENTERTXT_CDS';
using { ZZ1_I_PLANTTXT_CDS as PlantCDS } from './EXTERNAL/ZZ1_I_PLANTTXT_CDS';

@cds.query.limit.default: 500
@cds.query.limit.max: 500
service CatalogService {
    @readonly entity Books as projection on my.Books;

    @readonly entity C_ProcmtDocSubcontrgHierarchy as projection on main_service.C_ProcmtDocSubcontrgHierarchy{
        *,
        null as StockMaterial : Decimal,
        null as StockMaterialUnitMeasure : String,
    };

    @readonly entity A_MaterialStock as projection on stock_service.A_MaterialStock;

    @readonly entity ZZ1_C_PRODUCT as projection on customCDS.ZZ1_C_PRODUCT;

    /*@readonly entity MainCds as projection on customCDS.ZZ1_ZZ1_ZZ1_I_UNION_API{
        *,
        null as StockMaterial : Decimal,
        null as StockMaterialUnitMeasure : String,
    }*/
    @readonly entity MainCds as projection on customCDS.ZZ1_I_COMBORDER_COMP{
        //key ID,
        @Common.Label: '{i18n>cprodOrd}'
        key CprodOrd,
        key requirementtype,
        @Common.Label: '{i18n>material}'
        key Material,
        key OrderIntBillOfOperationsItem,
        key BillOfMaterialItemNumber_2,
        key BaseUnit,
        @Common.Label: '{i18n>plant}'
        key Plant,
        key SortField,
        key BOMItemCategory,
        key ReservationIsFinallyIssued,
        key MaterialComponentIsPhantomItem,
        key IsBulkMaterialComponent,
        key InventorySpecialStockValnType,
        key EntryUnit,
        key ComponentScrapInPercent,
        key OperationScrapInPercent,
        key LeadTimeOffset,
        key StorageLocation,
        key ProductionSupplyArea,
        key Batch,
        key BOMItemDescription,
        key BOMItemText2,
        key IsMarkedForDeletion,
        key ComponentIsMissing,
        key Product,
        key ProductionUnit,
        key ProductSeasonYear,
        key ProductSeason,
        key ProductCollection,
        key ProductTheme,
        @Common.Label: '{i18n>workCenter}'
        key WorkCenterInternalID,
        key WorkCenterTypeCODE_2_1,
        key ManufacturingOrderSequence,
        key ManufacturingOrderOperation,
        @Common.Label: '{i18n>manufacturingOrderType}'
        key ManufacturingOrderType,
        key ProductionInvtryManagedLoc,
        key Supplier,        
        key WorkCenter,
        key Customer,
        key BPSupplierName,
        key StreetName,
        key CityName,
        key PostalCode,
        key Country,
        key Region,
        key Lgort1,
        key Lgort2,
        key Lgort3,
        key ProductDescription,
        key InventorySpecialStockType,
        *,
        null as StockMaterial : Decimal,
        null as StockMaterialUnitMeasure : String,
        null as QtyTrafficLight: Decimal,
        null as QtyTrafficLightStatus: String,
        null as QtyToIssue: Decimal,
        null as TotalAllocQtyCustom: Decimal,
        null as AvaibilityQtyDefaultStorage: Decimal,
        null as AvaibilityQtyProdStorage: Decimal,
        null as IssuedDefQty: Decimal,
        null as IssuedProdQty: Decimal,
        null as TotMagDefault: Decimal,
        null as TotMagProd: Decimal,
        @Common.Label: '{i18n>supplier}'
        null as SupplierWithDescription: String,
        to_ZZ1_C_PRODUCT : Association to ZZ1_C_PRODUCT on Material = to_ZZ1_C_PRODUCT.Product,
    }

    @readonly entity ZZ1_I_ARUN_BDBSSUMQTY_CDS as projection on materialQtySumCDS.ZZ1_I_ARUN_BDBSSUMQTY_CDS{
        key ReservNum,
        key ReservItem,
        key Material,
        key MaterialBaseunit,
        key Plant,
        key StorageLocation,
        *,
    }

    @readonly entity A_MaterialDocumentHeader as projection on material_document.A_MaterialDocumentHeader;

    @readonly entity ZZ1_I_SUMQTYDELIVERY_T as projection on sumQtyDelivery.ZZ1_I_SUMQTYDELIVERY_T {
        *
    }

    @readonly entity CreateDelH as projection on create_sd_delivery.CreateDelH;

    @readonly entity ZZ1_I_ShippingPoint as projection on ShippingPointCDS.ZZ1_I_ShippingPoint;

    @readonly entity ZZ1_I_WORKCENTERTXT as projection on WorkCenterCDS.ZZ1_I_WORKCENTERTXT;
    
    @readonly entity ZZ1_I_PLANTTXT as projection on PlantCDS.ZZ1_I_PLANTTXT;

    @readonly entity ZZ1_I_UNION_SUBCONCTR_COMP as projection on ComponentCDS.ZZ1_I_UNION_SUBCONCTR_COMP;

    action CreateDelivery(Record: many TYPES.MaterialRecord) returns String;

    action CreateMaterialDocument(Record: many TYPES.MaterialCreateDocument) returns String;

    action GetMaterialStock(Object: TYPES.InputStockMaterialAPI) returns many TYPES.ResponseStockMaterialAPI;
}

/*annotate CatalogService with @requires :
[
    'authenticated-user'
];*/
