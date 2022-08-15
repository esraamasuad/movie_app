//
//  BaseResponse.swift
//  
//
//  Created by Esraa on 9/6/20.
//  Copyright © 2020 Esraa Masuad. All rights reserved.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let message: String?
    let data: T?
   
    let results: T?
    let page: Int?
    let total_pages: Int?
   // let total_results: Int?
}
