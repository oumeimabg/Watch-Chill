//
//  Constants.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation

struct ProductionServer {
       static let baseURL = "https://api.themoviedb.org/3/"
   }
   
   struct APIParameterKey {
      static let APIkey = "5b41ee2e258ffa81ad6c6bd65a184c83"
    static let username = "username"
    static let password = "password"
    static let request_token = "request_token"
   }

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
enum ContentType: String {
    case json = "application/json"
}


