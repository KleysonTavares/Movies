//
//  Favorites.swift
//  Movies
//
//  Created by Kleyson on 10/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//

import Foundation
struct Favorites {
    private static let key = "favorites"
    private static let defaults = UserDefaults.standard
    
    static func salveFavorites(movies:[Movie]) {
        defaults.set(try? PropertyListEncoder().encode(movies), forKey: key)
    }
    
    static  func getFavorites() -> [Movie] {
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            if let userData = try? PropertyListDecoder().decode([Movie].self, from: data) {
                return userData
            }
            return []
        } else {
            return []
        }
    }
}
