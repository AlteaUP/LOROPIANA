/* checksum : bb1d59c4feb79a85c291b38e005c4b79 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_UNION_SUBCONCTR_COMP_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_I_UNION_SUBCONCTR_COMP_T1'
entity ZZ1_I_UNION_SUBCONCTR_COMP_CDS.ZZ1_I_UNION_SUBCONCTR_COMP {
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Impegno'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  key Reservation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Posizione impegno'
  key ReservationItem : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di record impegno'
  key RecordType : String(1) not null;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'TotalAllocQty'
  TotalAllocQty : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  Supplier : String(10);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ID interno ordine'
  @sap.quickinfo : 'ID interno dell''ordine'
  OrderInternalID : String(10);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ID int. operazione'
  @sap.quickinfo : 'Identificatore interno di un''operazione o attività'
  OrderOperationInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Operazione'
  @sap.quickinfo : 'Operazione ordine di produzione'
  ManufacturingOrderOperation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sequenza'
  @sap.quickinfo : 'Sequenza ordine di produzione'
  ManufacturingOrderSequence : String(6);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di centro di lavoro'
  WorkCenterTypeCODE_2_1 : String(2);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Int. centro lav.'
  @sap.quickinfo : 'ID interno centro di lavoro'
  WorkCenterInternalID : String(8);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Contatore'
  @sap.quickinfo : 'Contatore generale dell''ordine'
  OrderIntBillOfOperationsItem : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ord. prod. combinato'
  @sap.quickinfo : 'Ordine prod. principale comb.'
  CprodOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ordine prod. princ.'
  @sap.quickinfo : 'Numero ordine di produzione principale'
  FshMprodOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tema'
  @sap.quickinfo : 'Tema fashion'
  ProductTheme : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Collezione'
  @sap.quickinfo : 'Collezione fashion'
  ProductCollection : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stagione'
  ProductSeason : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ordine prod. princ.'
  @sap.quickinfo : 'Numero ordine di produzione principale'
  MasterProductionOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Esercizio stagionale'
  ProductSeasonYear : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Unità di produzione'
  @sap.quickinfo : 'Unità di misura di produzione'
  @sap.semantics : 'unit-of-measure'
  ProductionUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di fabbisogno'
  requirementtype : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Documento d''acquisto'
  PurchaseOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Posizione del documento d''acquisto'
  PurchaseOrderItem : String(5);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Schedulazione'
  @sap.quickinfo : 'Contatore sched.'
  PurchaseOrderScheduleLine : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  Material : String(40);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Quantità fabbisogno'
  RequiredQuantity : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Quantità prelevata'
  WithdrawnQuantity : Decimal(13, 3);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data fabbisogno'
  @sap.quickinfo : 'Data fabbisogno componente materiale'
  RequirementDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Ora fabbisogno'
  @sap.quickinfo : 'Ora fabbisogno del componente del materiale'
  RequirementTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Divisione'
  Plant : String(4);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data dell''ultimo fabbisogno'
  LatestRequirementDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero di posizione distinta base'
  BillOfMaterialItemNumber_2 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Crit. class.'
  @sap.quickinfo : 'Criterio di classificazione'
  SortField : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cat. pos .dist. base'
  @sap.quickinfo : 'Categoria di posizione distinta base'
  BOMItemCategory : String(1);
  @sap.required.in.filter : 'false'
  @sap.label : 'Posizione dummy'
  @sap.quickinfo : 'Indicatore posizione dummy'
  MaterialComponentIsPhantomItem : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Merce sfusa'
  @sap.quickinfo : 'Indicatore: merce sfusa'
  IsBulkMaterialComponent : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di valutazione stock speciale'
  @sap.quickinfo : 'Tipo di valutazione stock inventario speciale'
  InventorySpecialStockValnType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tp. stock speciale'
  @sap.quickinfo : 'Tipo di stock inventario speciale'
  InventorySpecialStockType : String(1);
  @sap.required.in.filter : 'false'
  @sap.label : 'Prel. fin.'
  @sap.quickinfo : 'Prelievo finale dell''impegno'
  ReservationIsFinallyIssued : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'UM acquisizione'
  @sap.quickinfo : 'Unità di misura di registrazione'
  @sap.semantics : 'unit-of-measure'
  EntryUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'Quantità'
  @sap.quickinfo : 'Quantità in unità di misura di acquisizione'
  QuantityInEntryUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Contatore'
  @sap.quickinfo : 'Contatore per la conversione in unità di mis. di base'
  MaterialQtyToBaseQtyNmrtr : Decimal(5, 0);
  @sap.required.in.filter : 'false'
  @sap.label : 'Denominatore'
  @sap.quickinfo : 'Denom. per la conversione in unità di misura di base'
  MaterialQtyToBaseQtyDnmntr : Decimal(5, 0);
  @sap.required.in.filter : 'false'
  @sap.label : 'Scarto comp. (%)'
  @sap.quickinfo : 'Scarto del componente in percentuale'
  ComponentScrapInPercent : Decimal(5, 2);
  @sap.required.in.filter : 'false'
  @sap.label : 'Scarto oper. in %'
  @sap.quickinfo : 'Scarto operazione'
  OperationScrapInPercent : Decimal(5, 2);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Qtà per contr. disp.'
  @sap.quickinfo : 'Quantità confermata per contr. disponibilità in UMM'
  ConfdQtyForATPInBaseUoM : Decimal(15, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Scostamento nel lead time'
  LeadTimeOffset : Decimal(3, 0);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Magazzino'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Area di approvvigionamento produzione'
  ProductionSupplyArea : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Partita'
  @sap.quickinfo : 'Numero partita'
  Batch : String(10);
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo posizione'
  @sap.quickinfo : 'Testo posizione distinta base (riga 1)'
  BOMItemDescription : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo posizione 2'
  @sap.quickinfo : 'Testo posizione distinta base (riga 2)'
  BOMItemText2 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Codice canc.'
  @sap.quickinfo : 'Indicatore di cancellazione nel documento acquisti'
  PurchasingDocumentDeletionCode : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ordine di produzione'
  @sap.quickinfo : 'ID ordine di produzione'
  ManufacturingOrder : String(12);
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo ordine'
  @sap.quickinfo : 'Testo ordine di produzione'
  ManufacturingOrderText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di ordine'
  ManufacturingOrderType : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Flag di canc.'
  @sap.quickinfo : 'Flag di cancellazione'
  IsMarkedForDeletion : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Parte mancante'
  MaterialComponentIsMissing : Boolean;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data di cr. ordine'
  @sap.quickinfo : 'Data di creazione ordine'
  CreationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Autore'
  @sap.quickinfo : 'Nome autore acquisizione'
  CreatedByUser : String(12);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  Product : String(40);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data inizio pian.'
  @sap.quickinfo : 'Data inizio pianificata per ordine di produzione'
  MfgOrderPlannedStartDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Società'
  CompanyCode : String(4);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data inizio sched.'
  @sap.quickinfo : 'Data inizio schedulata per ordine di produzione'
  MfgOrderScheduledStartDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data fine confermata'
  @sap.quickinfo : 'Data di fine confermata ordine di produzione'
  MfgOrderConfirmedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data fine schedulata'
  @sap.quickinfo : 'Data fine schedulata per ordine di produzione'
  MfgOrderScheduledEndDate : Date;
};

