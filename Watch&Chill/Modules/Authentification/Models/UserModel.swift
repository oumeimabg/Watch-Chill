//
//  UserModel.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation

struct User: Codable {
  var username : String
  var password : String
  var session_id : String
}
extension LoginResponseModel {
  enum CodingKeyUser: String, CodingKey {
    case username = "username"
    case password = "password"
    case session_id = "session_id"
  }
}
