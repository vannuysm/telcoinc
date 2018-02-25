//
// CollectionType.swift
// telcoinc
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 25/02/18
//

import Foundation

enum CollectionType: String {

    case customers = "Customers"
    case purchaseOrderHeaders = "PurchaseOrderHeaders"
    case stock = "Stock"
    case productTexts = "ProductTexts"
    case salesOrderItems = "SalesOrderItems"
    case productCategories = "ProductCategories"
    case salesOrderHeaders = "SalesOrderHeaders"
    case products = "Products"
    case suppliers = "Suppliers"
    case purchaseOrderItems = "PurchaseOrderItems"
    case none = ""

    static let all = [
        customers, purchaseOrderHeaders, stock, productTexts, salesOrderItems, productCategories, salesOrderHeaders, products, suppliers, purchaseOrderItems,
    ]
}
