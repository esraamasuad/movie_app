//
//  HomeRepo.swift
//  ezra3_ios
//
//  Created by Esraa Masuad on 03/04/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Promises

protocol HomeRepo {
    func allMovies(filter: String) -> Promise<BaseResponse<[MovieDetailsModel]>>
    func movieDetails(movieID: Int) -> Promise<BaseResponse<MovieDetailsModel>>
}
