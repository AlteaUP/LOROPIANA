/* checksum : 2004ff103a4c87205f851194283e00b8 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_C_MFG_USERPARAMS_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_C_MFG_USERPARAMS'
entity ZZ1_C_MFG_USERPARAMS_CDS.ZZ1_C_MFG_USERPARAMS {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'ID parametro'
  @sap.quickinfo : 'ID param. Set/Get'
  key UserParameter : String(20) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Valore param.'
  @sap.quickinfo : 'Valore parametro'
  UserParameterValue : String(40);
};

