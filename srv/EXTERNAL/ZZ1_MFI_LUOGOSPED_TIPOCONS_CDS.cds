/* checksum : 4786eb04bca16972fece08e066d9c881 */
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
  @sap.label : 'Testo di lunghezza 4'
  WERKS : String(4),
  @sap.label : 'Testo di lungh. 40'
  SGT_SCAT : String(40),
  @sap.label : 'Testo di lunghezza 4'
  VSTEL : String(4),
  @sap.label : 'Testo di lunghezza 4'
  LFART : String(4),
  @sap.label : 'Testo di lunghezza 2'
  BDART : String(2),
  @sap.label : 'VERO'
  FACTORY : Boolean
) returns ZZ1_MFI_LUOGOSPED_TIPOCONS_CDS.ZZ1_MFI_LUOGOSPED_TIPOCONS;

