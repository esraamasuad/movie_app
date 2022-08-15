//
//  WebImageView.swift
//
//
//  Created by Esraa on 5/5/17.
//  Copyright © 2017 Esraa Masuad. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadUserWebImage(imageUrl:String, placeHolderImage:String) {
        let image = ("" + imageUrl)
        let urlStr = (image).addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        loadWebImage(imageUrl: urlStr!, placeHolder: UIImage(named: placeHolderImage)!)
    }
    
    func loadUserWebImage(imageUrl:String) {
        let image = ("" + imageUrl)
        let urlStr = (image).addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        loadWebImage(imageUrl: urlStr!, placeHolder: UIImage(named: "logo")!)
    }
    
    func loadWebImageWithUrl(imageUrl: String) {
        let image = ("https://image.tmdb.org/t/p/w185/" + imageUrl)
        let urlStr = image.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        loadWebImage(imageUrl: urlStr!, placeHolder: UIImage(named: "logo")!)
    }
    
    private func loadWebImage(imageUrl: String, placeHolder: UIImage) {
        self.startAnimating()
        self.kf.indicatorType = .activity
        let url = URL(string: imageUrl)
        self.kf.setImage(
            with: url,
            placeholder: placeHolder,
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
        ])
    }
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
      }
    
    
}

extension UIButton {
    
    func loadWebImageWithUrl(imageUrl: String) {
        let image = ("" + imageUrl)
        let urlStr = image.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        loadWebImage(imageUrl: urlStr!)
    }
    
    private func loadWebImage(imageUrl: String) {
        let url = URL(string: imageUrl)
        self.kf.setBackgroundImage(with: url, for: .normal)
    }
    
   
}
