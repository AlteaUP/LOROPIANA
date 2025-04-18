/* checksum : 2b88ebac26fb295fcd9eef9d5a0e2f62 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx pdf'
service MM_PUR_SUBCONTRACTING_COCKPIT_SRV {}

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SubcontrgCockpitDelivery {
  @sap.unicode : 'false'
  @sap.label : 'Impegno'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Reservation : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Posizione impegno'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ReservationItem : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Componente'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Material : String(40) not null;
  @sap.unicode : 'false'
  @sap.label : 'Divisione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Plant : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Fornitore'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Supplier : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'DELIVERYTYPE'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeliveryType : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'REQUIREDQUANTITY'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  RequiredQuantity : Decimal(13, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Dare/Avere'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DebitCreditCode : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'SHIPMENTCOMPLETIONDATE'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ShipmentCompletionDate : String(8) not null;
  @sap.unicode : 'false'
  @sap.label : 'Fatturazione interna organizzazione commerciale'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SalesOrganization : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Canale di distribuzione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DistributionChannel : String(2) not null;
  @sap.unicode : 'false'
  @sap.label : 'SUPLRMATLPLNT'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SuplrMatlPlnt : String(250) not null;
  @sap.unicode : 'false'
  @sap.label : 'Cliente'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ShipToParty : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'HIERARCHYNODELEVEL'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  HierarchyNodeLevel : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'PURCHASINGDOCUMENT'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurchasingDocument : String(15) not null;
  @sap.unicode : 'false'
  @sap.label : 'PURCHASINGDOCUMENTITEM'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurchasingDocumentItem : String(15) not null;
  @sap.unicode : 'false'
  @sap.label : 'Partita'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Batch : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Magazzino'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  StorageLocation : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'QUANTITÀ'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Quantity : Decimal(13, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Unità di misura di base'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  StockUnit : String(3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Categoria di documento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurchasingDocumentType : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'Luogo di spedizione proposto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProposedShippingPoint : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Tipo di movimento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  GoodsMovementType : String(3) not null;
  @odata.Type : 'Edm.Byte'
  @sap.unicode : 'false'
  @sap.label : 'PROCESSINGSTATUS'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProcessingStatus : Integer not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SubcontrgCockpitGoodsIss {
  @sap.unicode : 'false'
  @sap.label : 'Componente'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Material : String(40) not null;
  @sap.unicode : 'false'
  @sap.label : 'Divisione'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Plant : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Impegno'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Reservation : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Posizione impegno'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ReservationItem : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Fornitore'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Supplier : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Categoria di documento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurchasingDocumentType : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'SHIPMENTCOMPLETIONDATE'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ShipmentCompletionDate : String(8) not null;
  @sap.unicode : 'false'
  @sap.label : 'SUPLRMATLPLNT'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  SuplrMatlPlnt : String(250) not null;
  @sap.unicode : 'false'
  @sap.label : 'REQUIREDQUANTITY'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  RequiredQuantity : Decimal(13, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Dare/Avere'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DebitCreditCode : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'Tipo di movimento'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  GoodsMovementType : String(3) not null;
  @sap.unicode : 'false'
  @sap.label : 'HIERARCHYNODELEVEL'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  HierarchyNodeLevel : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'PROCESSINGSTATUS'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProcessingStatus : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Documento d''acquisto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurchasingDocument : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Posizione del documento d''acquisto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurchasingDocumentItem : String(5) not null;
  @sap.unicode : 'false'
  @sap.label : 'Partita'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Batch : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Magazzino'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  StorageLocation : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'QUANTITÀ'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Quantity : Decimal(13, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Unità di misura di base'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  StockUnit : String(3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Data del documento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DocumentDate : String(8) not null;
  @sap.unicode : 'false'
  @sap.label : 'Data di registrazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PostingDate : String(8) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per materiale'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_MassUpdtMaterialVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.label : 'Descr. materiale'
  @sap.quickinfo : 'Descrizione materiale'
  MaterialName : String(40);
  @sap.label : 'Nome divisione'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo merci'
  MaterialGroup : String(9);
  @sap.label : 'Descr. gruppo prod.'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  MaterialGroupName : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di materiale'
  MaterialType : String(4);
  @sap.label : 'Descr. tp. materiale'
  @sap.quickinfo : 'Definizione del tipo materiale'
  MaterialTypeName : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori gruppo unità di misura'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_MassUpdtUoMGrpVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureLongName'
  @sap.label : 'Gruppo unità misura'
  @sap.quickinfo : 'Gruppo unità di misura'
  key ProductUnitGroup : String(4) not null;
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  UnitOfMeasureLongName : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori gruppo materiali'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_MM_MaterialGroupValueHelp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialGroupName'
  @sap.label : 'Gruppo di prodotti'
  key MaterialGroup : String(9) not null;
  @sap.label : 'Testo gruppo di materiali'
  @sap.quickinfo : 'Descrizione del gruppo materiali'
  MaterialGroupText : String(60);
  @sap.label : 'Descrizione gruppo di prodotti'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  MaterialGroupName : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per materiale'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_MM_MaterialValueHelp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  @sap.value.list : 'standard'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale esterno'
  @sap.quickinfo : 'Rappresentazione esterna del codice materiale'
  ProductExternalID : String(40);
  @sap.label : 'Descr. materiale'
  @sap.quickinfo : 'Descrizione materiale'
  MaterialName : String(40);
  @sap.label : 'Nome divisione'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo di prodotti'
  MaterialGroup : String(9);
  @sap.label : 'Descr. gruppo prod.'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  MaterialGroupName : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di prodotto'
  MaterialType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gr. autorizzazioni'
  @sap.quickinfo : 'Gruppo autorizzazioni'
  AuthorizationGroup : String(4);
  @sap.label : 'Descr. tp materiale'
  @sap.quickinfo : 'Definizione del tipo materiale'
  MaterialTypeName : String(25);
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  MaterialBaseUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductTypeName'
  @sap.label : 'Gruppo tipi prodotto'
  ProductTypeCode : String(2);
  @sap.label : 'Descr. tipo di prodotto'
  @sap.quickinfo : 'Descrizione gruppo tipi prodotto'
  ProductTypeName : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori magazzino'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_MM_StorLocValueHelp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'StorageLocationName'
  @sap.label : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.label : 'Nome del magazzino'
  StorageLocationName : String(16);
  @sap.label : 'Nome divisione'
  PlantName : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori tipo di documento d''acquisto'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_MM_SubcontrgDocTypeVH {
  @sap.text : 'PurchasingDocumentTypeName'
  key PurchasingDocumentType : String(10) not null;
  @sap.label : 'Tipo di documento d''acquisto'
  PurchasingDocumentTypeName : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Fornitore'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_MM_SupplierValueHelp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'SupplierName'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  key Supplier : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Società'
  @sap.value.list : 'standard'
  key CompanyCode : String(4) not null;
  @sap.label : 'Nome del fornitore'
  SupplierName : String(80);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Chiave paese/regione'
  Country : String(3);
  @sap.label : 'Località'
  CityName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'CAP'
  @sap.quickinfo : 'Codice di avviamento postale della città'
  PostalCode : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Regione'
  @sap.quickinfo : 'Regione (stato federale, stato federato, provincia, contea)'
  Region : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Criterio di ricerca'
  @sap.quickinfo : 'Campo di classificazione'
  SortField : String(10);
  @sap.label : 'Nome'
  @sap.quickinfo : 'Nome del business partner (persona)'
  FirstName : String(40);
  @sap.label : 'Cognome'
  @sap.quickinfo : 'Cognome del business partner (persona)'
  LastName : String(40);
  @sap.label : 'Nome organizzazione 1'
  @sap.quickinfo : 'Nome 1 dell''organizzazione'
  OrganizationBPName1 : String(40);
  @sap.label : 'Nome organizzazione 2'
  @sap.quickinfo : 'Nome 2 dell''organizzazione'
  OrganizationBPName2 : String(40);
  @sap.label : 'Nome organizzazione 3'
  @sap.quickinfo : 'Nome 3 dell''organzizzazione'
  OrganizationBPName3 : String(40);
  @sap.label : 'Nome organizzazione 4'
  @sap.quickinfo : 'Nome 4 del''organizzazione'
  OrganizationBPName4 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autorizzazione'
  @sap.quickinfo : 'Gruppo di autorizzazione'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo di conti'
  @sap.quickinfo : 'Gruppo conti fornitori'
  SupplierAccountGroup : String(4);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.requires.filter : 'true'
@sap.content.version : '1'
@sap.label : 'Cockpit di lavorazione esterna'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_ProcmtDocSubcontrgHierarchy {
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialComponentName'
  @sap.label : 'Componente'
  @sap.quickinfo : 'Componente della distinta base'
  @sap.value.list : 'standard'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Divisione'
  @sap.value.list : 'standard'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SupplierName'
  @sap.label : 'Subfornitore'
  @sap.value.list : 'standard'
  key Supplier : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Impegno'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  key Reservation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Posizione impegno'
  key ReservationItem : String(4) not null;
  @sap.hierarchy.node.external.key.for : 'HierarchyNode'
  @sap.label : 'Divisione del materiale fornitore'
  SuplrMatlPlnt : String(250);
  ParentNode : String(250);
  MasterDataNode : String(250);
  ProdPlntSupplierConcatenatedID : String(250);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'true'
  @sap.label : 'Data di spedizione'
  RequestedDeliveryDate : Date;
  HierarchyNodeLevel : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Documento'
  @sap.value.list : 'standard'
  PurchasingDocument : String(10) not null;
  PurchasingDocumentItem : String(5) not null;
  @sap.label : 'Posizione del documento'
  FormattedPurchaseOrderItem : String(16) not null;
  @sap.text : 'ShippingStatusText'
  @sap.label : 'Stato spedizione'
  @sap.value.list : 'fixed-values'
  ShippingStatus : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Assemblaggio'
  @sap.value.list : 'standard'
  Assembly : String(40) not null;
  @sap.display.format : 'Date'
  @sap.label : 'Data di consegna subfornitore'
  ScheduleLineDeliveryDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo acquisti'
  @sap.value.list : 'standard'
  PurchasingGroup : String(3) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Organizzazione acquisti'
  @sap.value.list : 'standard'
  PurchasingOrganization : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partita'
  @sap.value.list : 'standard'
  Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rifornire divisione'
  SupplyingPlant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo merci'
  @sap.value.list : 'standard'
  MaterialGroup : String(9) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Magazzino'
  @sap.value.list : 'standard'
  StorageLocation : String(4) not null;
  @sap.unit : 'PurchaseOrderQuantityUnit'
  @sap.label : 'Quantità in sospeso'
  StillToBeDeliveredQuantity : Decimal(13, 3);
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  PurchaseOrderQuantityUnit : String(3);
  @sap.label : 'Quantità stock'
  StockBalanceQuantityUnit : String(50);
  StockUnit : String(50);
  @sap.label : 'Descr. materiale'
  @sap.quickinfo : 'Descrizione materiale'
  MaterialComponentName : String(40);
  @sap.label : 'Nome divisione'
  PlantName : String(30);
  @sap.label : 'Nome del fornitore'
  SupplierName : String(80);
  @sap.label : 'Descr. materiale'
  @sap.quickinfo : 'Descrizione materiale'
  AssemblyName : String(40);
  @sap.label : 'Descr. gruppo prod.'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  MaterialGroupName : String(20);
  @sap.label : 'Nome del magazzino'
  StorageLocationName : String(16);
  @sap.label : 'Nome divisione'
  SupplyingPlantName : String(30);
  ShippingStatusText : String(60) not null;
  @sap.label : 'Nome grp. acquisti'
  @sap.quickinfo : 'Nome gruppo acquisti'
  PurchasingGroupName : String(18);
  @sap.label : 'Nome org. acquisti'
  @sap.quickinfo : 'Nome organizzazione acquisti'
  PurchasingOrganizationName : String(20);
  PurchasingDocumentTypeName : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di consegna a subfornitore'
  @sap.value.list : 'standard'
  DeliveryType : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo carico'
  @sap.value.list : 'standard'
  LoadingGroup : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Luogo di spedizione proposto'
  @sap.value.list : 'standard'
  ProposedShippingPoint : String(4) not null;
  @sap.label : 'Conteggio'
  NumberOfItems : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di documento'
  @sap.value.list : 'fixed-values'
  PurchasingDocumentType : String(1) not null;
  @sap.unit : 'PurchaseOrderQuantityUnit'
  @sap.label : 'Quantità fabbisogno'
  RequiredQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Società'
  CompanyCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autorizzazione'
  @sap.quickinfo : 'Gruppo di autorizzazione'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo conti'
  @sap.quickinfo : 'Gruppo conti fornitori'
  SupplierAccountGroup : String(4);
  @sap.hierarchy.node.for : 'MasterDataNode'
  HierarchyNode : String(1333);
  @sap.hierarchy.parent.node.for : 'HierarchyNode'
  HierarchyParentNode : String(1333);
  @sap.hierarchy.level.for : 'HierarchyNode'
  HierarchyLevel : Integer;
  @sap.hierarchy.node.descendant.count.for : 'HierarchyNode'
  HierarchyNodeTreeSize : Integer;
  @sap.hierarchy.drill.state.for : 'HierarchyNode'
  HierarchyDrillState : String(22);
  @sap.hierarchy.preorder.rank.for : 'HierarchyNode'
  HierarchyNodeOrdinalNumber : Integer;
  HierarchyParentNodeOrdinalNmbr : Integer;
  @odata.Type : 'Edm.Byte'
  HierarchyNodeIsOrphan : Integer;
  @odata.Type : 'Edm.Byte'
  HierarchyNodeIsCycleEndPoint : Integer;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.semantics : 'aggregate'
@sap.label : 'View CDS per i calcoli dello stock'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_ProcmtDocSubcontrgStkBal {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  MaterialComponent : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  Plant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  Subcontractor : String(10);
  @sap.aggregation.role : 'dimension'
  SuplrMatlPlnt : String(250);
  @sap.aggregation.role : 'measure'
  @sap.filterable : 'false'
  StockBalanceQuantityUnit : Decimal(19, 3);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  StockUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.label : 'Quantità fabbisogno'
  @sap.filterable : 'false'
  SubcontractorStkInStockUnit : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.filterable : 'false'
  SubcontractorDelivsInStockUnit : Decimal(14, 3);
  @sap.aggregation.role : 'measure'
  @sap.filterable : 'false'
  StkTransfResvnInStockUnit : Decimal(14, 3);
  @sap.aggregation.role : 'measure'
  @sap.filterable : 'false'
  PndgOutbDelivQtyInStockUnit : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.filterable : 'false'
  SubcontrgPurOrdInStockUnit : Decimal(14, 3);
  @sap.aggregation.role : 'measure'
  @sap.filterable : 'false'
  SubcontrgSchedgAgrmtInStkUnit : Decimal(14, 3);
  @sap.aggregation.role : 'measure'
  @sap.filterable : 'false'
  SubcontrgPurReqnInStockUnit : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'P7F39220B76A201D6BB8F0A75E59B1F1F'
  @sap.filterable : 'false'
  UnrestrictedStkInStkUnit : Decimal(13, 3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori divisione di approvvigionamento'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_ProcmtMassUpdtPlantVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.label : 'Nome divisione'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Area valorizzazione'
  ValuationArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'N. cliente della divisione'
  @sap.quickinfo : 'Cd.cliente della divisione'
  @sap.value.list : 'standard'
  PlantCustomer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice fornitore della divisione'
  @sap.value.list : 'standard'
  PlantSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calendario fabbrica'
  @sap.quickinfo : 'Chiave calendario di fabbrica'
  FactoryCalendar : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Organizzazione acquisti'
  DefaultPurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org.comm. fatt. int.'
  @sap.quickinfo : 'Organizzazione commerciale per fatturazione interna'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indirizzo'
  AddressID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Categoria divisione'
  @sap.quickinfo : 'Cat. div.'
  PlantCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Canale di distribuzione'
  @sap.quickinfo : 'Canale di distribuzione per fatturazione interna'
  DistributionChannel : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per gruppo acquisti'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_PurchasingGroupValueHelp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PurchasingGroupName'
  @sap.label : 'Gruppo acquisti'
  key PurchasingGroup : String(3) not null;
  @sap.label : 'Nome grp. acquisti'
  @sap.quickinfo : 'Nome gruppo acquisti'
  PurchasingGroupName : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Numero di telefono del gruppo acquisti'
  @sap.quickinfo : 'Numero di telefono del gruppo acquisti (gruppo acquirenti)'
  PurchasingGroupPhoneNumber : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Numero di telefono con prefisso'
  @sap.quickinfo : 'Numero di telefono: prefisso e numero'
  PhoneNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Interno'
  @sap.quickinfo : 'Numero di telefono: interno'
  PhoneNumberExtension : String(10);
  @sap.label : 'Fax'
  @sap.quickinfo : 'N. telefax del gruppo acquirenti'
  FaxNumber : String(31);
  @sap.label : 'Indirizzo e-mail'
  @sap.semantics : 'email'
  EmailAddress : String(241);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Organizzazione acquisti'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_PurchasingOrgValueHelp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PurchasingOrganizationName'
  @sap.label : 'Organizzazione acquisti'
  key PurchasingOrganization : String(4) not null;
  @sap.label : 'Nome organizzazione acquisti'
  PurchasingOrganizationName : String(20);
  @sap.display.format : 'UpperCase'
  @sap.text : 'CompanyCodeName'
  @sap.label : 'Società'
  CompanyCode : String(4);
  @sap.label : 'Nome società'
  @sap.quickinfo : 'Definizione della società o della ditta'
  CompanyCodeName : String(25);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Validità'
  @sap.quickinfo : 'Identificazione di inserimenti obsoleti'
  ConfigDeprecationCode : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori partita'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgBatchVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partita'
  @sap.quickinfo : 'Numero partita'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'Crea consegna'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitDeliverySet {
  @sap.display.format : 'Date'
  @sap.label : 'Data di spedizione'
  key P_ReqdDelivDteRngeFrmDte : Date not null;
  @sap.display.format : 'Date'
  @sap.label : 'Data di spedizione'
  key P_ReqdDelivDteRngeToDte : Date not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Supplier : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  @sap.quickinfo : 'Componente della distinta base'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Impegno'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  key Reservation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Posizione impegno'
  key ReservationItem : String(4) not null;
  SuplrMatlPlnt : String(250);
  HierarchyNodeLevel : String(1);
  @sap.label : 'Documento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchasingDocument : String(15);
  @sap.label : 'Posizione del documento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchasingDocumentItem : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partita'
  @sap.quickinfo : 'Numero partita'
  Batch : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Magazzino'
  StorageLocation : String(4);
  @sap.unit : 'StockUnit'
  @sap.label : 'Quantità in sospeso'
  Quantity : Decimal(13, 3);
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  StockUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. doc. acquisti'
  @sap.quickinfo : 'Categoria documento acquisti'
  PurchasingDocumentType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Luogo di spedizione'
  @sap.quickinfo : 'Luogo di spedizione proposto'
  ProposedShippingPoint : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo movimento'
  @sap.quickinfo : 'Tipo movimento (gestione stock)'
  GoodsMovementType : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di valutazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InventoryValuationType : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tp.cons.lav.esterna'
  @sap.quickinfo : 'Tipo di consegna per materiali da fornire per lav. esterna'
  DeliveryType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cliente'
  @sap.quickinfo : 'Codice cliente'
  ShipToParty : String(10);
  ShipmentCompletionDate : String(8);
  @sap.unit : 'StockUnit'
  RequiredQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indic. dare/avere'
  @sap.quickinfo : 'Indicatore dare/avere'
  DebitCreditCode : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo carico'
  LoadingGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cond. spedizione'
  @sap.quickinfo : 'Condizioni di spedizione'
  ShippingCondition : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org. commerciale'
  @sap.quickinfo : 'Organizzazione commerciale'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Canale distribuzione'
  @sap.quickinfo : 'Canale di distribuzione'
  DistributionChannel : String(2);
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Stato di elaborazione'
  ProcessingStatus : Integer;
  @sap.filterable : 'false'
  Parameters : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitDelivery {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.content.version : '1'
@sap.semantics : 'parameters'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitDelivery {
  @sap.display.format : 'Date'
  @sap.parameter : 'mandatory'
  @sap.label : 'Data di spedizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key P_ReqdDelivDteRngeFrmDte : Date not null;
  @sap.display.format : 'Date'
  @sap.parameter : 'mandatory'
  @sap.label : 'Data di spedizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key P_ReqdDelivDteRngeToDte : Date not null;
  Set : Association to many MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitDeliverySet {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'Registra uscita merci'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitGoodsIssSet {
  @sap.display.format : 'Date'
  @sap.label : 'Data di spedizione'
  key P_ReqdDelivDteRngeFrmDte : Date not null;
  @sap.display.format : 'Date'
  @sap.label : 'Data di spedizione'
  key P_ReqdDelivDteRngeToDte : Date not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  @sap.quickinfo : 'Componente della distinta base'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Supplier : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Impegno'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  key Reservation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Posizione impegno'
  key ReservationItem : String(4) not null;
  SuplrMatlPlnt : String(250);
  HierarchyNodeLevel : String(1);
  @sap.label : 'Documento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchasingDocument : String(15);
  @sap.label : 'Posizione del documento'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchasingDocumentItem : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partita'
  @sap.quickinfo : 'Numero partita'
  Batch : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Magazzino'
  StorageLocation : String(4);
  @sap.unit : 'StockUnit'
  @sap.label : 'Quantità in sospeso'
  Quantity : Decimal(13, 3);
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  StockUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. doc. acquisti'
  @sap.quickinfo : 'Categoria documento acquisti'
  PurchasingDocumentType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo movimento'
  @sap.quickinfo : 'Tipo movimento (gestione stock)'
  GoodsMovementType : String(3);
  ShipmentCompletionDate : String(8);
  @sap.unit : 'StockUnit'
  RequiredQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indic. dare/avere'
  @sap.quickinfo : 'Indicatore dare/avere'
  DebitCreditCode : String(1);
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Stato di elaborazione'
  ProcessingStatus : Integer;
  @sap.filterable : 'false'
  Parameters : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitGoodsIss {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.content.version : '1'
@sap.semantics : 'parameters'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitGoodsIss {
  @sap.display.format : 'Date'
  @sap.parameter : 'mandatory'
  @sap.label : 'Data di spedizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key P_ReqdDelivDteRngeFrmDte : Date not null;
  @sap.display.format : 'Date'
  @sap.parameter : 'mandatory'
  @sap.label : 'Data di spedizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key P_ReqdDelivDteRngeToDte : Date not null;
  Set : Association to many MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgCockpitGoodsIssSet {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per tipo di consegna a lavorazione esterna'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgDeliveryTypeVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. doc. acquisti'
  @sap.quickinfo : 'Categoria documento acquisti'
  key PurchasingDocumentCategory : String(1) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo doc. d''acquisto'
  @sap.quickinfo : 'Tipo di documento d''acquisto'
  key PurchasingDocumentType : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Div. fornitrice'
  @sap.quickinfo : 'Divisione fornitrice nell''ordine di trasporto'
  key SupplyingPlant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tp.cons.lav.esterna'
  @sap.quickinfo : 'Tipo di consegna per materiali da fornire per lav. esterna'
  DeliveryType : String(4);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per tipo di movimento merci'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgGoodsMvtTypeVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'GoodsMovementTypeName'
  @sap.label : 'Tipo movimento'
  @sap.quickinfo : 'Tipo movimento (gestione stock)'
  key GoodsMovementType : String(3) not null;
  @sap.label : 'Testo tipi movimento'
  @sap.quickinfo : 'Testo rel. al tipo movimento (gestione stock)'
  GoodsMovementTypeName : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per gruppo di carico'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgLoadingGroupVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  key Product : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo carico'
  LoadingGroup : String(4);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Ordini lavorazione esterna in ritardo'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgOrderOverDue {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Impegno'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  key Reservation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Posizione'
  @sap.quickinfo : 'Numero posizione dell''impegno / del fabbisogno dipendente'
  key ReservationItem : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key MaterialComponent : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  key Subcontractor : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Schedulazione'
  @sap.quickinfo : 'Contatore sched.'
  key ScheduleLine : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Documento d''acquisto'
  @sap.quickinfo : 'Numero del documento acquisti'
  PurchaseOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Posizione'
  @sap.quickinfo : 'Numero posizione documento d''acquisto'
  PurchaseOrderItem : String(5);
  @sap.display.format : 'NonNegative'
  ShippingStatus : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per luogo di spedizione proposto'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgPrpsdShipgPtVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cond. spedizione'
  @sap.quickinfo : 'Condizioni di spedizione'
  key ShippingCondition : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo carico'
  key LoadingGroup : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Luogo sped. proposto'
  @sap.quickinfo : 'Luogo di spedizione proposto'
  ProposedShippingPoint : String(4);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per documento d''acquisto'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgPurchasingDocVH {
  @sap.label : 'Documento'
  key PurchasingDocument : String(15) not null;
  @sap.label : 'Posizione del documento'
  key PurchasingDocumentItem : String(5) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Impegno'
  @sap.quickinfo : 'Numero dell''impegno / del fabbisogno dipendente'
  key Reservation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Posizione'
  @sap.quickinfo : 'Numero posizione dell''impegno / del fabbisogno dipendente'
  key ReservationItem : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di record'
  key RecordType : String(1) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Documento d''acquisto'
  @sap.quickinfo : 'Numero del documento acquisti'
  PurchaseOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. documento acq.'
  @sap.quickinfo : 'Categoria documento d''acquisto'
  PurchasingDocumentType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  Supplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo acquisti'
  PurchasingGroup : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Società'
  CompanyCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice canc.'
  @sap.quickinfo : 'Indicatore di cancellazione nel documento acquisti'
  PurchasingDocumentDeletionCode : String(1);
  @sap.label : 'Rilevante per ril.'
  @sap.quickinfo : 'Rilascio incompleto'
  ReleaseIsNotCompleted : Boolean;
  @sap.label : 'Incompleto'
  @sap.quickinfo : 'Ordine d''acquisto non ancora completo'
  PurchasingCompletenessStatus : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo tipi prodotto'
  ProductType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prestatore servizi'
  @sap.quickinfo : 'Prestatore di servizi'
  ServicePerformer : String(10);
  @sap.label : 'Consegna completata'
  @sap.quickinfo : 'Codice di consegna finale'
  IsCompletelyDelivered : Boolean;
  @sap.label : 'Fattura finale'
  @sap.quickinfo : 'Codice fattura finale'
  IsFinallyInvoiced : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org. acquisti'
  @sap.quickinfo : 'Organizzazione acquisti'
  PurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo movimento'
  @sap.quickinfo : 'Tipo movimento (gestione stock)'
  GoodsMovementType : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per stato della spedizione'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.C_SubcontrgShipgStsVH {
  @sap.text : 'ShippingStatusText'
  key ShippingStatus : String(10) not null;
  @sap.label : 'Stato spedizione'
  ShippingStatusText : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Società'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.I_CompanyCodeStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'CompanyCodeName'
  @sap.label : 'Società'
  key CompanyCode : String(4) not null;
  @sap.label : 'Nome società'
  @sap.quickinfo : 'Definizione della società o della ditta'
  CompanyCodeName : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Cliente'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.I_Customer_VH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BPCustomerName'
  @sap.label : 'Cliente'
  @sap.quickinfo : 'Codice cliente'
  key Customer : String(10) not null;
  @sap.label : 'Nome cliente 1'
  @sap.quickinfo : 'Nome 1'
  OrganizationBPName1 : String(35);
  @sap.label : 'Nome business partner 1'
  @sap.quickinfo : 'Nome 1'
  BusinessPartnerName1 : String(40);
  @sap.label : 'Nome cliente 2'
  @sap.quickinfo : 'Nome 2'
  OrganizationBPName2 : String(35);
  @sap.label : 'Nome business partner 2'
  @sap.quickinfo : 'Nome 2'
  BusinessPartnerName2 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Paese/Regione'
  @sap.quickinfo : 'Chiave paese/regione'
  Country : String(3);
  @sap.label : 'Città'
  CityName : String(35);
  @sap.label : 'Indirizzo business partner - città'
  @sap.quickinfo : 'Località'
  BPAddrCityName : String(40);
  @sap.label : 'Via'
  @sap.quickinfo : 'Via e numero civico'
  StreetName : String(35);
  @sap.label : 'Indirizzo business partner - via'
  @sap.quickinfo : 'Via'
  BPAddrStreetName : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice di avviamento postale'
  PostalCode : String(10);
  @sap.label : 'Nome del cliente'
  CustomerName : String(80);
  @sap.label : 'Nome del cliente business partner'
  @sap.quickinfo : 'Nome del cliente'
  BPCustomerName : String(81);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo conti'
  @sap.quickinfo : 'Gruppo conti cliente'
  CustomerAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autorizzazione'
  @sap.quickinfo : 'Gruppo di autorizzazione'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indicatore scopo raggiunto'
  @sap.quickinfo : 'Indicatore per obiettivo commerciale raggiunto'
  IsBusinessPurposeCompleted : String(1);
  @sap.label : 'Concorrente'
  @sap.quickinfo : 'Codice: concorrente'
  IsCompetitor : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business partner'
  @sap.quickinfo : 'Numero business partner'
  BusinessPartner : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di business partner'
  @sap.quickinfo : 'Tipo business partner'
  BusinessPartnerType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Imp. TitTrattDt'
  @sap.quickinfo : 'BP: indicatore per impostare i titolari del trattamento dati'
  DataControllerSet : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController1 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController2 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController3 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController4 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController5 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController6 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController7 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController8 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController9 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController10 : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Materiale'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.I_MaterialStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Material_Text'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.label : 'Descr. materiale'
  @sap.quickinfo : 'Descrizione materiale'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Material_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Fornitore'
@sap.value.list : 'true'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.I_Supplier_VH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BPSupplierName'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  key Supplier : String(10) not null;
  @sap.label : 'Nome del fornitore 1'
  @sap.quickinfo : 'Nome del fornitore'
  SupplierName : String(35);
  @sap.label : 'Nome business partner 1'
  BusinessPartnerName1 : String(40);
  @sap.label : 'Nome del fornitore business partner'
  @sap.quickinfo : 'Nome del fornitore'
  BPSupplierName : String(81);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autorizzazione'
  @sap.quickinfo : 'Gruppo di autorizzazione'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo conti'
  @sap.quickinfo : 'Gruppo conti fornitori'
  SupplierAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Obiettivo raggiunto'
  @sap.quickinfo : 'Indicatore per obiettivo commerciale raggiunto'
  IsBusinessPurposeCompleted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business partner'
  @sap.quickinfo : 'Numero business partner'
  BusinessPartner : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di business partner'
  @sap.quickinfo : 'Tipo business partner'
  BusinessPartnerType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Imp. TitTrattDt'
  @sap.quickinfo : 'BP: indicatore per impostare i titolari del trattamento dati'
  DataControllerSet : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController1 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController2 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController3 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController4 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController5 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController6 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController7 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController8 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController9 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tit. tratt. dei dati'
  @sap.quickinfo : 'BP: titolare del trattamento dati (solo utilizzo interno)'
  DataController10 : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Unità di misura'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.I_UnitOfMeasureStdVH {
  @sap.text : 'UnitOfMeasureLongName'
  @sap.label : 'Unità di misura'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  UnitOfMeasureLongName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureDimensionName'
  @sap.label : 'Dimensione'
  @sap.quickinfo : 'Chiave dimensione'
  UnitOfMeasureDimension : String(6);
  @sap.label : 'Testo dimensione'
  UnitOfMeasureDimensionName : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__Currencies {
  @sap.label : 'Divisa'
  @sap.semantics : 'currency-code'
  key CurrencyCode : String(5) not null;
  @sap.label : 'Codice ISO'
  ISOCode : String(3) not null;
  @sap.label : 'Testo breve'
  Text : String(15) not null;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Decimali'
  DecimalPlaces : Integer not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__UnitsOfMeasure {
  @sap.label : 'Unità misura interna'
  @sap.semantics : 'unit-of-measure'
  key UnitCode : String(3) not null;
  @sap.label : 'Cd. ISO'
  ISOCode : String(3) not null;
  @sap.label : 'Commerciale'
  ExternalCode : String(3) not null;
  @sap.label : 'Testo UM'
  Text : String(30) not null;
  @sap.label : 'Decimali'
  DecimalPlaces : Integer;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__MyDocumentDescriptions {
  @sap.label : 'UUID'
  key Id : UUID not null;
  CreatedBy : String(12) not null;
  @odata.Type : 'Edm.DateTime'
  @sap.label : 'Timestamp'
  CreatedAt : DateTime not null;
  FileName : String(256) not null;
  Title : String(256) not null;
  Format : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__FormatSet {  };
  TableColumns : Association to many MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__TableColumnsSet {  };
  CoverPage : Association to many MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__CoverPageSet {  };
  Signature : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__SignatureSet {  };
  PDFStandard : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__PDFStandardSet {  };
  Hierarchy : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HierarchySet {  };
  Header : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__PDFHeaderSet {  };
  Footer : Association to MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__PDFFooterSet {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__FormatSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  FitToPage : MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__FitToPage not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FontSize : Integer not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Orientation : String(10) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PaperSize : String(10) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  BorderSize : Integer not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MarginSize : Integer not null;
  @sap.label : 'Font Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FontName : String(255) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Padding : Integer not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__PDFStandardSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  UsePDFAConformance : Boolean not null;
  @sap.label : 'Indicatore'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DoEnableAccessibility : Boolean not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__TableColumnsSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Name : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Header : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  HorizontalAlignment : String(10) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__CoverPageSet {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Title : String(256) not null;
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Name : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Value : String(256) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__SignatureSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.label : 'Indicatore'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DoSign : Boolean not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Reason : String(256) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HierarchySet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DistanceFromRootElement : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DrillStateElement : String(256) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__PDFHeaderSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  Right : MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HeaderFooterField not null;
  Left : MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HeaderFooterField not null;
  Center : MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HeaderFooterField not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__PDFFooterSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  Right : MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HeaderFooterField not null;
  Left : MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HeaderFooterField not null;
  Center : MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HeaderFooterField not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__ValueHelpSet {
  key VALUEHELP : LargeString not null;
  FIELD_VALUE : String(10) not null;
  DESCRIPTION : LargeString;
};

@cds.external : true
type MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__FitToPage {
  @sap.label : 'Error behavior'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ErrorRecoveryBehavior : String(8) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  IsEnabled : Boolean not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MinimumFontSize : Integer not null;
};

@cds.external : true
type MM_PUR_SUBCONTRACTING_COCKPIT_SRV.SAP__HeaderFooterField {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Type : String(256) not null;
};
