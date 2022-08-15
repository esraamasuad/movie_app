//
//  SortPopupView.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import UIKit

class SortPopupView: BaseView<SortPopupVM, SortPopupItem> {
    
    @IBOutlet weak var popularView: UIView!
    @IBOutlet weak var topRatedView: UIView!
    @IBOutlet weak var cornerView: UIView!
    
    override func bindind() {
        viewModel = SortPopupVM(routingManeger: RouterManagerImpl(self), item.selectedSort)
        cornerView.layer.cornerRadius = 15
        cornerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        viewModel.isPopular.bind {[self] isPopular in
            viewModel.selectedSort = isPopular ? MovieSort.popular.rawValue : MovieSort.topRated.rawValue
            popularView.backgroundColor = isPopular ? .assetColor : .white
            topRatedView.backgroundColor = isPopular ? .white : .assetColor
        }
        viewModel.setData()
    }
    
}

extension SortPopupView {
    @IBAction func popularAction(_ button: UIButton){
        viewModel.isPopular.value = true
    }
    
    @IBAction func topRatedAction(_ button: UIButton){
        viewModel.isPopular.value = false
    }
    
    @IBAction func searchAction(_ button: UIButton){
        item.newSort(viewModel.selectedSort)
        viewModel.dismiss()
    }
    
    @IBAction func dismissAction(_ button: UIButton){
        viewModel.dismiss()
    }
}
