//
//  MoviesListVM.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import Bond

enum MovieSort: String {
    case topRated = "top_rated"
    case popular = "popular"
}

class MoviesListVM: BaseVM {
    
    private var routingManeger: RouterManager
    private var homeRepo: HomeRepo =  HomeRepoImpl()
    
    var moviesList: DynamicObjects<[MovieDetailsModel]> = DynamicObjects([])
    var pullToRefresh: DynamicObjects<Bool> = DynamicObjects(false)
    var sorting:Observable<String> = Observable(MovieSort.popular.rawValue)

    var sortKey:String = MovieSort.popular.rawValue
    var currentPage:Int = 0
    
    init(routingManeger: RouterManager) {
        self.routingManeger = routingManeger
    }
        
    func reloadData(){
        sorting.value = (sortKey == MovieSort.popular.rawValue) ? "(Popular)" : "(Top Rated)"
        currentPage = 0
        moviesListEndPoint()
    }
    
    func routeToProductDetails(_ index:Int){
        let movieDetails = moviesList.value[index]
        routingManeger.push(view: .movieDetails, presenter: MovieDetailsVM.self,
                            item: MovieDetailsItem(movieDetails))
    }

    func routeToSortPopup(){
        routingManeger.present(view: .sortPopupView, presenter: SortPopupVM.self,
                            item: SortPopupItem(sortKey, newSort: reSort(_:)))
    }

    func reSort(_ newSort: String){
        if sortKey != newSort {
            sortKey = newSort
            reloadData()
        }
    }
    
    func moviesListEndPoint() {
        currentPage += 1
        pullToRefresh.value ? self.hideLoading() : self.showLoading()
        homeRepo.allMovies(filter: sortKey).then { (data) in
            let newMovies = data.results ?? []
            self.moviesList.value = newMovies
        }.catch { (error) in
            self.showSystemError(error: error)
        }.always {
            self.hideLoading()
        }
    }
    
}
