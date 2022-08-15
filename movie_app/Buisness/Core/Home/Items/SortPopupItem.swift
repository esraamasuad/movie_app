//
//  SortPopupItem.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import Foundation

class SortPopupItem: BaseItem {
    var selectedSort: String
    var newSort: ((_ s: String) -> ())!
    
    init(_ selectedSort: String, newSort: @escaping ((_ s: String) -> ())) {
        self.selectedSort = selectedSort
        self.newSort = newSort
    }
}
