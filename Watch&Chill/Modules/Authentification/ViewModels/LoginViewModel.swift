//
//  LoginViewModel.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation

class LoginViewModel{
  var usersArray : [User] = []         
  func checkUserDefaults(){
  if let users = UserDefaults.standard.string(forKey: "Users") {
      print("List of users is :\n \(users)")
      let usersData = users.data(using: .utf8)
      usersArray = try! JSONDecoder().decode([User].self, from: usersData!)
      for user in usersArray {
        print(user)
      }
    }
  }
  func generateToken(username: String, password: String) {
    AuthNetworkingManager.generateToken{ result in
      switch result {
      case .success(let login):
        self.login(username: username, password: password,requestToken: login.request_token!)
      case .failure(let error):
        print("Stooop")
        print(error.localizedDescription)
      }
    }
  }
  
  func login(username: String, password: String, requestToken : String) {
    AuthNetworkingManager.login(username: username, password: password, request_token:requestToken){ result in
      switch result {
      case .success(let signin):
        print(signin)
        self.createSession(requestToken: requestToken)
      case .failure(let error):
        print(error.localizedDescription)
        
      }
    }
  }
  
  func createSession( requestToken : String) {
    AuthNetworkingManager.createSession(request_token: requestToken){ result in
      switch result {
      case .success(let session):
        print(session)
      case .failure(let error):
        print(error.localizedDescription)
        
      }
    }
  }
}
