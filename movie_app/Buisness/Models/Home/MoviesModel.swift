//
//  MoviesModel.swift
//  
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct MoviesModel: Codable {
    let page: Int
    let results: [MovieDetailsModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieDetailsModel: Codable {
    var title: String?
    var poster_path: String?
    var id: Int?
    var overview: String?
    var vote_average: Double?
    var backdrop_path: String?
    var release_date: String?
    var adult:Bool?
    var vote_count:Int?
    var video: Bool?
    var original_title: String?
}
