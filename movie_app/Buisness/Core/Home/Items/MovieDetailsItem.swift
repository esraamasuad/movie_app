//
//  MovieDetailsItem.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import Foundation

class MovieDetailsItem: BaseItem {
    var details: MovieDetailsModel?
    init(_ details: MovieDetailsModel?) {
        self.details = details
    }
}
