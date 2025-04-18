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
}

type MaterialRecordStructure : {
    Records : array of MaterialRecord
}