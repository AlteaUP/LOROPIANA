/* checksum : ad5af2f8a988bf6ae992ff3984b45fb0 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_WORKCENTERTXT_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_I_WORKCENTERTXT'
entity ZZ1_I_WORKCENTERTXT_CDS.ZZ1_I_WORKCENTERTXT {
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ID oggetto'
  @sap.quickinfo : 'ID oggetto della risorsa'
  key WorkCenterInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo oggetto'
  @sap.quickinfo : 'CIM Resource Object Type'
  key WorkCenterTypeCode : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Centro di lavoro'
  key WorkCenter : String(8) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Testo centro lavoro'
  @sap.quickinfo : 'Testo centro di lavoro'
  WorkCenterText : String(40);
};

