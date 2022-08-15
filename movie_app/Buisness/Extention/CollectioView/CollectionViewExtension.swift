//
//  CollectionViewExtension.swift
//  
//
//  Created by Mac on 10/11/20.
//  Copyright © 2020 Esraa Masuad. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCell(idintifier: String){
        self.register(UINib(nibName: idintifier, bundle: nil), forCellWithReuseIdentifier: idintifier)
    }
    
    func scrollToFirstItem(limit: Int){
        let num = self.numberOfItems(inSection: 0)
        if (num) >= limit {
            self.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
}
