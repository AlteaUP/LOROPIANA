/* checksum : 497d8db81f7e026c6ae86adbac3aada0 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MFI_LUOGOSPED_TIPOCONS_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'MFI_LUOGOSPED_TIPOCONS'
entity ZZ1_MFI_LUOGOSPED_TIPOCONS_CDS.ZZ1_MFI_LUOGOSPED_TIPOCONS {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'COUNTER'
  COUNTER : String(10);
  @sap.label : 'PLANT'
  WERKS : String(4);
  @sap.label : 'PARENTSTOCKSEGMENT'
  SGT_SCAT : String(40);
  @sap.label : 'SHIPPINGLOCATION'
  VSTEL : String(4);
  @sap.label : 'DELIVERYTYPE'
  LFART : String(4);
  @sap.label : 'REQUIREMENTTYPE'
  BDART : String(2);
  @sap.label : 'FACTORY'
  FACTORY : Boolean;
};

@cds.external : true
action ZZ1_MFI_LUOGOSPED_TIPOCONS_CDS.ZZ1_MFI_LUOGOSPED_TIPOCONSSap_upsert(
  @sap.label : 'Numeric length 10'
  COUNTER : String(10),
  @sap.label : 'Text of length 4'
  WERKS : String(4),
  @sap.label : 'Text of length 40'
  SGT_SCAT : String(40),
  @sap.label : 'Text of length 4'
  VSTEL : String(4),
  @sap.label : 'Text of length 4'
  LFART : String(4),
  @sap.label : 'Text of length 2'
  BDART : String(2),
  @sap.label : 'TRUE'
  FACTORY : Boolean
) returns ZZ1_MFI_LUOGOSPED_TIPOCONS_CDS.ZZ1_MFI_LUOGOSPED_TIPOCONS;

