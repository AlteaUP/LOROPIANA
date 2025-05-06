using from '../../srv/cat-service';

annotate CatalogService.MainCds with @(
    UI.SelectionFields #SF : [Material, CprodOrd, Plant, WorkCenterInternalID],
    UI.PresentationVariant : {    
        SortOrder     : [{
                Descending: true,
                Property  : CprodOrd,
            }, 
        ],
        GroupBy : [
            Supplier
        ],
        Visualizations: ['@UI.LineItem#tableMacro']
    },
    UI.DataPoint #radialChart : { 
        Value : QtyTrafficLight,
        Criticality: QtyTrafficLightStatus,
    },
    UI.Chart #radialChart : {
        Title : '{i18n>radialChart}',
        Description : '{i18n>ThisIsAMicroChart}',
        ChartType : #Donut,
        
        Measures : [QtyTrafficLight],
        MeasureAttributes : [{
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : QtyTrafficLight,
                Role : #Axis1,
                DataPoint : '@UI.DataPoint#radialChart',
        }]
    },
    UI.LineItem #tableMacro: [
        //{ $Type: 'UI.DataFieldForAction', Action: 'CatalogService.MainCds/myAction', Label: 'Create Material Documents' },
         {
            $Type: 'UI.DataField',
            Value: CprodOrd,
            Label: '{i18n>combOrder}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Material,
            Label: '{i18n>material}',
            ![@HTML5.CssDefaults] : {
                width : '8%',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: ProductDescription,
            Label: '{i18n>productDescription}',
            ![@HTML5.CssDefaults] : {
                width : '8%',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Batch,
            Label: '{i18n>batch}',
        },
        {
            $Type: 'UI.DataField',
            Value: Plant,
            Label: '{i18n>plant}',
        },
        {
            $Type: 'UI.DataField',
            Value: StockMaterial,
            Label: 'StockMaterial',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: StockMaterialUnitMeasure,
            Label: 'StockMaterialUnitMeasure',
            ![@HTML5.CssDefaults] : {
                width : '3rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value: AvaibilityQtyDefaultStorage,
            Label: '{i18n>avaibilityQtyDefaultStorage}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value: AvaibilityQtyProdStorage,
            Label: '{i18n>avaibilityQtyProdStorage}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#radialChart',
            Label   : '{i18n>radialChart}',
        },
        {
            $Type : 'UI.DataField',
            Value: QtyToIssue,
            Label: '{i18n>qtyToIssue}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value: TotalDeliveryQty,
            Label: '{i18n>totalDelQty}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalQuantityInEntryUnit,
            Label: 'TotalQuantityInEntryUnit',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalRequiredQuantity,
            Label: '{i18n>totReqQty}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalWithdrawnQuantity,
            Label: 'TotalWithdrawnQuantity',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Lgort1,
            Label: '{i18n>lgort1}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Lgort2,
            Label: '{i18n>lgort2}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalDefaultAllocQty,
            Label: '{i18n>totalDefaultAllocQty}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalAllocQty,
            Label: '{i18n>KittingAllocQty}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalAllocQtyCustom,
            Label: '{i18n>totalAllocQty}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotMagDefault,
            Label: '{i18n>TotMagDefault}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotMagProd,
            Label: '{i18n>TotMagProd}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalConfdQtyForATPInBaseUoM,
            Label: 'TotalConfdQtyForATPInBaseUoM',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: TotalProdAllocQty,
            Label: 'TotalProdAllocQty',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: IssuedDefQty,
            Label: 'IssuedDefQty',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: IssuedProdQty,
            Label: 'IssuedProdQty',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: InventorySpecialStockType,
            Label: '{i18n>inventorySpecialStockType}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: requirementtype,
            Label: '{i18n>requirementtype}',
            ![@UI.Hidden],
        }
        /*{
            $Type: 'UI.DataField',
            Value: Supplier,
            Label: '{i18n>supplier}',
            ![@HTML5.CssDefaults] : {
                width : '5rem',
            },
        }*/
    ]
);
annotate CatalogService.MainCds with {
    Material @Common.Text : {
        $value : to_ZZ1_C_PRODUCT.Product_Text,
        ![@UI.TextArrangement] : #TextLast
    }
};

