//
//  MovieCollectionViewCell.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import UIKit
import Cosmos

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var ratingView: CosmosView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        posterImg.layer.cornerRadius = 15
        posterImg.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configure(_ movieDetails: MovieDetailsModel?) {
        posterImg.loadWebImageWithUrl(imageUrl: movieDetails?.poster_path ?? "")
        titleLbl.text = movieDetails?.title ?? ""
        dateLbl.text = movieDetails?.release_date ?? ""
      //  ratingView.rating = movieDetails?.vote_average ?? 0
    }

}
