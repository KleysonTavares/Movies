//
//  ViewController.swift
//  InChurch
//
//  Created by Kleyson on 03/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var movies : [Movie] = []
    private var genres : [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchMovies()
        fetchGenres()
        title = "Filmes"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    private func fetchMovies() {
        API.fetchMovies(completion: { (movies) in
            self.movies = movies.results
            self.tableView.reloadData()
        }) { (error) in
            self.presentError(message: error)
        }
    }
    
    private func fetchGenres() {
        API.fetchGenres(completion: { (genres) in
            self.genres = genres.genres
        }) { (error) in
            self.presentError(message: error)
        }
    }
    
    func presentError(message: String) {
        let alert = UIAlertController(title: "ops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell {
            cell.setupCell(urlImage: movies[indexPath.row].backdrop_path, titleMovie: movies[indexPath.row].title)
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            detailsVC.movie = movies[indexPath.row]
            detailsVC.genres = self.genres
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
