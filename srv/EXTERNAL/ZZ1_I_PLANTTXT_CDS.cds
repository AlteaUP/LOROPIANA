/* checksum : 98a4a9d067b59327c7ce4fc40dd4f860 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_PLANTTXT_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_I_PLANTTXT'
entity ZZ1_I_PLANTTXT_CDS.ZZ1_I_PLANTTXT {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'PlantName'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Nome divisione'
  PlantName : String(30);
};

