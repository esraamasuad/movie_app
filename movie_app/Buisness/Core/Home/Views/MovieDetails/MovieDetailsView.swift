//
//  MovieDetailsView.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import UIKit
import Cosmos

class MovieDetailsView: BaseView<MovieDetailsVM, MovieDetailsItem> {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var overViewLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func bindind() {
        setTransparentNavagtionBar("")
        viewModel = MovieDetailsVM(routingManeger: RouterManagerImpl(self), item.details)
        viewModel.title.bind(to: titleLbl)
        viewModel.overView.bind(to: overViewLbl)
        viewModel.releaseDate.bind(to: dateLbl)
        viewModel.rate.bind { rate in
            self.ratingView.rating = rate
        }
        viewModel.posterImage.bind { img in
            self.posterImage.loadWebImageWithUrl(imageUrl: img)
        }
        viewModel.backdropImage.bind { img in
            self.backdropImage.loadWebImageWithUrl(imageUrl: img)
        }
        viewModel.setData()
    }
    
}
