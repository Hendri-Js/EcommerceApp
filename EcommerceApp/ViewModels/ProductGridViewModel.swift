//
//  ProductGridViewModel.swift
//  EcommerceApp
//
//

import Foundation
import SwiftUI

@Observable
class ProductGridViewModel {
    
    let filter: ProductFilter
    
    var products: [Product] {
        switch filter {
        case .all:
            return ProductsClient.fetchProducts()
        case .featured:
            return ProductsClient.fetchProducts().filter({ $0.isFeatured })
        case .highlyRated:
            return ProductsClient.fetchProducts().filter({ $0.rating > 4 })
        }
    }
    
    init(filter: ProductFilter) {
        self.filter = filter
    }
    
}
