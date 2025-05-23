/* checksum : 36d5321f98469a564817d761d86f7d74 */
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
@sap.label : 'ZZ1_I_PRODTYPEMATCHCOD'
entity ZZ1_I_PRODTYPEMATCHCOD_CDS.ZZ1_I_PRODTYPEMATCHCOD {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Tipo di ordine'
  @sap.quickinfo : 'Tipo di ordine di produzione'
  key ManufacturingOrderType : String(4) not null;
};

