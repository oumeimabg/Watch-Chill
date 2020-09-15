//
//  ErrorModel.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/27/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation
import Alamofire

enum Errors : Error {
  case invalidAPIKey
  case requestFailed
  
  
  var localizedDescription: String {
    switch self {
    case .requestFailed: return "401 The resource you requested could not be found."
    case .invalidAPIKey: return "404 Invalid API key: You must be granted a valid key."
    }
  }
}
