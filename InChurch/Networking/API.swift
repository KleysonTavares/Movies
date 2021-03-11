//
//  API.swift
//  InChurch
//
//  Created by Kleyson on 03/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved
//
import Foundation
import UIKit  
final class API {
    static func fetchMovies(completion: @escaping(Movies) -> Void, completionError: @escaping(String) -> Void) {
        guard let url  =  URL(string: Endpoints.movies) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil, let data = data {
                do {
                    let movies = try JSONDecoder().decode(Movies.self, from: data)
                    DispatchQueue.main.async {
                        completion(movies)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionError("não foi possível carregar os filmes")
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    completionError("Erro de conexão")
                }
            }
        }
        task.resume()
    }
    
    static func fetchGenres(completion: @escaping(Genres) -> Void, completionError: @escaping(String) -> Void) {
        guard let url  = URL(string: Endpoints.details) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil, let data = data {
                do {
                    let details = try JSONDecoder().decode(Genres.self, from: data)
                    DispatchQueue.main.async {
                        completion(details)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionError("não foi possível carregar os gêneros")
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    completionError("Erro de conexão")
                }
            }
        }
        task.resume()
    }
}
