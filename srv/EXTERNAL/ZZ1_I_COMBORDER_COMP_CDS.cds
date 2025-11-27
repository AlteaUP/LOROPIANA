/* checksum : ece21a35f4b63c9259d58c8d4c2ad8f9 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_COMBORDER_COMP_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Tipo lista assortimento'
entity ZZ1_I_COMBORDER_COMP_CDS.I_AssortmentListType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'AssortmentListType_Text'
  @sap.label : 'Tipo lista assort.'
  @sap.quickinfo : 'Tipo lista assortimento'
  key AssortmentListType : String(1) not null;
  @sap.label : 'Descrizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AssortmentListType_Text : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Marca'
entity ZZ1_I_COMBORDER_COMP_CDS.I_Brand {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Brand_Text'
  @sap.label : 'Marca'
  key Brand : String(4) not null;
  @sap.label : 'Definizione marche'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Brand_Text : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Settore merceologico'
entity ZZ1_I_COMBORDER_COMP_CDS.I_Division {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Division_Text'
  @sap.label : 'Settore merceologico'
  key Division : String(2) not null;
  @sap.label : 'Descrizione settore merceologico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Division_Text : String(20);
  @sap.label : 'ID ogg. sett. merc.'
  @sap.quickinfo : 'ID oggetto settore merceologico'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DivisionOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Gruppo prodotti esterno'
entity ZZ1_I_COMBORDER_COMP_CDS.I_ExtProdGrp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ExternalProductGroup_Text'
  @sap.label : 'Gruppo prod. esterni'
  @sap.quickinfo : 'Gruppo prodotti esterno'
  key ExternalProductGroup : String(18) not null;
  @sap.label : 'Descr. gr. prod. est'
  @sap.quickinfo : 'Descrizione gruppo prodotti esterni'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExternalProductGroup_Text : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Categoria codice EAN'
entity ZZ1_I_COMBORDER_COMP_CDS.I_Intntnlartnmbcat {
  @sap.display.format : 'UpperCase'
  @sap.text : 'InternationalArticleNumberCat_Text'
  @sap.label : 'Categoria GTIN'
  @sap.quickinfo : 'Categoria di Global Trade Item Number (GTIN)'
  key InternationalArticleNumberCat : String(2) not null;
  @sap.label : 'Def. tipo numero'
  @sap.quickinfo : 'Definizione tipo numero'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InternationalArticleNumberCat_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Raggruppamento categorie posizione'
entity ZZ1_I_COMBORDER_COMP_CDS.I_ItemCategoryGroup {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ItemCategoryGroup_Text'
  @sap.label : 'Gruppo cat. pos.'
  @sap.quickinfo : 'Raggruppamento categorie pos. da anagrafica del materiale'
  key ItemCategoryGroup : String(4) not null;
  @sap.label : 'Descrizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemCategoryGroup_Text : String(20);
  @sap.label : 'ID ogg. gr. CatPos'
  @sap.quickinfo : 'ID oggetto per gruppo categoria di posizione'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ItemCategoryGroupOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Tipo categoria di prodotto'
entity ZZ1_I_COMBORDER_COMP_CDS.I_ProductCategory {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductCategory_Text'
  @sap.label : 'Categoria prodotto'
  @sap.quickinfo : 'Categoria di prodotto'
  key ProductCategory : String(2) not null;
  @sap.label : 'Testo per categoria di prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategory_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Gruppo di prodotti'
entity ZZ1_I_COMBORDER_COMP_CDS.I_ProductGroup_2 {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductGroup_Text'
  @sap.label : 'Gruppo di prodotti'
  key ProductGroup : String(9) not null;
  @sap.label : 'Descrizione gruppo di prodotti'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductGroup_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ProductValuationClass/ValuationClass_Text'
  @sap.label : 'Classe di valor.'
  @sap.value.list : 'standard'
  ValuationClass : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ch. valori acquisto'
  @sap.quickinfo : 'Chiave valori d''acquisto'
  @sap.value.list : 'standard'
  PurchasingAcknProfile : String(4);
  to_ProductValuationClass : Association to ZZ1_I_COMBORDER_COMP_CDS.I_Prodvaluationclass {  };
  to_PurgAcknowledgmentProfile : Association to ZZ1_I_COMBORDER_COMP_CDS.I_PurgAcknowledgmentProfile {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Stato prodotto valido per tutte le divisioni'
entity ZZ1_I_COMBORDER_COMP_CDS.I_ProductStatus {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Status_Text'
  @sap.label : 'Stato prodotto'
  @sap.quickinfo : 'Stato del prodotto spec. della divisione'
  key Status : String(2) not null;
  @sap.label : 'Tst st. val. tutte div.'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Status_Text : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Help valori per prodotto'
@sap.value.list : 'true'
entity ZZ1_I_COMBORDER_COMP_CDS.I_ProductStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Product_Text'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  key Product : String(40) not null;
  @sap.label : 'Descrizione prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Product_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ID prodotto esterno'
  @sap.quickinfo : 'Rappresentazione esterna del codice materiale'
  ProductExternalID : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Tipo di prodotto'
entity ZZ1_I_COMBORDER_COMP_CDS.I_Producttype {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductType_Text'
  @sap.label : 'Tipo di prodotto'
  key ProductType : String(4) not null;
  @sap.label : 'Descrizione tipo di prodotto'
  @sap.quickinfo : 'Descrizione del tipo di prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductType_Text : String(25);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ProductTypeCode/ProductTypeCode_Text'
  @sap.label : 'Gruppo tipi prodotto'
  @sap.value.list : 'standard'
  ProductTypeCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Grp. autorizzazione'
  @sap.quickinfo : 'Gruppo autorizzazione nell''anagrafica materiale'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato aggiornamento'
  MaintenanceStatus : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo mater. modello'
  @sap.quickinfo : 'Tipo materiale modello'
  ReferenceProductType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rif. classi conto'
  @sap.quickinfo : 'Riferimento classi conto'
  AcctCategoryRef : String(4);
  to_ProductTypeCode : Association to ZZ1_I_COMBORDER_COMP_CDS.I_ProductTypeCode {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Codice tipo di prodotto'
entity ZZ1_I_COMBORDER_COMP_CDS.I_ProductTypeCode {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductTypeCode_Text'
  @sap.label : 'Gruppo tipi prodotto'
  key ProductTypeCode : String(2) not null;
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione gruppo tipi prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductTypeCode_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Classe di valorizzazione'
entity ZZ1_I_COMBORDER_COMP_CDS.I_Prodvaluationclass {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ValuationClass_Text'
  @sap.label : 'Classe di valor.'
  key ValuationClass : String(4) not null;
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Definizione della classe di valorizzazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ValuationClass_Text : String(25);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rif. classi conto'
  @sap.quickinfo : 'Riferimento classi conto'
  AcctCategoryRef : String(4);
  @sap.label : 'Data Element for Product Valuation Class OID'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductValuationClassOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Profilo di riconoscimento acquisti'
entity ZZ1_I_COMBORDER_COMP_CDS.I_PurgAcknowledgmentProfile {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ch. valori acquisto'
  @sap.quickinfo : 'Chiave valori d''acquisto'
  key PurchasingAcknProfile : String(4) not null;
  @sap.label : 'Elemento dati per OID profilo conferma acquisto'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PurgAcknowledgmentProfileOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Unità di misura'
entity ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {
  @sap.text : 'UnitOfMeasure_Text'
  @sap.label : 'Unità di misura'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasure_Text : String(30);
  @sap.label : 'Codice SAP interno'
  @sap.quickinfo : 'Unità di misura, codice SAP interno (senza conversione)'
  UnitOfMeasureSAPCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ISOCode/UnitOfMeasureISOCode_Text'
  @sap.label : 'Cd. ISO'
  @sap.quickinfo : 'Codice ISO unità di misura'
  @sap.value.list : 'standard'
  UnitOfMeasureISOCode : String(3);
  @sap.label : 'Cd. primario'
  @sap.quickinfo : 'Campo di marcatura per conversione cd. ISO in cd. int.'
  IsPrimaryUnitForISOCode : Boolean;
  @sap.label : 'Arrotond. decimali'
  @sap.quickinfo : 'Numero di decimali da arrotondare'
  UnitOfMeasureNumberOfDecimals : Integer;
  @sap.label : 'Utà commerciale'
  @sap.quickinfo : 'Codice unità di misura commerciale'
  UnitOfMeasureIsCommercial : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Dimension/UnitOfMeasureDimension_Text'
  @sap.label : 'Dimensione'
  @sap.quickinfo : 'Chiave dimensione'
  @sap.value.list : 'standard'
  UnitOfMeasureDimension : String(6);
  @sap.label : 'Contatore'
  @sap.quickinfo : 'Numeratore per la conversione in unità SI'
  SIUnitCnvrsnRateNumerator : Integer;
  @sap.label : 'Denominatore'
  @sap.quickinfo : 'Denominatore per la conversione in unità SI'
  SIUnitCnvrsnRateDenominator : Integer;
  @sap.label : 'Esponente'
  @sap.quickinfo : 'Esponente alla decima per la conversione in unità SI'
  SIUnitCnvrsnRateExponent : Integer;
  @sap.label : 'Costante aggiuntiva'
  @sap.quickinfo : 'Costante aggiuntiva per conversione in unità SI'
  SIUnitCnvrsnAdditiveValue : Decimal(9, 6);
  @sap.label : 'Esp. virgola mobile'
  @sap.quickinfo : 'Esponente alla 10a per rappresentazione virgola mobile'
  UnitOfMeasureDspExponent : Integer;
  @sap.label : 'Decimali'
  @sap.quickinfo : 'Numero di decimali nella rappresentazione numerica'
  UnitOfMeasureDspNmbrOfDcmls : Integer;
  @sap.unit : 'UnitOfMeasureTemperatureUnit'
  @sap.label : 'Val. temper.'
  @sap.quickinfo : 'Valore temperatura'
  UnitOfMeasureTemperature : Double;
  @sap.label : 'Unità temperatura'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasureTemperatureUnit : String(3);
  @sap.unit : 'UnitOfMeasurePressureUnit'
  @sap.label : 'Valore pressione'
  UnitOfMeasurePressure : Double;
  @sap.label : 'Unità pressione'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasurePressureUnit : String(3);
  to_Dimension : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasureDimension {  };
  to_ISOCode : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasureISOCode {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Dimensione dell''unità di misura'
entity ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasureDimension {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureDimension_Text'
  @sap.label : 'Dimensione'
  @sap.quickinfo : 'Chiave dimensione'
  key UnitOfMeasureDimension : String(6) not null;
  @sap.label : 'Testo dimensione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasureDimension_Text : String(20);
  @sap.label : 'Lunghezza'
  @sap.quickinfo : 'Esponente lunghezza'
  LengthExponent : Integer;
  @sap.label : 'Massa'
  @sap.quickinfo : 'Esponente massa'
  MassExponent : Integer;
  @sap.label : 'Ora'
  @sap.quickinfo : 'Esponente temporale'
  TimeExponent : Integer;
  @sap.label : 'Amp. elettrico'
  @sap.quickinfo : 'Esponente per l''amperaggio elettrico'
  ElectricCurrentExponent : Integer;
  @sap.label : 'Temperatura'
  @sap.quickinfo : 'Esponente temperatura'
  TemperatureExponent : Integer;
  @sap.label : 'Quantità molecolare'
  @sap.quickinfo : 'Esponente per la quantità molecolare'
  MoleQuantityExponent : Integer;
  @sap.label : 'Intensità luminosa'
  @sap.quickinfo : 'Esponente intensità luminosa'
  LuminosityExponent : Integer;
  @sap.label : 'Unità SI'
  @sap.semantics : 'unit-of-measure'
  UnitOFMeasureSiUnit : String(3);
  @sap.label : 'Dip. da temperatura'
  @sap.quickinfo : 'Ind. ''esistono anche unità con indic. temp. per dimensione'''
  HasUnitsWithTemperatureSpec : Boolean;
  @sap.label : 'Dipendente da press.'
  @sap.quickinfo : 'Ind. ''per la dimensione esistono unità con valori pressione'''
  HasUnitsWithPressureSpec : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Unità di misura - codice ISO'
entity ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasureISOCode {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UnitOfMeasureISOCode_Text'
  @sap.label : 'Cd. ISO'
  @sap.quickinfo : 'Codice ISO unità di misura'
  key UnitOfMeasureISOCode : String(3) not null;
  @sap.label : 'Cd. ISO'
  @sap.quickinfo : 'Codici ISO definizione unità di misura'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasureISOCode_Text : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_C_PRODUCT'
entity ZZ1_I_COMBORDER_COMP_CDS.ZZ1_C_PRODUCT {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'Product_Text'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  key Product : String(40) not null;
  @sap.label : 'Descrizione prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Product_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Rappresentazione esterna del codice materiale'
  ProductExternalID : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'OID prodotto'
  @sap.quickinfo : 'Elemento dati per OID di prodotto'
  ProductOID : String(128);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ProductType_Text'
  @sap.label : 'Tipo di prodotto'
  @sap.value.list : 'standard'
  ProductType : String(4);
  @sap.label : 'Descrizione tipo di prodotto'
  @sap.quickinfo : 'Descrizione del tipo di prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductType_Text : String(25);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Creato il'
  @sap.quickinfo : 'Data creazione'
  CreationDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Ora di creazione'
  CreationTime : Time;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.required.in.filter : 'false'
  @sap.label : 'Data cr.'
  @sap.quickinfo : 'Data di creazione del prodotto'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Autore'
  @sap.quickinfo : 'Nome del responsabile che ha aggiunto l''oggetto'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ultima modifica'
  @sap.quickinfo : 'Data dell''ultima modifica'
  LastChangeDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Autore modifica'
  @sap.quickinfo : 'Nome dell''utente autore della modifica oggetto'
  LastChangedByUser : String(12);
  @sap.required.in.filter : 'false'
  @sap.label : 'Marc. per elim.'
  @sap.quickinfo : 'Indicatore di eliminazione'
  IsMarkedForDeletion : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'CrossPlantStatus_Text'
  @sap.label : 'St.prod.val.per div.'
  @sap.quickinfo : 'Stato prodotto val. per tutte divisioni'
  @sap.value.list : 'standard'
  CrossPlantStatus : String(2);
  @sap.label : 'Tst st. val. tutte div.'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CrossPlantStatus_Text : String(25);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Inizio validità'
  @sap.quickinfo : 'Data inizio validità stato mat. valido per tutte le div.'
  CrossPlantStatusValidityDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cd. prodotto prec.'
  @sap.quickinfo : 'Codice prodotto precedente'
  ProductOldID : String(40);
  @sap.required.in.filter : 'false'
  @sap.unit : 'WeightUnit'
  @sap.label : 'Peso lordo'
  GrossWeight : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'UM ordine d''acquisto'
  @sap.quickinfo : 'UM dell''ordine d''acquisto'
  @sap.semantics : 'unit-of-measure'
  PurchaseOrderQuantityUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Fonte d''acquisto'
  @sap.quickinfo : 'Fonte acquisto'
  SourceOfSupply : String(1);
  @sap.required.in.filter : 'false'
  @sap.text : 'WeightUnit_Text'
  @sap.label : 'Unità di peso'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  WeightUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WeightUnit_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Paese/Reg. origine'
  @sap.quickinfo : 'Paese/Regione di origine del materiale (orig. non prefer.)'
  CountryOfOrigin : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Concorrente'
  CompetitorID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ProductGroup_Text'
  @sap.label : 'Gruppo di prodotti'
  @sap.value.list : 'standard'
  ProductGroup : String(9);
  @sap.label : 'Descrizione gruppo di prodotti'
  @sap.quickinfo : 'Descrizione gruppo prodotti'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductGroup_Text : String(20);
  @sap.required.in.filter : 'false'
  @sap.text : 'BaseUnit_Text'
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  BaseUnit_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ItemCategoryGroup_Text'
  @sap.label : 'Gr. tipi pos. gen.'
  @sap.quickinfo : 'Gruppo di tipi di posizione generale'
  @sap.value.list : 'standard'
  ItemCategoryGroup : String(4);
  @sap.label : 'Descrizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemCategoryGroup_Text : String(20);
  @sap.required.in.filter : 'false'
  @sap.unit : 'WeightUnit'
  @sap.label : 'Peso netto'
  NetWeight : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gerarchia prodotti'
  ProductHierarchy : String(18);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'Division_Text'
  @sap.label : 'Settore merceologico'
  @sap.value.list : 'standard'
  Division : String(2);
  @sap.label : 'Descrizione settore merceologico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Division_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Utà OdA variab.'
  @sap.quickinfo : 'Unità di misura OdA variabile attiva'
  VarblPurOrdUnitIsActive : String(1);
  @sap.required.in.filter : 'false'
  @sap.text : 'VolumeUnit_Text'
  @sap.label : 'Unità di volume'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  VolumeUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VolumeUnit_Text : String(30);
  @sap.required.in.filter : 'false'
  @sap.unit : 'VolumeUnit'
  @sap.label : 'Volume'
  MaterialVolume : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stato per cat.distr.'
  @sap.quickinfo : 'Stato materiale valido per tutta la catena di distr.'
  SalesStatus : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gruppo di trasporto'
  TransportationGroup : String(4);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Inizio validità'
  @sap.quickinfo : 'Data inizio val. stato mat. valido per tutta la cat.distr.'
  SalesStatusValidityDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gr. autorizzazioni'
  @sap.quickinfo : 'Gruppo autorizzazioni'
  AuthorizationGroup : String(4);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ANP Code'
  ANPCode : String(9);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ProductCategory_Text'
  @sap.label : 'Categoria prodotto'
  @sap.value.list : 'standard'
  ProductCategory : String(2);
  @sap.label : 'Testo per categoria di prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategory_Text : String(60);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'Brand_Text'
  @sap.label : 'Marca'
  @sap.value.list : 'standard'
  Brand : String(4);
  @sap.label : 'Definizione marche'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Brand_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Regola approvv.'
  @sap.quickinfo : 'Regola approvvigionamento'
  ProcurementRule : String(1);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Inizio validità'
  @sap.quickinfo : 'Data inizio validità'
  ValidityStartDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Livello pianif. MRP'
  @sap.quickinfo : 'Livello pianificazione MRP'
  LowLevelCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Materiale collettivo'
  @sap.quickinfo : 'Codice mat. del materiale collettivo nei mat. preconf.'
  ProdNoInGenProdInPrepackProd : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Profilo n.di serie'
  @sap.quickinfo : 'Profilo numero di serie'
  SerialIdentifierAssgmtProfile : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Grandezza/dimensione'
  SizeOrDimensionText : String(32);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Definizione standard'
  @sap.quickinfo : 'Definizione standard (es. DIN)'
  IndustryStandardName : String(18);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'GTIN'
  @sap.quickinfo : 'Global Trade Item Number (EAN/UPC/GTIN)'
  ProductStandardID : String(18);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'InternationalArticleNumberCat_Text'
  @sap.label : 'Tipo EAN'
  @sap.quickinfo : 'Tipo n. articoli europei'
  @sap.value.list : 'standard'
  InternationalArticleNumberCat : String(2);
  @sap.label : 'Def. tipo numero'
  @sap.quickinfo : 'Definizione tipo numero'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InternationalArticleNumberCat_Text : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Configurabile'
  @sap.quickinfo : 'Il prodotto è configurabile'
  ProductIsConfigurable : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Gestione partite'
  @sap.quickinfo : 'Indicatore Obbligo di gestione a partita'
  IsBatchManagementRequired : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Con dist. base vuoti'
  @sap.quickinfo : 'Cd.: distinta base vuoti'
  HasEmptiesBOM : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'ExternalProductGroup_Text'
  @sap.label : 'Gruppo prod. esterni'
  @sap.quickinfo : 'Gruppo prodotti esterno'
  @sap.value.list : 'standard'
  ExternalProductGroup : String(18);
  @sap.label : 'Descr. gr. prod. est'
  @sap.quickinfo : 'Descrizione gruppo prodotti esterni'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExternalProductGroup_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'CrossPlantConfigurableProduct_Text'
  @sap.label : 'PC val.per tt.div.'
  @sap.quickinfo : 'Prodotto configurabile valido per tutte le divisioni'
  @sap.value.list : 'standard'
  CrossPlantConfigurableProduct : String(40);
  @sap.label : 'Descrizione prodotto'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CrossPlantConfigurableProduct_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Liv. serializzazione'
  @sap.quickinfo : 'Livello di univocità del numero di serie'
  SerialNoExplicitnessLevel : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cod. comp. costr.'
  @sap.quickinfo : 'Codice componente costruttore'
  ProductManufacturerNumber : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Costruttore'
  @sap.quickinfo : 'Numero di un costruttore'
  ManufacturerNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProfCompAssCostr'
  @sap.quickinfo : 'Prof. compon. ass. costr.'
  ManufacturerPartProfile : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'QM in approv. attivo'
  @sap.quickinfo : 'QM attivo nell''approvvigionamento'
  QltyMgmtInProcmtIsActive : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Reg.part.autor.rich.'
  @sap.quickinfo : 'Registro partita autorizzato richiesto'
  IsApprovedBatchRecordReqd : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Indicatore handling'
  HandlingIndicator : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Grp. mat. magazzino'
  @sap.quickinfo : 'Gruppo materiale magazzino'
  WarehouseProductGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cond. stocc. in mag.'
  @sap.quickinfo : 'Condizione stoccaggio magazzino'
  WarehouseStorageCondition : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo HU standard'
  StandardHandlingUnitType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Profilo n.di serie'
  @sap.quickinfo : 'Profilo numero di serie'
  SerialNumberProfile : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Profilo adatt.'
  @sap.quickinfo : 'Profilo di adattamento'
  AdjustmentProfile : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'UM preferita'
  @sap.quickinfo : 'Utà di misura alternativa preferita per operazioni magazzino'
  @sap.semantics : 'unit-of-measure'
  PreferredUnitOfMeasure : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'A rischio di furto'
  IsPilferable : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Rilev. sost. peric.'
  @sap.quickinfo : 'Rilevante per sost. peric.'
  IsRelevantForHzdsSubstances : Boolean;
  @sap.required.in.filter : 'false'
  @sap.unit : 'TimeUnitForQuarantinePeriod'
  @sap.label : 'Per. quarant.'
  @sap.quickinfo : 'Periodo di quarant.'
  QuarantinePeriod : Decimal(3, 0);
  @sap.required.in.filter : 'false'
  @sap.text : 'TimeUnitForQuarantinePeriod_Text'
  @sap.label : 'Unità di tempo'
  @sap.quickinfo : 'Unità di tempo per periodo di quarantena'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  TimeUnitForQuarantinePeriod : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TimeUnitForQuarantinePeriod_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gruppo ctrl. qualità'
  @sap.quickinfo : 'Gruppo di controllo qualità'
  QualityInspectionGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo utà moviment.'
  @sap.quickinfo : 'Tipo di unità di movimentazione'
  HandlingUnitType : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Peso netto var.'
  @sap.quickinfo : 'Peso netto variabile'
  HasVariableTareWeight : Boolean;
  @sap.required.in.filter : 'false'
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Lungh. imball. max.'
  @sap.quickinfo : 'Lunghezza imballaggio max. di un mat. d''imballaggio'
  MaximumPackagingLength : Decimal(15, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Largh. imball. max.'
  @sap.quickinfo : 'Largh. imballaggio max. consentita di mat. d''imballaggio'
  MaximumPackagingWidth : Decimal(15, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Altezza imball. max.'
  @sap.quickinfo : 'Altezza imballaggio max. di mat. d''imballaggio'
  MaximumPackagingHeight : Decimal(15, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacità massima'
  @sap.quickinfo : 'Capacità massima consentita del mat. d''imballaggio'
  MaximumCapacity : Decimal(15, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Toll. capacità max.'
  @sap.quickinfo : 'Tolleranza capacità max. handling unit'
  OvercapacityTolerance : Decimal(3, 1);
  @sap.required.in.filter : 'false'
  @sap.text : 'UnitForMaxPackagingDimensions_Text'
  @sap.label : 'Unità di misura'
  @sap.quickinfo : 'Unità di mis. per lungh. /largh. /altezza max. d''imballaggio'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  UnitForMaxPackagingDimensions : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitForMaxPackagingDimensions_Text : String(30);
  @sap.required.in.filter : 'false'
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Lunghezza'
  BaseUnitSpecificProductLength : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Larghezza'
  BaseUnitSpecificProductWidth : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Altezza'
  BaseUnitSpecificProductHeight : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.text : 'ProductMeasurementUnit_Text'
  @sap.label : 'Unità di misura'
  @sap.quickinfo : 'Unità di misura per lungh./largh./altezza'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  ProductMeasurementUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductMeasurementUnit_Text : String(30);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Inizio validità'
  @sap.quickinfo : 'Data inizio validità'
  ProductValidStartDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Categoria prodotto'
  ArticleCategory : String(2);
  @sap.required.in.filter : 'false'
  @sap.text : 'ContentUnit_Text'
  @sap.label : 'UM contenuto'
  @sap.quickinfo : 'Unità di misura contenuto'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  ContentUnit : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ContentUnit_Text : String(30);
  @sap.required.in.filter : 'false'
  @sap.unit : 'ContentUnit'
  @sap.label : 'Cont. netto'
  NetContent : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'ContentUnit'
  @sap.label : 'Unità di prezzo di confronto'
  @sap.quickinfo : 'Unità del prezzo di confronto'
  ComparisonPriceQuantity : Decimal(5, 0);
  @sap.required.in.filter : 'false'
  @sap.unit : 'ContentUnit'
  @sap.label : 'Contenuti lordi'
  @sap.quickinfo : 'Contenuto lordo'
  GrossContent : Decimal(13, 3);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Fine validità'
  @sap.quickinfo : 'Data liquidazione'
  ProductValidEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'AssortmentListType_Text'
  @sap.label : 'Tipo lista assort.'
  @sap.quickinfo : 'Tipo lista assortimento'
  @sap.value.list : 'standard'
  AssortmentListType : String(1);
  @sap.label : 'Descrizione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AssortmentListType_Text : String(20);
  @sap.required.in.filter : 'false'
  @sap.label : 'Origine animale'
  @sap.quickinfo : 'Ind.: contiene parti non tessili di origine animale'
  HasTextilePartsWthAnimalOrigin : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Utilizzo stagione'
  @sap.quickinfo : 'Indicatore: utilizzo di stagione'
  ProductSeasonUsageCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Settore industriale'
  IndustrySector : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero di modifica'
  ChangeNumber : String(12);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stato rev.'
  MaterialRevisionLevel : String(2);
  @sap.required.in.filter : 'false'
  @sap.label : 'È attivo'
  @sap.quickinfo : 'Bozza - Indicatore - È un documento attivo'
  IsActiveEntity : Boolean;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.required.in.filter : 'false'
  @sap.label : 'Ultima modifica'
  @sap.quickinfo : 'Timestamp di modifica'
  LastChangeDateTime : Timestamp;
  @sap.required.in.filter : 'false'
  @sap.label : 'Ora ultima modifica'
  @sap.quickinfo : 'Ora dell''ultima modifica'
  LastChangeTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Profilo codice MP'
  @sap.quickinfo : 'Profilo per codice merci pericolose'
  DangerousGoodsIndProfile : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Chiave interna per prodotto'
  ProductUUID : UUID;
  @sap.required.in.filter : 'false'
  @sap.label : 'ID prod.'
  @sap.quickinfo : 'Numero interno (UID) per prodotto'
  ProdSupChnMgmtUUID22 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero mod. doc.'
  @sap.quickinfo : 'N. modifica del documento (senza sistema gestione documenti)'
  ProductDocumentChangeNumber : String(6);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'N. di fogli'
  @sap.quickinfo : 'Numero fogli (senza sistema di gestione documenti)'
  ProductDocumentPageCount : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero della pagina'
  @sap.quickinfo : 'N. pagina documento (senza sist. gestione documenti)'
  ProductDocumentPageNumber : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Codice mat. interno'
  @sap.quickinfo : 'Codice del materiale interno gestito in base a stock'
  OwnInventoryManagedProduct : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Cd. CAD'
  @sap.quickinfo : 'Codice CAD'
  DocumentIsCreatedByCAD : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Avv. prod./controllo'
  @sap.quickinfo : 'Avvert. produz./controllo'
  ProductionOrInspectionMemoTxt : String(18);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Formato DIN'
  @sap.quickinfo : 'Formato DIN istruzioni di produzione'
  ProductionMemoPageFormat : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Variante EAN'
  @sap.quickinfo : 'Variante per Global Trade Item Number'
  GlobalTradeItemNumberVariant : String(2);
  @sap.required.in.filter : 'false'
  @sap.label : 'Viscosità elevata'
  @sap.quickinfo : 'Codice: viscosità elevata'
  ProductIsHighlyViscous : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Merce sfusa/liquidi'
  @sap.quickinfo : 'Codice: merce sfusa/liquidi'
  TransportIsInBulk : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Schema elab. quote'
  @sap.quickinfo : 'Elaborazione quote: schema di elaborazione quote'
  ProdAllocDetnProcedure : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Val. validità par.'
  @sap.quickinfo : 'Valutazione con parametro validità / sostituire n. modifica'
  ProdEffctyParamValsAreAssigned : Boolean;
  @sap.required.in.filter : 'false'
  @sap.label : 'Rilev. per l''amb.'
  @sap.quickinfo : 'Codice: rilevante per l''ambiente'
  ProdIsEnvironmentallyRelevant : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Laboratorio/ufficio'
  @sap.quickinfo : 'Laboratorio / Uff. progettazione'
  LaboratoryOrDesignOffice : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gruppo mat. imb.'
  @sap.quickinfo : 'Gruppo materiali d''imballaggio'
  PackagingMaterialGroup : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Fisso'
  @sap.quickinfo : 'Il materiale è fisso'
  ProductIsLocked : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sogg. sconto merce'
  @sap.quickinfo : 'Il materiale è soggetto allo sconto merce'
  DiscountInKindEligibility : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Nome del modulo'
  SmartFormName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Mat. rif. norma imb.'
  @sap.quickinfo : 'Materiale di rif. per materiali imballati analogamente'
  PackingReferenceProduct : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Mat. base'
  BasicMaterial : String(48);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Documento'
  @sap.quickinfo : 'Numero documento (senza sistema gestione documenti)'
  ProductDocumentNumber : String(22);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Versione documento'
  @sap.quickinfo : 'Versione del documento (senza sistema gestione documenti)'
  ProductDocumentVersion : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di documento'
  @sap.quickinfo : 'Tipo documento (senza sistema gestione documenti)'
  ProductDocumentType : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Formato pagina'
  @sap.quickinfo : 'Formato pag. documento (senza sistema gestione documenti)'
  ProductDocumentPageFormat : String(4);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'N. oggetto int.'
  ProductConfiguration : String(18);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Strategia segm.'
  @sap.quickinfo : 'Strategia di segmentazione'
  SegmentationStrategy : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ril. segm.'
  @sap.quickinfo : 'Rilevante per segm.'
  SegmentationIsRelevant : String(1);
  @sap.required.in.filter : 'false'
  @sap.label : 'Composizione prod.'
  @sap.quickinfo : 'Cd.: composizione prodotto indicata su imballaggio'
  ProductCompositionIsRelevant : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Indic. di ril. per conformità chimica'
  @sap.quickinfo : 'Indicatore di rilevanza per conformità chimica'
  IsChemicalComplianceRelevant : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'NCollVar. C/F'
  @sap.quickinfo : 'Numero collettivo variante del produttore'
  ManufacturerBookPartNumber : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cat. mat. logistico'
  @sap.quickinfo : 'Categoria di un materiale logistico'
  LogisticalProductCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'N. mat. vendita'
  @sap.quickinfo : 'Numero di un materiale di vendita'
  SalesProduct : String(40);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero caratt. int.'
  @sap.quickinfo : 'Numero caratteristica interna nelle caratt. dei colori'
  ProdCharc1InternalNumber : String(30);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero caratt. int.'
  @sap.quickinfo : 'N. caratt. interna nelle caratt. per le dimens. principali'
  ProdCharc2InternalNumber : String(30);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero caratt. int.'
  @sap.quickinfo : 'N. caratt. interna nelle caratt. delle seconde dimensioni'
  ProdCharc3InternalNumber : String(30);
  @sap.required.in.filter : 'false'
  @sap.label : 'Colore'
  @sap.quickinfo : 'Valore caratteristica per colori in caso di varianti'
  ProductCharacteristic1 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Dimensione princ.'
  @sap.quickinfo : 'Valore caratteristica per la dimens. princ. nelle varianti'
  ProductCharacteristic2 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Seconda dimensione'
  @sap.quickinfo : 'Valore caratt. per la seconda dimensione nelle varianti'
  ProductCharacteristic3 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stato aggiornamento'
  MaintenanceStatus : String(15);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Attrib. moda 1'
  @sap.quickinfo : 'Campo informazioni moda: 1'
  FashionProdInformationField1 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Attr. fashion 2'
  @sap.quickinfo : 'Campo informazioni fashion: 2'
  FashionProdInformationField2 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Attr. fashion 3'
  @sap.quickinfo : 'Campo informazioni fashion: 3'
  FashionProdInformationField3 : String(6);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cd. sost. munizioni'
  @sap.quickinfo : 'Codice sostituzione munizioni'
  DfsAmmunitionGroupCode : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Confid. caratt.'
  @sap.quickinfo : 'Confidenzialità per caratteristiche'
  DfsProductSensitivity : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'ID CED'
  @sap.quickinfo : 'Codice dell''elemento di dichiarazione - ID numerico'
  DfsRICIdentifier : Integer64;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'CCC esteso'
  @sap.quickinfo : 'Codice componente costruttore esteso'
  DfsManufacturerPartLongNumber : String(60);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Valore di ritorno'
  DfsReturnDelivery : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gestione stato'
  @sap.quickinfo : 'Gestione stato materiale'
  DfsMatlConditionMgmt : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Rit.fino a liv.log.'
  @sap.quickinfo : 'Ritorno fino al livello logistico'
  DfsLogisticsLevel : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cd. fornitura NATO'
  @sap.quickinfo : 'Codice di fornitura NATO'
  DfsNationalItemIdnNumber : String(9);
  to_AssortmentListType : Association to ZZ1_I_COMBORDER_COMP_CDS.I_AssortmentListType {  };
  to_BaseUnitOfMeasure : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {  };
  to_Brand : Association to ZZ1_I_COMBORDER_COMP_CDS.I_Brand {  };
  to_ContentUnit : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {  };
  to_Division : Association to ZZ1_I_COMBORDER_COMP_CDS.I_Division {  };
  to_ExternalProductGroup : Association to ZZ1_I_COMBORDER_COMP_CDS.I_ExtProdGrp {  };
  to_InternationalArticleNumberCat : Association to ZZ1_I_COMBORDER_COMP_CDS.I_Intntnlartnmbcat {  };
  to_ItemCategoryGroup : Association to ZZ1_I_COMBORDER_COMP_CDS.I_ItemCategoryGroup {  };
  to_ProductCategory : Association to ZZ1_I_COMBORDER_COMP_CDS.I_ProductCategory {  };
  to_ProductGroup_2 : Association to ZZ1_I_COMBORDER_COMP_CDS.I_ProductGroup_2 {  };
  to_ProductMeasurementUnit : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {  };
  to_ProductStatus : Association to ZZ1_I_COMBORDER_COMP_CDS.I_ProductStatus {  };
  to_ProductType : Association to ZZ1_I_COMBORDER_COMP_CDS.I_Producttype {  };
  to_QuantityUnitValueHelp : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {  };
  to_TimeUnitForQuarantinePeriod : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {  };
  to_UnitForMaxPackaging : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {  };
  to_WeightUnitValueHelp : Association to ZZ1_I_COMBORDER_COMP_CDS.I_UnitOfMeasure {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.semantics : 'aggregate'
@sap.label : 'I_COMBORDER_COMP'
entity ZZ1_I_COMBORDER_COMP_CDS.ZZ1_I_COMBORDER_COMP {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ord. prod. combinato'
  @sap.quickinfo : 'Ordine prod. principale comb.'
  CprodOrd : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di fabbisogno'
  requirementtype : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  Material : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Contatore'
  @sap.quickinfo : 'Contatore generale dell''ordine'
  OrderIntBillOfOperationsItem : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Numero di posizione distinta base'
  BillOfMaterialItemNumber_2 : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Divisione'
  Plant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Crit. class.'
  @sap.quickinfo : 'Criterio di classificazione'
  SortField : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cat. pos .dist. base'
  @sap.quickinfo : 'Categoria di posizione distinta base'
  BOMItemCategory : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Prel. fin.'
  @sap.quickinfo : 'Prelievo finale dell''impegno'
  ReservationIsFinallyIssued : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Posizione dummy'
  @sap.quickinfo : 'Indicatore posizione dummy'
  MaterialComponentIsPhantomItem : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Merce sfusa'
  @sap.quickinfo : 'Indicatore: merce sfusa'
  IsBulkMaterialComponent : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di valutazione stock speciale'
  @sap.quickinfo : 'Tipo di valutazione stock inventario speciale'
  InventorySpecialStockValnType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'UM acquisizione'
  @sap.quickinfo : 'Unità di misura di registrazione'
  @sap.semantics : 'unit-of-measure'
  EntryUnit : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scarto comp. (%)'
  @sap.quickinfo : 'Scarto del componente in percentuale'
  ComponentScrapInPercent : Decimal(5, 2);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scarto oper. in %'
  @sap.quickinfo : 'Scarto operazione'
  OperationScrapInPercent : Decimal(5, 2);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scostamento nel lead time'
  LeadTimeOffset : Decimal(3, 0);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Magazzino'
  StorageLocation : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Area di approvvigionamento produzione'
  ProductionSupplyArea : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Partita'
  @sap.quickinfo : 'Numero partita'
  Batch : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo posizione'
  @sap.quickinfo : 'Testo posizione distinta base (riga 1)'
  BOMItemDescription : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo posizione 2'
  @sap.quickinfo : 'Testo posizione distinta base (riga 2)'
  BOMItemText2 : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Flag di canc.'
  @sap.quickinfo : 'Flag di cancellazione'
  IsMarkedForDeletion : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'ComponentIsMissing'
  ComponentIsMissing : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  Product : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Unità di produzione'
  @sap.quickinfo : 'Unità di misura di produzione'
  @sap.semantics : 'unit-of-measure'
  ProductionUnit : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Esercizio stagionale'
  ProductSeasonYear : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stagione'
  ProductSeason : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Collezione'
  @sap.quickinfo : 'Collezione fashion'
  ProductCollection : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tema'
  @sap.quickinfo : 'Tema fashion'
  ProductTheme : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Int. centro lav.'
  @sap.quickinfo : 'ID interno centro di lavoro'
  WorkCenterInternalID : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di centro di lavoro'
  WorkCenterTypeCODE_2_1 : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sequenza'
  @sap.quickinfo : 'Sequenza ordine di produzione'
  ManufacturingOrderSequence : String(6);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Operazione'
  @sap.quickinfo : 'Operazione ordine di produzione'
  ManufacturingOrderOperation : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di ordine'
  ManufacturingOrderType : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Magazzino'
  @sap.quickinfo : 'Magazzino produzione'
  ProductionInvtryManagedLoc : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  Supplier : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Centro di lavoro'
  WorkCenter : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cliente'
  @sap.quickinfo : 'Codice cliente'
  Customer : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Nome del fornitore'
  BPSupplierName : String(81);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Via'
  @sap.quickinfo : 'Via e numero civico'
  StreetName : String(35);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Città'
  CityName : String(35);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'CAP'
  @sap.quickinfo : 'Codice di avviamento postale'
  PostalCode : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Chiave paese/reg.'
  @sap.quickinfo : 'Chiave paese/regione'
  Country : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Regione'
  @sap.quickinfo : 'Regione (stato federale, stato federato, provincia, contea)'
  Region : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Descrizione prodotto'
  ProductDescription : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo di lunghezza 4'
  Lgort1 : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo di lunghezza 4'
  Lgort2 : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo di lunghezza 4'
  Lgort3 : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tp. stock speciale'
  @sap.quickinfo : 'Tipo di stock inventario speciale'
  InventorySpecialStockType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'StockSegment'
  @sap.quickinfo : 'Segmento di stock'
  StockSegment : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'RequirementSegment'
  @sap.quickinfo : 'Segmento fabbisogno'
  RequirementSegment : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'ParentStockSegment'
  @sap.quickinfo : 'Segmento di stock'
  ParentStockSegment : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'minRequirementDate'
  minRequirementDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'minRequirementTime'
  minRequirementTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'minLatestRequirementDate'
  minLatestRequirementDate : Date;
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalAllocQty'
  @sap.filterable : 'false'
  TotalAllocQty : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalRequiredQuantity'
  TotalRequiredQuantity : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalQuantityInEntryUnit'
  TotalQuantityInEntryUnit : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalWithdrawnQuantity'
  TotalWithdrawnQuantity : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalConfdQtyForATPInBaseUoM'
  TotalConfdQtyForATPInBaseUoM : Decimal(15, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalMatQtyToBaseQtyNmrtr'
  TotalMatQtyToBaseQtyNmrtr : Decimal(5, 0);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalMatQtyToBaseQtyDnmntr'
  TotalMatQtyToBaseQtyDnmntr : Decimal(5, 0);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalDeliveryQty'
  TotalDeliveryQty : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalDefaultAllocQty'
  TotalDefaultAllocQty : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'TotalProdAllocQty'
  TotalProdAllocQty : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  @sap.quickinfo : 'Descrizione prodotto'
  ProductDescription_1 : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRPController'
  MRPController : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'isOpened'
  @sap.quickinfo : 'Elemento dati per dominio BOOLE: TRUE (=''X'') e FALSE (='' '')'
  isOpened : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'DeliveryQty'
  DeliveryQty : Decimal(13, 3);
  to_ZZ1_C_PRODUCT : Association to many ZZ1_I_COMBORDER_COMP_CDS.ZZ1_C_PRODUCT {  };
};

