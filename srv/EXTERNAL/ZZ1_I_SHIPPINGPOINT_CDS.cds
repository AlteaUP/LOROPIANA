/* checksum : 67be346bf817bdfcaf8e44320e4cd0dc */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_SHIPPINGPOINT_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'I_ShippingPoint'
entity ZZ1_I_SHIPPINGPOINT_CDS.ZZ1_I_ShippingPoint {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Luogo sped.'
  @sap.quickinfo : 'Luogo di spedizione / Punto di accettazione merce'
  key ShippingPoint : String(4) not null;
};

