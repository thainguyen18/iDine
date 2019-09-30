//
//  Favorite.swift
//  iDine
//
//  Created by Thai Nguyen on 9/28/19.
//  Copyright © 2019 Thai Nguyen. All rights reserved.
//

import SwiftUI

class Favorite: ObservableObject {
    @Published var items = [MenuItem]()
    
    func add(item: MenuItem) {
        if !items.contains(item) {
            items.append(item)
        }
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
