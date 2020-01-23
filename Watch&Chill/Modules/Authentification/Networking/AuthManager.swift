//
//  AuthManager.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation
import Alamofire

class AuthNetworkingManager {
  //General request
  @discardableResult
  private static func performRequest<T:Decodable>(route:AuthRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
    return AF.request(route)
      .responseDecodable (decoder: decoder){ (response: DataResponse<T ,AFError>) in
        completion(response.result)
        debugPrint(response)
    }
  }
  //Generate Token
  static func generateToken(completion:@escaping (AFResult<LoginResponseModel>)->Void) {
    performRequest(route: AuthRouter.generateToken(key: APIParameterKey.APIkey), completion: completion)
  }
  //Login
  static func login(username: String, password: String, request_token:String, completion:@escaping (AFResult<LoginResponseModel>)->Void) {
    performRequest(route: AuthRouter.login(key : APIParameterKey.APIkey,username: username, password: password, request_token: request_token), completion: completion)
  }
  //Create session
  static func createSession(request_token:String, completion:@escaping (AFResult<SessionResponseModel>)->Void) {
    performRequest(route: AuthRouter.createSession(key : APIParameterKey.APIkey, request_token: request_token), completion: completion)
  }
}
