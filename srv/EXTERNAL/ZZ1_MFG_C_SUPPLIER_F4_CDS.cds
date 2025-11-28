/* checksum : 02247db7f940e7d9a51b9fd220ae7aac */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MFG_C_SUPPLIER_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_MFG_C_SUPPLIER_F4'
entity ZZ1_MFG_C_SUPPLIER_F4_CDS.ZZ1_MFG_C_SUPPLIER_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  key Supplier : String(10) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Nome del fornitore'
  SupplierName : String(80);
};

