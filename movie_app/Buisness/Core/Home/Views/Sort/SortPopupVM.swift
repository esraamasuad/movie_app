//
//  SortPopupVM.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import Bond

class SortPopupVM: BaseVM {
    
    private var routingManeger: RouterManager
    
    var isPopular: DynamicObjects<Bool> = DynamicObjects(false)
    
    var selectedSort: String
    
    init(routingManeger: RouterManager,_ selectedSort: String) {
        self.routingManeger = routingManeger
        self.selectedSort = selectedSort
    }
    
    func setData(){
        isPopular.value = (selectedSort == MovieSort.popular.rawValue)
    }
    
    func dismiss() {
        routingManeger.dismiss()
    }
    
}
