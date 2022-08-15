//
//  MovieDetailsVM.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import Bond

class MovieDetailsVM: BaseVM {
    
    private var routingManeger: RouterManager
    private var homeRepo: HomeRepo =  HomeRepoImpl()
    
    var posterImage: DynamicObjects<String> = DynamicObjects("")
    var backdropImage: DynamicObjects<String> = DynamicObjects("")
    var rate: DynamicObjects<Double> = DynamicObjects(0)
    var title: Observable<String> = Observable("")
    var overView: Observable<String> = Observable("")
    var releaseDate: Observable<String> = Observable("")
    
    var movieID:Int = 0
    var movieDetails: MovieDetailsModel?
    
    init(routingManeger: RouterManager,_ movieDetails:MovieDetailsModel?) {
        self.routingManeger = routingManeger
        self.movieDetails = movieDetails
    }
    
    func setData(){
        self.movieID = movieDetails?.id ?? 0
        posterImage.value = movieDetails?.poster_path ?? ""
        backdropImage.value = movieDetails?.backdrop_path ?? ""
        rate.value = movieDetails?.vote_average ?? 0
        title.value = movieDetails?.original_title ?? ""
        overView.value = movieDetails?.overview ?? ""
        releaseDate.value = movieDetails?.release_date ?? ""
    }
    
    func movieDetailsEndPoint() {
        self.showLoading()
        homeRepo.movieDetails(movieID: movieID).then { (movie) in
        }.catch { (error) in
            self.showSystemError(error: error)
        }.always {
            self.hideLoading()
        }
    }
    
}
