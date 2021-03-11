//
//  Movies.swift
//  Movies
//
//  Created by Kleyson on 03/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//

import Foundation
struct Movies: Codable {
    let results : [Movie]
    let total_results: Int
    let total_pages: Int
}

class Movie: Codable  {
    let poster_path: String
    let overview: String
    let release_date: String
    let genre_ids:[Int]
    let id: Int
    let title: String
    let backdrop_path: String
    var isFavorite: Bool? = false
}
