//
//  HomeRepoImpl.swift
//  ezra3_ios
//
//  Created by Esraa Masuad on 03/04/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Promises

class HomeRepoImpl: HomeRepo {
    
    private var network: NetworkService
    private var localData: LocalData
    
    init(network: NetworkService = NetworkServiceImpl(), localData: LocalData = LocalDataImpl()) {
        self.network = network
        self.localData = localData
    }
    
    func allMovies(filter: String) -> Promise<BaseResponse<[MovieDetailsModel]>> {
        return network.callModel(BaseResponse<[MovieDetailsModel]>.self, endpoint: MoviesEndPoint(filter: filter))
    }
    
    func movieDetails(movieID: Int) -> Promise<BaseResponse<MovieDetailsModel>> {
        return network.callModel(BaseResponse<MovieDetailsModel>.self, endpoint: MovieDetailsEndPoint(movieID: movieID))
    }
    
}
