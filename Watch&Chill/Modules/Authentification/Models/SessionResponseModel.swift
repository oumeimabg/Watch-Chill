//
//  SessionResponseModel.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation
struct SessionResponseModel:Codable {
  let success: Bool?
  let session_id: String?
}
extension LoginResponseModel {
  enum CodingKeyss: String, CodingKey {
    case success = "success"
    case session_id = "session_id"
  }
}
