/* checksum : 430b347280b9a9569fb4e3ceccecbeb1 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_PRODTYPEMATCHCOD_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_I_PRODTYPEMATCHCODE'
entity ZZ1_I_PRODTYPEMATCHCOD_CDS.ZZ1_I_PRODTYPEMATCHCOD {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ordine di produzione'
  @sap.quickinfo : 'ID ordine di produzione'
  key ManufacturingOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di ordine'
  ManufacturingOrderType : String(4);
};

