//
//  APIConfiguration.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration : URLRequestConvertible {
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: Parameters? { get }
}

