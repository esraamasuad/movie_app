//
//  MovieDetailsEndPoint.swift
//  ezra3_ios
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Foundation

struct MovieDetailsEndPoint: Endpoint {
    
    var urlPrefix: String = ""
    var service: EndpointService = .movie
    var method: EndpointMethod = .get
    var encoding: EndpointEncoding = .query
    var auth: AuthorizationHandler = NoneAuthorizationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]
    
    init(movieID: Int){
        urlPrefix = urlPrefix + "/\(movieID)"
    }
}
