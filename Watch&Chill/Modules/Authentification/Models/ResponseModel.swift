//
//  ResponseModel.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation

struct LoginResponseModel:Codable {
  let success: Bool?
  let expires_at: String?
  let request_token: String?
}
extension LoginResponseModel {
  enum CodingKeys: String, CodingKey {
    case success = "success"
    case expires_at = "expires_at"
    case request_token = "request_token"
  }
}
