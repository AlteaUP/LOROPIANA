/* checksum : b0054fc993e0481041acd58e50ddba1e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MFP_ASSIGNMENT_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Lingua'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_Language {
  @sap.text : 'Language_Text'
  @sap.label : 'Chiave lingua'
  key Language : String(2) not null;
  @sap.label : 'Denominazione'
  @sap.quickinfo : 'Definizione lingua'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Language_Text : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice lingua'
  @sap.quickinfo : 'Codice lingua SAP a due posizioni'
  LanguageISOCode : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Unità di misura'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {
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
  to_Dimension : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureDimension {  };
  to_ISOCode : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureISOCode {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Dimensione dell''unità di misura'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureDimension {
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
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureISOCode {
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
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Testo unità di misura'
entity ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureText {
  @sap.text : 'to_Language/Language_Text'
  @sap.label : 'Chiave lingua'
  @sap.value.list : 'standard'
  key Language : String(2) not null;
  @sap.text : 'to_UnitOfMeasure/UnitOfMeasure_Text'
  @sap.label : 'Unità misura interna'
  @sap.quickinfo : 'Unità di misura'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  UnitOfMeasureLongName : String(30);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 10 posizioni)'
  UnitOfMeasureName : String(10);
  @sap.label : 'Tecn.'
  @sap.quickinfo : 'Unità di misura tecnica a 6 posizioni'
  UnitOfMeasureTechnicalName : String(6);
  @sap.label : 'Commerciale'
  @sap.quickinfo : 'Unità di misura esterna - rappr. commerciale a 3 posizioni'
  UnitOfMeasure_E : String(3);
  @sap.label : 'Commerciale'
  @sap.quickinfo : 'Unità di misura esterna - rappr. commerciale a 3 posizioni'
  UnitOfMeasureCommercialName : String(3);
  to_Language : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_Language {  };
  to_UnitOfMeasure : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'User'
entity ZZ1_MFP_ASSIGNMENT_CDS.P_Scbo_User {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Utente'
  @sap.quickinfo : 'Nome riportato nell''anagrafica utente'
  key name : String(12) not null;
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione del conto utente tecnico'
  description : String(80);
};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'MFP_ASSIGNMENT'
entity ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENT {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'Plant'
  WERKS : String(4);
  @sap.label : 'StorageLocation'
  LGORT : String(20);
  @sap.label : 'Ordine pianificato combinato principale'
  FSH_MPLO_ORD : String(12);
  @sap.label : 'Bagni'
  BAGNI : String(45);
  @sap.label : 'Materiale'
  MATNR : String(40);
  @sap.label : 'Batch'
  CHARG : String(10);
  @sap.label : 'Bagno'
  Bagno : String(45);
  @sap.unit : 'QTA_ASS_U'
  @sap.label : 'Qtà ASSIGNMENT'
  QTA_ASS_V : Decimal(15, 3);
  @sap.text : 'QTA_ASS_U_Text'
  @sap.label : 'Qtà ASSIGNMENT'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  QTA_ASS_U : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  QTA_ASS_U_Text : String(30);
  @sap.unit : 'FABB_TOT_U'
  @sap.label : 'Fabbisogno Tot.'
  FABB_TOT_V : Decimal(15, 3);
  @sap.text : 'FABB_TOT_U_Text'
  @sap.label : 'Fabbisogno Tot.'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  FABB_TOT_U : String(3);
  @sap.label : 'Testo UM'
  @sap.quickinfo : 'Testo unità di misura (massimo 30 posizioni)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FABB_TOT_U_Text : String(30);
  @sap.label : '% Copertura'
  COPERTURA : Decimal(10, 0);
  @sap.label : 'SORT'
  SORT : Decimal(10, 0);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Data creazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_CreatedByUser_Text'
  @sap.label : 'Autore creazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser : String(12);
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione del conto utente tecnico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser_Text : String(80);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Data dell''ultima modifica'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_LastChangedByUser_Text'
  @sap.label : 'Autore dell''ultima modifica'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser : String(12);
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione del conto utente tecnico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser_Text : String(80);
  @sap.label : 'Special Stock'
  SpecialStock : String(1);
  @sap.label : 'Stock Segment'
  StockSegment : String(40);
  @sap.label : 'Saldo/Scorta'
  SaldoScorta : Boolean;
  @sap.label : 'Supplier Batch'
  BatchBySupplier : String(20);
  @sap.label : 'Scorta'
  Scorta : String(20);
  to_FABB_TOT : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {  };
  to_QTA_ASS : Association to ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasure {  };
  to_SAPSysAdminDataChangeUser : Association to ZZ1_MFP_ASSIGNMENT_CDS.P_Scbo_User {  };
  to_SAPSysAdminDataCreateUser : Association to ZZ1_MFP_ASSIGNMENT_CDS.P_Scbo_User {  };
  to__FABB_TOT : Association to many ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureText {  };
  to__QTA_ASS : Association to many ZZ1_MFP_ASSIGNMENT_CDS.I_UnitOfMeasureText {  };
};

@cds.external : true
action ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENTSap_upsert(
  @sap.label : 'Testo di lunghezza 4'
  WERKS : String(4),
  @sap.label : 'Testo di lungh. 20'
  LGORT : String(20),
  @sap.label : 'Testo di lungh. 12'
  FSH_MPLO_ORD : String(12),
  @sap.label : 'Testo lunghezza 45'
  BAGNI : String(45),
  @sap.label : 'Testo di lungh. 40'
  MATNR : String(40),
  @sap.label : 'Testo di lungh. 10'
  CHARG : String(10),
  @sap.label : 'Testo lunghezza 45'
  Bagno : String(45),
  @sap.label : 'Qtà ASSIGNMENT'
  QTA_ASS_V : Decimal(15, 3),
  @sap.label : 'Qtà ASSIGNMENT'
  QTA_ASS_U : String(3),
  @sap.label : 'Fabbisogno Tot.'
  FABB_TOT_V : Decimal(15, 3),
  @sap.label : 'Fabbisogno Tot.'
  FABB_TOT_U : String(3),
  @sap.label : '% Copertura'
  COPERTURA : Decimal(10, 0),
  @sap.label : 'SORT'
  SORT : Decimal(10, 0),
  @sap.label : 'Testo di lunghezza 1'
  SpecialStock : String(1),
  @sap.label : 'Testo di lungh. 40'
  StockSegment : String(40),
  @sap.label : 'VERO'
  SaldoScorta : Boolean,
  @sap.label : 'Testo di lungh. 20'
  BatchBySupplier : String(20),
  @sap.label : 'Testo di lungh. 20'
  Scorta : String(20)
) returns ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENT;

