//
//  BasePresenter.swift
//  SwiftMVVMStartupProject
//
//  Created by Esraa on 6/15/20.
//  Copyright © 2020 Esraa Masuad. All rights reserved.
//

import Foundation

class BaseVM {
    
    init() {
        hydrate()
    }
    
    func hydrate() {}
    
    private var errorMessage: DynamicObjects<String> = DynamicObjects("")
    private var alertMessage: DynamicObjects<String> = DynamicObjects("")
    var isLoading: DynamicObjects<Bool> = DynamicObjects(false)
    var hudLoading: DynamicObjects<Bool> = DynamicObjects(false)

    func showSystemError(error: Error) {
        errorMessage.value = error.localizedDescription
    }
    
    func showErrorAlert(message: String) {
        errorMessage.value = message
    }
    
    func showSystemAlert(alert: String) {
        alertMessage.value = alert
    }

    func implementErrorMessage(_ listener: @escaping (String) -> Void) {
        errorMessage.bind(listener)
    }
    
    func implementAlert(_ listener: @escaping (String) -> Void) {
        alertMessage.bind(listener)
    }
    
    func showHudLoading() {
        hudLoading.value = true
    }
    func showLoading() {
        isLoading.value = true
    }
    
    func hideLoading() {
        isLoading.value = false
    }
     
    
}
