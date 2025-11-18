/* checksum : 0453bc5a757c6be1c536544b68edc100 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZMFG_I_SUPPLIER_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_ZMFG_C_PRODUCT_F4'
entity ZMFG_I_SUPPLIER_F4_CDS.ZMFG_I_SUPPLIER_F4 {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  key Supplier : String(10) not null;
  @sap.label : 'Nome del fornitore'
  SupplierName : String(80);
};

