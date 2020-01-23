//
//  AuthRouter.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation
import Alamofire

enum AuthRouter: APIConfiguration{
  case generateToken(key:String)
  case login(key:String, username:String, password:String, request_token:String)
  case createSession(key:String, request_token:String)
  
  var method: HTTPMethod {
    switch self {
    case .generateToken:
      return .get
    case .login:
      return .post
    case .createSession:
      return .post
    }
  }
  
  var path: String {
    switch self {
    case .generateToken:
      return "authentication/token/new"+"?api_key="+APIParameterKey.APIkey
    case .login:
      return "authentication/token/validate_with_login"+"?api_key="+APIParameterKey.APIkey
    case .createSession:
      return "authentication/session/new"+"?api_key="+APIParameterKey.APIkey
    }
  }
  
  var parameters: Parameters? {
    switch self {
    case .generateToken:
      return nil
    case .login(_,let username, let password, let request_token):
      return [APIParameterKey.username : username , APIParameterKey.password : password, APIParameterKey.request_token : request_token]
    case .createSession(_,let request_token):
      return [APIParameterKey.request_token : request_token]
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = ProductionServer.baseURL + path
    let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    var urlRequest = URLRequest(url: (URL.init(string: escapedAddress!)!))
    //  HTTP Method
    urlRequest.httpMethod = method.rawValue
    
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    //Parameters
    if let parameters = parameters {
      do {
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
      } catch {
        throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
      }
    }
    urlRequest.curlRepresentation()
    return urlRequest
    
  }
}


