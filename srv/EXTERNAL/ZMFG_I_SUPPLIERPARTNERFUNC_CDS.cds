/* checksum : 7790af022c69c5929b3fe5892515d31f */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZMFG_I_SUPPLIERPARTNERFUNC_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZMFG_I_SUPPLIERPARTNERFUNC'
entity ZMFG_I_SUPPLIERPARTNERFUNC_CDS.ZMFG_I_SUPPLIERPARTNERFUNC {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fornitore'
  @sap.quickinfo : 'Numero conto del fornitore'
  key Supplier : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contatore partner'
  key PartnerCounter : String(3) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Org. acquisti'
  @sap.quickinfo : 'Organizzazione acquisti'
  PurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ruolo partner'
  PartnerFunction : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo partner'
  @sap.quickinfo : 'Tp. numero partner'
  PartnerFunctionType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rif. a forn.'
  @sap.quickinfo : 'Riferimento ad altro fornitore'
  ReferenceSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice indirizzo'
  Addrnumber : String(10);
  @sap.label : 'Nome'
  @sap.quickinfo : 'Nome 1'
  Name1 : String(40);
  indirizzo : String(120);
};

