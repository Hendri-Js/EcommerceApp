//
//  ProductDetailView.swift
//  EcommerceApp
//
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State var addToCartAlert = false
    @Environment(CartManager.self) var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(product.image)
                    .bannerImageStyle()
                Group {
                    Text(product.title)
                        .font(.system(size: 20, weight: .medium))
                        .padding(.bottom, 5)
                    Text(product.description)
                        .font(.system(size: 15))
                        .padding(.bottom, 15)
                    Button(action: {
                        cartManager.addToCart(product: product)
                        addToCartAlert = true
                    }, label: {
                        Text("カートに追加")
                    })
                    .buttonStyle(PrimaryButtonStyle())
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .alert("カートに追加されました", isPresented: $addToCartAlert, actions: {
            Button(role: .none) {
                
            } label: {
                Text("OK")
            }
        }, message: {
            Text("\(product.title) をカートに追加しました！")
        })
    }
}

#Preview {
    ProductDetailView(product: ProductsClient.fetchProducts()[0])
        .environment(CartManager())
}
