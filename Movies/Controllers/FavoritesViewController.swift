//
//  FavoritesViewController.swift
//  Movies
//
//  Created by Kleyson on 10/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//

import UIKit
import Kingfisher

class FavoritesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    private var movies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.movies = Favorites.getFavorites()
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
}

extension FavoritesViewController: UITableViewDataSource {
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

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
