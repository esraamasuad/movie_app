//
//  AppColors.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/14/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit

// Refrencing color names from color set on Assets
extension UIColor {
    static let assetColor = UIColor(named: "assetColor")
    static let primaryColor = UIColor(named: "primaryColor")
    static let textColor = UIColor(named: "textColor")
    static let textPrimaryColor = UIColor(named: "primaryLabelColor")
    static let borderColor = UIColor(named: "borderColor")
    static let navColor = UIColor(named: "navColor")
    
    static let transBlackColor = UIColor(named: "borderColor")
    static let transPrimaryColor = UIColor(named: "transPrimaryColor")
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
