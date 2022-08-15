//
//  Dynamic.swift
//  SwiftMVVMStartupProject
//
//  Created by Esraa on 6/15/20.
//  Copyright © 2020 Esraa Masuad. All rights reserved.
//

import Foundation

class DynamicObjects<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
}
