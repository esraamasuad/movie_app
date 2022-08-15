//
//  AppDelegate.swift
//  it_graduate_new
//
//  Created by Mahmoud Ibaraheim on 6/29/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setLanguage()
        setNavStyle()
        
    //    self.window = UIWindow(frame:UIScreen.main.bounds)
   
        return true
    }
    
    func setLanguage(){
        UILabel.appearance().substituteFontName = "AppRegularFont".localize()
        UILabel.appearance().substituteFontNameBold = "AppBoldFont".localize()
    }
    
    func setNavStyle(){
        UINavigationBar.appearance().tintColor = UIColor.assetColor
        UINavigationBar.appearance().barTintColor = UIColor.navColor
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //    UsersConnectedSocket.instance.userDisconnected()
    }
    
}

