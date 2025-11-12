/* checksum : 1d5ef208a20d814f9db2e3065f3ee264 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_ZMFG_C_PRODUCT_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_ZMFG_C_PRODUCT_F4'
entity ZZ1_ZMFG_C_PRODUCT_F4_CDS.ZZ1_ZMFG_C_PRODUCT_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Prodotto'
  @sap.quickinfo : 'Codice prodotto'
  key Product : String(40) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Descrizione prodotto'
  ProductDescription : String(40);
};

