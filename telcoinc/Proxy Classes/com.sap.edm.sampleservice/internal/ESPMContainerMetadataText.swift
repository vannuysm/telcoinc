// # Proxy Compiler 17.12.1-7fb011-20180122

import Foundation
import SAPOData

internal class ESPMContainerMetadataText {
    internal static let xml: String = "<?xml version=\"1.0\" ?><edmx:Edmx Version=\"1.0\" xmlns:edmx=\"http://schemas.microsoft.com/ado/2007/06/edmx\"><edmx:DataServices m:DataServiceVersion=\"1.0\" xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\"><Schema Namespace=\"ESPM\" xmlns=\"http://schemas.microsoft.com/ado/2008/09/edm\"><EntityType Name=\"ProductText\"><Key><PropertyRef Name=\"Id\"/></Key><Property Name=\"Id\" Type=\"Edm.Int64\" Nullable=\"false\"/><Property Name=\"Language\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"2\"/><Property Name=\"LongDescription\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"255\"/><Property Name=\"Name\" Type=\"Edm.String\"/><Property Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"ShortDescription\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"255\"/></EntityType><EntityType Name=\"ProductCategory\"><Key><PropertyRef Name=\"Category\"/></Key><Property Name=\"Category\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"40\"/><Property Name=\"CategoryName\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"MainCategory\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"MainCategoryName\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"NumberOfProducts\" Type=\"Edm.Int64\" Nullable=\"true\"/><Property Name=\"UpdatedTimestamp\" Type=\"Edm.DateTime\"/></EntityType><EntityType Name=\"PurchaseOrderItem\"><Key><PropertyRef Name=\"ItemNumber\"/><PropertyRef Name=\"PurchaseOrderId\"/></Key><Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"5\"/><Property Name=\"GrossAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"NetAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"ItemNumber\" Type=\"Edm.Int32\" Nullable=\"false\"/><Property Name=\"PurchaseOrderId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/><Property Name=\"Quantity\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"3\"/><Property Name=\"QuantityUnit\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"3\"/><Property Name=\"TaxAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><NavigationProperty Name=\"ProductDetails\" Relationship=\"ESPM.PurchaseOrderItem_Product_One_One0\" FromRole=\"PurchaseOrderItem\" ToRole=\"Product\"/><NavigationProperty Name=\"Header\" Relationship=\"ESPM.PurchaseOrderItem_PurchaseOrderHeader_Many_One0\" FromRole=\"PurchaseOrderItem\" ToRole=\"PurchaseOrderHeader\"/></EntityType><EntityType Name=\"Supplier\"><Key><PropertyRef Name=\"SupplierId\"/></Key><Property Name=\"City\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"Country\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"3\"/><Property Name=\"EmailAddress\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"255\"/><Property Name=\"HouseNumber\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"PhoneNumber\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"30\"/><Property Name=\"PostalCode\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"Street\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"60\"/><Property Name=\"SupplierId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/><Property Name=\"SupplierName\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"80\"/><Property Name=\"UpdatedTimestamp\" Type=\"Edm.DateTime\"/><NavigationProperty Name=\"Products\" Relationship=\"ESPM.Supplier_Product_One_Many0\" FromRole=\"Supplier\" ToRole=\"Product\"/></EntityType><EntityType Name=\"Customer\"><Key><PropertyRef Name=\"CustomerId\"/></Key><Property Name=\"City\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"Country\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"3\"/><Property Name=\"CustomerId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/><Property Name=\"DateOfBirth\" Type=\"Edm.DateTime\" Nullable=\"false\"/><Property Name=\"EmailAddress\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"255\"/><Property Name=\"FirstName\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"HouseNumber\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"LastName\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"PhoneNumber\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"30\"/><Property Name=\"PostalCode\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"Street\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"60\"/><Property Name=\"UpdatedTimestamp\" Type=\"Edm.DateTime\"/></EntityType><EntityType Name=\"Stock\"><Key><PropertyRef Name=\"ProductId\"/></Key><Property Name=\"LotSize\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"3\"/><Property Name=\"MinStock\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"3\"/><Property Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"255\"/><Property Name=\"Quantity\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"3\"/><Property Name=\"QuantityLessMin\" Type=\"Edm.Boolean\" Nullable=\"true\"/><Property Name=\"UpdatedTimestamp\" Type=\"Edm.DateTime\"/><NavigationProperty Name=\"ProductDetails\" Relationship=\"ESPM.Stock_Product_One_One0\" FromRole=\"Stock\" ToRole=\"Product\"/></EntityType><EntityType Name=\"SalesOrderItem\"><Key><PropertyRef Name=\"ItemNumber\"/><PropertyRef Name=\"SalesOrderId\"/></Key><Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"5\"/><Property Name=\"DeliveryDate\" Type=\"Edm.DateTime\" Nullable=\"true\"/><Property Name=\"GrossAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"ItemNumber\" Type=\"Edm.Int32\" Nullable=\"false\"/><Property Name=\"SalesOrderId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/><Property Name=\"NetAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"Quantity\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"3\"/><Property Name=\"QuantityUnit\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"3\"/><Property Name=\"TaxAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><NavigationProperty Name=\"ProductDetails\" Relationship=\"ESPM.SalesOrderItem_Product_One_One0\" FromRole=\"SalesOrderItem\" ToRole=\"Product\"/><NavigationProperty Name=\"Header\" Relationship=\"ESPM.SalesOrderItem_SalesOrderHeader_Many_One0\" FromRole=\"SalesOrderItem\" ToRole=\"SalesOrderHeader\"/></EntityType><EntityType Name=\"PurchaseOrderHeader\"><Key><PropertyRef Name=\"PurchaseOrderId\"/></Key><Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"5\"/><Property Name=\"GrossAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"NetAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"PurchaseOrderId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/><Property Name=\"SupplierId\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"TaxAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><NavigationProperty Name=\"Items\" Relationship=\"ESPM.PurchaseOrderItem_PurchaseOrderHeader_Many_One0\" FromRole=\"PurchaseOrderHeader\" ToRole=\"PurchaseOrderItem\"/></EntityType><EntityType Name=\"SalesOrderHeader\"><Key><PropertyRef Name=\"SalesOrderId\"/></Key><Property Name=\"CreatedAt\" Type=\"Edm.DateTime\" Nullable=\"true\"/><Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"5\"/><Property Name=\"CustomerId\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"GrossAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"LifeCycleStatus\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"1\"/><Property Name=\"LifeCycleStatusName\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"255\"/><Property Name=\"NetAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><Property Name=\"SalesOrderId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/><Property Name=\"TaxAmount\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"15\" Scale=\"3\"/><NavigationProperty Name=\"CustomerDetails\" Relationship=\"ESPM.SalesOrderHeader_Customer_One_One0\" FromRole=\"SalesOrderHeader\" ToRole=\"Customer\"/><NavigationProperty Name=\"Items\" Relationship=\"ESPM.SalesOrderItem_SalesOrderHeader_Many_One0\" FromRole=\"SalesOrderHeader\" ToRole=\"SalesOrderItem\"/></EntityType><EntityType Name=\"Product\" m:HasStream=\"true\"><Key><PropertyRef Name=\"ProductId\"/></Key><Property Name=\"Category\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"CategoryName\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"40\"/><Property Name=\"CurrencyCode\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"5\"/><Property Name=\"DimensionDepth\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"4\"/><Property Name=\"DimensionHeight\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"4\"/><Property Name=\"DimensionUnit\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"3\"/><Property Name=\"DimensionWidth\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"4\"/><Property Name=\"LongDescription\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"255\"/><Property Name=\"Name\" Type=\"Edm.String\"/><Property Name=\"PictureUrl\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"255\"/><Property Name=\"Price\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"23\" Scale=\"3\"/><Property Name=\"ProductId\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"10\"/><Property Name=\"QuantityUnit\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"3\"/><Property Name=\"ShortDescription\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"255\"/><Property Name=\"SupplierId\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"10\"/><Property Name=\"UpdatedTimestamp\" Type=\"Edm.DateTime\"/><Property Name=\"Weight\" Type=\"Edm.Decimal\" Nullable=\"true\" Precision=\"13\" Scale=\"3\"/><Property Name=\"WeightUnit\" Type=\"Edm.String\" Nullable=\"true\" MaxLength=\"3\"/><NavigationProperty Name=\"StockDetails\" Relationship=\"ESPM.Product_Stock_One_One1\" FromRole=\"Product\" ToRole=\"Stock\"/><NavigationProperty Name=\"SupplierDetails\" Relationship=\"ESPM.Supplier_Product_One_Many0\" FromRole=\"Product\" ToRole=\"Supplier\"/></EntityType><Association Name=\"Stock_Product_One_One0\"><End Type=\"ESPM.Stock\" Multiplicity=\"1\" Role=\"Stock\"/><End Type=\"ESPM.Product\" Multiplicity=\"1\" Role=\"Product\"/><ReferentialConstraint><Principal Role=\"Product\"><PropertyRef Name=\"ProductId\"/></Principal><Dependent Role=\"Stock\"><PropertyRef Name=\"ProductId\"/></Dependent></ReferentialConstraint></Association><Association Name=\"PurchaseOrderItem_PurchaseOrderHeader_Many_One0\"><End Type=\"ESPM.PurchaseOrderItem\" Multiplicity=\"*\" Role=\"PurchaseOrderItem\"/><End Type=\"ESPM.PurchaseOrderHeader\" Multiplicity=\"1\" Role=\"PurchaseOrderHeader\"/><ReferentialConstraint><Principal Role=\"PurchaseOrderHeader\"><PropertyRef Name=\"PurchaseOrderId\"/></Principal><Dependent Role=\"PurchaseOrderItem\"><PropertyRef Name=\"PurchaseOrderId\"/></Dependent></ReferentialConstraint></Association><Association Name=\"SalesOrderHeader_Customer_One_One0\"><End Type=\"ESPM.SalesOrderHeader\" Multiplicity=\"1\" Role=\"SalesOrderHeader\"/><End Type=\"ESPM.Customer\" Multiplicity=\"1\" Role=\"Customer\"/></Association><Association Name=\"SalesOrderItem_SalesOrderHeader_Many_One0\"><End Type=\"ESPM.SalesOrderItem\" Multiplicity=\"*\" Role=\"SalesOrderItem\"/><End Type=\"ESPM.SalesOrderHeader\" Multiplicity=\"1\" Role=\"SalesOrderHeader\"/><ReferentialConstraint><Principal Role=\"SalesOrderHeader\"><PropertyRef Name=\"SalesOrderId\"/></Principal><Dependent Role=\"SalesOrderItem\"><PropertyRef Name=\"SalesOrderId\"/></Dependent></ReferentialConstraint></Association><Association Name=\"Supplier_Product_One_Many0\"><End Type=\"ESPM.Supplier\" Multiplicity=\"1\" Role=\"Supplier\"/><End Type=\"ESPM.Product\" Multiplicity=\"*\" Role=\"Product\"/></Association><Association Name=\"Product_Stock_One_One1\"><End Type=\"ESPM.Product\" Multiplicity=\"1\" Role=\"Product\"/><End Type=\"ESPM.Stock\" Multiplicity=\"1\" Role=\"Stock\"/></Association><Association Name=\"SalesOrderItem_Product_One_One0\"><End Type=\"ESPM.SalesOrderItem\" Multiplicity=\"1\" Role=\"SalesOrderItem\"/><End Type=\"ESPM.Product\" Multiplicity=\"1\" Role=\"Product\"/></Association><Association Name=\"PurchaseOrderItem_Product_One_One0\"><End Type=\"ESPM.PurchaseOrderItem\" Multiplicity=\"1\" Role=\"PurchaseOrderItem\"/><End Type=\"ESPM.Product\" Multiplicity=\"1\" Role=\"Product\"/></Association><EntityContainer Name=\"ESPMContainer\" m:IsDefaultEntityContainer=\"true\"><EntitySet Name=\"ProductTexts\" EntityType=\"ESPM.ProductText\"/><EntitySet Name=\"ProductCategories\" EntityType=\"ESPM.ProductCategory\"/><EntitySet Name=\"PurchaseOrderItems\" EntityType=\"ESPM.PurchaseOrderItem\"/><EntitySet Name=\"Suppliers\" EntityType=\"ESPM.Supplier\"/><EntitySet Name=\"Customers\" EntityType=\"ESPM.Customer\"/><EntitySet Name=\"Stock\" EntityType=\"ESPM.Stock\"/><EntitySet Name=\"SalesOrderItems\" EntityType=\"ESPM.SalesOrderItem\"/><EntitySet Name=\"PurchaseOrderHeaders\" EntityType=\"ESPM.PurchaseOrderHeader\"/><EntitySet Name=\"SalesOrderHeaders\" EntityType=\"ESPM.SalesOrderHeader\"/><EntitySet Name=\"Products\" EntityType=\"ESPM.Product\"/><AssociationSet Name=\"Stock_Product_One_One0Set\" Association=\"ESPM.Stock_Product_One_One0\"><End EntitySet=\"Stock\" Role=\"Stock\"/><End EntitySet=\"Products\" Role=\"Product\"/></AssociationSet><AssociationSet Name=\"PurchaseOrderItem_PurchaseOrderHeader_Many_One0Set\" Association=\"ESPM.PurchaseOrderItem_PurchaseOrderHeader_Many_One0\"><End EntitySet=\"PurchaseOrderItems\" Role=\"PurchaseOrderItem\"/><End EntitySet=\"PurchaseOrderHeaders\" Role=\"PurchaseOrderHeader\"/></AssociationSet><AssociationSet Name=\"SalesOrderHeader_Customer_One_One0Set\" Association=\"ESPM.SalesOrderHeader_Customer_One_One0\"><End EntitySet=\"SalesOrderHeaders\" Role=\"SalesOrderHeader\"/><End EntitySet=\"Customers\" Role=\"Customer\"/></AssociationSet><AssociationSet Name=\"SalesOrderItem_SalesOrderHeader_Many_One0Set\" Association=\"ESPM.SalesOrderItem_SalesOrderHeader_Many_One0\"><End EntitySet=\"SalesOrderItems\" Role=\"SalesOrderItem\"/><End EntitySet=\"SalesOrderHeaders\" Role=\"SalesOrderHeader\"/></AssociationSet><AssociationSet Name=\"Supplier_Product_One_Many0Set\" Association=\"ESPM.Supplier_Product_One_Many0\"><End EntitySet=\"Suppliers\" Role=\"Supplier\"/><End EntitySet=\"Products\" Role=\"Product\"/></AssociationSet><AssociationSet Name=\"Product_Stock_One_One1Set\" Association=\"ESPM.Product_Stock_One_One1\"><End EntitySet=\"Products\" Role=\"Product\"/><End EntitySet=\"Stock\" Role=\"Stock\"/></AssociationSet><AssociationSet Name=\"SalesOrderItem_Product_One_One0Set\" Association=\"ESPM.SalesOrderItem_Product_One_One0\"><End EntitySet=\"SalesOrderItems\" Role=\"SalesOrderItem\"/><End EntitySet=\"Products\" Role=\"Product\"/></AssociationSet><AssociationSet Name=\"PurchaseOrderItem_Product_One_One0Set\" Association=\"ESPM.PurchaseOrderItem_Product_One_One0\"><End EntitySet=\"PurchaseOrderItems\" Role=\"PurchaseOrderItem\"/><End EntitySet=\"Products\" Role=\"Product\"/></AssociationSet><FunctionImport Name=\"GenerateSamplePurcharOrders\" ReturnType=\"Edm.Boolean\" m:HttpMethod=\"POST\"/><FunctionImport Name=\"GenerateSampleSalesOrders\" ReturnType=\"Edm.Boolean\" m:HttpMethod=\"POST\"/><FunctionImport Name=\"ResetSampleData\" ReturnType=\"Edm.Boolean\" m:HttpMethod=\"POST\"/><FunctionImport Name=\"UpdateSalesOrderStatus\" ReturnType=\"Edm.Boolean\" m:HttpMethod=\"POST\"><Parameter Name=\"id\" Type=\"Edm.String\" Nullable=\"false\"/><Parameter Name=\"newStatus\" Type=\"Edm.String\" Nullable=\"false\"/></FunctionImport></EntityContainer></Schema></edmx:DataServices></edmx:Edmx>\n"
}
