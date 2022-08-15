//
//  Endpoint.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/14/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation

protocol Endpoint {
    var service: EndpointService {get set}
    var urlPrefix: String {get set}
   // var endpointVersion: Versions {get set}
    var method: EndpointMethod {get set}
    var auth: AuthorizationHandler {get set}
    var parameters: [String: Any] {get set}
    var encoding: EndpointEncoding {get set}
    var headers: [String: String] {get set}
    var multipart: [MultiPartModel] {get }
}

enum EndpointEncoding {
    case json
    case query
}

enum EndpointMethod: String {
    case get
    case post
    case put
    case delete
}

enum EndpointService: String {
  
    // home
    case movie = "movie"
    
   // https://api.themoviedb.org/3/movie/616037?api_key=c3422ab9470bab7e1b74476289f7af4d
     var url: String {
        return "https://api.themoviedb.org/3/\(self.rawValue)"
    }

}

extension Endpoint {
    var multipart: [MultiPartModel] {
        return []
    }
}
