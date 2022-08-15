//
//  RoutingManeger.swift
//  SwiftMVVMStartupProject
//
//  Created by Esraa on 6/14/20.
//  Copyright © 2020 Esraa Masuad. All rights reserved.
//

import Foundation
import UIKit

protocol RouterManager {
    func push<Presenter: BaseVM, Item: BaseItem>(view: View, presenter: Presenter.Type, item: Item )
    func present<Presenter: BaseVM, Item: BaseItem>(view: View, presenter: Presenter.Type, item: Item)
    func present(vc: UIViewController)
    //   func presentBottomSheet<Presenter: BaseVM, Item: BaseItem>(view: View, presenter: Presenter.Type, item: Item)
    func presentFullScreen<Presenter: BaseVM, Item: BaseItem>(view: View, presenter: Presenter.Type, item: Item)
    func pushNotPresenterController<ViewController: UIViewController>(view: View, controller: ViewController.Type)
    func routeToInitialController<ViewController: UIViewController>(view: View, controller: ViewController.Type)
    func popBack()
    func popNumOfViews(num: Int)
    func dismiss()
    func openMediaPlayer(url:String)
    func push(vc: UIViewController)
    func openShare(share:Any)
}

