//
//  ItemDetail.swift
//  iDine
//
//  Created by Thai Nguyen on 9/27/19.
//  Copyright © 2019 Thai Nguyen. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    
    @EnvironmentObject var favorite: Favorite
    
    @State var isFavorite = false
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order this") {
                self.order.add(item: self.item)
                }.font(.largeTitle).background(Color.yellow).cornerRadius(15).padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: handleFavorite) {
            Image(systemName: favorite.items.contains(item) ? "star.fill" : "star").font(.title)
            })
    }
    
    func handleFavorite() {
        if !self.favorite.items.contains(self.item) {
            self.favorite.add(item: self.item)
            self.isFavorite = true
        } else {
            self.favorite.remove(item: self.item)
            self.isFavorite = false
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static let favorite = Favorite()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order).environmentObject(favorite)
        }
    }
}
