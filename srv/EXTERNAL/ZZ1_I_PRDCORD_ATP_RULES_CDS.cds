/* checksum : 1b469c04d97e6f059ef981b836afe392 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_PRDCORD_ATP_RULES_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ATP RULES'
entity ZZ1_I_PRDCORD_ATP_RULES_CDS.ZZ1_I_PRDCORD_ATP_RULES {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ord. prod. combinato'
  @sap.quickinfo : 'Ordine prod. principale comb.'
  key CprodOrd : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partita'
  @sap.quickinfo : 'Numero partita'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Numero di posizione distinta base'
  key BillOfMaterialItemNumber_2 : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Segmento di stock'
  StockSegment : String(40);
  RequirementSegment : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Strategia segm.'
  @sap.quickinfo : 'Strategia di segmentazione'
  SegmentationStrategy : String(8);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  atp : String(1000);
};

