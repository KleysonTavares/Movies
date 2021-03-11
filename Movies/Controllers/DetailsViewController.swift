//
//  DetailsViewController.swift
//  Movies
//
//  Created by Kleyson on 10/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var movie: Movie?
    var genres: [Genre]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let movies = Favorites.getFavorites()
        for item in movies {
            self.movie?.isFavorite = (item.id == self.movie?.id)
        }
        
        if self.movie?.isFavorite == true {
            toggleButton(false)
        }
        else {
            toggleButton(true)
        }
    }
    
    private func setupMovie(){
        if let movie = self.movie {
            let url = URL(string: Endpoints.image + movie.poster_path)
            movieImageView.kf.indicatorType = .activity
            movieImageView.kf.setImage(with: url)
            dateLabel.text = movie.release_date
            genresLabel.text = String(identifyGenre().dropLast())
            descriptionLabel.text = movie.overview
            navigationItem.title = movie.title
        }
    }
    
    private func identifyGenre() -> String {
        if let genres = self.genres{
            for item in genres {
                if movie?.genre_ids.contains(item.id) ?? false {
                    return " \(item.name),"
                }
            }
        }
        return ""
    }
    
    @IBAction func favoriteButon(_ sender: UIButton) {
        if self.movie?.isFavorite == true {
            toggleButton(true)
            var movies = Favorites.getFavorites()
            if let index = movies.firstIndex(where: {$0.id == self.movie?.id }){
                movies.remove(at: index)
                Favorites.salveFavorites(movies: movies)
                self.movie?.isFavorite = false
            }
            else {
                presentError(message: "não foi possível desfavoritar o filme")
            }
            
        } else {
            toggleButton(false)
            var movies = Favorites.getFavorites()
            self.movie?.isFavorite = true
            movies.append(self.movie!)
            Favorites.salveFavorites(movies: movies)
        }
    }
    
    func toggleButton(_ bool: Bool){
        if bool {
            favoriteButton.setImage(UIImage(named: "FavoriteOff"), for: .normal)
        }
        else {
            favoriteButton.setImage(UIImage(named: "FavoriteOn"), for: .normal)
        }
    }
    
    func presentError(message: String) {
        let alert = UIAlertController(title: "ops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
