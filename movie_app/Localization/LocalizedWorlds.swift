//
//  LocalizedWorlds.swift
//
//
//  Created by Mac on 12/8/20.
//  Copyright © 2020 Esraa Masuad. All rights reserved.
//

import Foundation

enum LocalizedWorlds:String  {
 
    case ok = "Ok"
    case noData = "No Data!"
    case  AppBoldFont = "AppBoldFont"
    case AppRegularFont = "AppRegularFont"
    
    var localize: String {
        return self.rawValue.localize()
   }
}
