//
//  FavoriteView.swift
//  iDine
//
//  Created by Thai Nguyen on 9/28/19.
//  Copyright © 2019 Thai Nguyen. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorite.items) { item in
                    ItemRow(item: item)
                }
            }
            .navigationBarTitle("Favorite")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static let favorite = Favorite()
    
    static var previews: some View {
        FavoriteView().environmentObject(favorite)
    }
}
