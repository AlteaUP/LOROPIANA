namespace LoroPianaCAP.zsubcontracting_cockpit.db.TYPES;

type MaterialRecord : {
    Material        : String not null;
    Plant           : String;
    Batch           : String;
    StorageLocation : String;
    CprodOrd        : String;
    Stock           : Decimal(9, 3);
    Quantity        : Decimal(9, 3);
    UnitMeasure     : String;
    Lgort           : String;
    Bwart           : String;
    WorkCenterInternalID : String;
    Vstel           : String;
    Lfart           : String;
    Customer        : String;
    Supplier        : String;
    Wadak           : String;
    AvaibilityQtyDefaultStorage : String;
    AvaibilityQtyProdStorage    : String;
    Kdmat           : String;
}

type MaterialCreateDocument : {
    Material        : String not null;
    Plant           : String;
    Batch           : String;
    StorageLocation : String;
    CprodOrd        : String;
    Stock           : Decimal(9, 3);
    Quantity        : Decimal(9, 3);
    UnitMeasure     : String;
    Lgort           : String;
    Bwart           : String;
    WorkCenterInternalID : String;
    Vstel           : String;
    Lfart           : String;
    Customer        : String;
    Supplier        : String;
    PurchaseOrder   : String;
    PurchaseOrderItem : String;
    MasterProductionOrder : String;
    ManufacturingOrder : String;
    ManufacturingOrderOperation: String;
    //Wadak : String;
}

type MaterialRecordStructure : {
    Records : array of MaterialRecord
}

type InputStockMaterialAPI : {
    Material        : String;
    Supplier        : String;
}

type ResponseStockMaterialAPI : {
    Material                        : String;
    Supplier                        : String;
    MatlWrhsStkQtyInMatlBaseUnit    : Decimal(9, 2);
}