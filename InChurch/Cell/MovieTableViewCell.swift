//
//  MovieTableViewCell.swift
//  InChurch
//
//  Created by Kleyson on 11/02/2021.
//  Copyright © 2021 Kleyson Tavares. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(urlImage: String, titleMovie: String) {
        let url =  URL(string: Endpoints.image + urlImage)
        movieImage.kf.indicatorType = .activity
        movieImage.kf.setImage(with: url)
        titleMovieLabel.text = titleMovie
    }
}
