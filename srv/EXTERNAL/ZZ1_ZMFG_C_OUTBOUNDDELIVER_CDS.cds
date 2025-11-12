/* checksum : 77bd95c198c47897666c427ab650a1e7 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_ZMFG_C_OUTBOUNDDELIVER_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_ZMFG_C_OUTBOUNDDELIVER'
entity ZZ1_ZMFG_C_OUTBOUNDDELIVER_CDS.ZZ1_ZMFG_C_OUTBOUNDDELIVER {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Consegna in uscita'
  key OutboundDelivery : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data creazione'
  @sap.quickinfo : 'Data di creazione del record'
  CreationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Materiale cliente'
  @sap.quickinfo : 'Materiale del cliente'
  MaterialByCustomer : String(35);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data eff. mov. merci'
  @sap.quickinfo : 'Data movimento merci effettiva'
  ActualGoodsMovementDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Data mov.merci pian.'
  @sap.quickinfo : 'Data del movimento merci pianificato'
  PlannedGoodsIssueDate : Date;
};

