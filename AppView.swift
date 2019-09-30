//
//  AppView.swift
//  iDine
//
//  Created by Thai Nguyen on 9/27/19.
//  Copyright © 2019 Thai Nguyen. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
            FavoriteView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    
    static let favorite = Favorite()
    
    static var previews: some View {
        AppView().environmentObject(order).environmentObject(favorite)
    }
}
