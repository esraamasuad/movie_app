//
//  StartScreenRouting.swift
//  SwiftMVVMStartupProject
//
//  Created by Esraa on 6/14/20.
//  Copyright © 2020 Esraa Masuad. All rights reserved.
//

import Foundation
import UIKit

class StartScreenRoute {
    var window: UIWindow
    
    init(window: UIWindow = (UIApplication.shared.delegate?.window)!!) {
        self.window = window
    }
    
    private func routeTo<ViewController: UIViewController>(storyBoard: Storyboard, idintifier: String , controller: ViewController.Type){
        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle:nil)
        window.rootViewController =  UINavigationController.init(rootViewController: storyboard.instantiateViewController(withIdentifier: idintifier) as! ViewController)
    }
    
    private func navigateToHome<ViewController: UIViewController>(storyBoard: Storyboard, idintifier: String , controller: ViewController.Type){
    }
    

    func decideInitScreen() {
    }

}
