/* checksum : ba8a5b6416fc78b7a4b6ee2e43aafe9f */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_ZMFI_DATAPRELIEVO_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZMFI_Data Prelievo'
entity ZZ1_ZMFI_DATAPRELIEVO_CDS.ZZ1_ZMFI_DATAPRELIEVO {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'werks'
  werks : String(4);
  @sap.label : 'stk_seg'
  stk_seg : String(40);
  @sap.label : 'predays'
  predays : Decimal(3, 0);
};

@cds.external : true
action ZZ1_ZMFI_DATAPRELIEVO_CDS.ZZ1_ZMFI_DATAPRELIEVOSap_upsert(
  @sap.label : 'Testo di lunghezza 4'
  werks : String(4),
  @sap.label : 'Testo di lungh. 40'
  stk_seg : String(40),
  @sap.label : 'predays'
  predays : Decimal(3, 0)
) returns ZZ1_ZMFI_DATAPRELIEVO_CDS.ZZ1_ZMFI_DATAPRELIEVO;

