//
//  EndPoints.swift
//  InChurch
//
//  Created by Kleyson on 03/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//
import Foundation

struct Endpoints {
    private static let baseUrl = "https://api.themoviedb.org/3"
    static let movies = "\(baseUrl)/movie/popular\(privateKey)"
    static let details = "\(baseUrl)/genre/movie/list\(privateKey)"
    static let image = "https://image.tmdb.org/t/p/original"
    private static let privateKey = "?api_key=f4a210b96ede81ae0a7e0cd21fcb391a"
}
