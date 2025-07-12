//
//  EcommerceAppApp.swift
//  EcommerceApp
//
//

import SwiftUI

@main
struct EcommerceAppApp: App {
    @State var favoritesManager = FavoritesManager()
    @State var cartManager = CartManager()
    @State var tabManager = TabManager()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabManager.selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("ホーム")
                    }
                    .tag(0)
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("カート")
                    }
                    .tag(1)
                FavoritesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("お気に入り")
                    }
                    .tag(2)
            }
            .environment(favoritesManager)
            .environment(cartManager)
            .environment(tabManager)
        }
    }
}
