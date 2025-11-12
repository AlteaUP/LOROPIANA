/* checksum : ea918c2c33999d77a70204833d48af2c */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MRPCONTROLLER_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'MRP CONTROLLER F4'
entity ZZ1_MRPCONTROLLER_F4_CDS.ZZ1_MRPCONTROLLER_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  @sap.quickinfo : 'Responsabile MRP'
  key MRPController : String(3) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller Name'
  @sap.quickinfo : 'Nome responsabile MRP'
  MRPControllerName : String(18);
};

