//
//  LoansService.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 02.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol UserServiceDelegate {
  func didReciveUsers(users: [User])
  func didFaildWithError(error: Error)
}

class UserService: NSObject {
  var delegate: UserServiceDelegate?
  
  func getUsers() {
    Alamofire.request(API.getUsers).responseArray(queue: DispatchQueue.main, keyPath: "") { (response: DataResponse<[User]>) in
      switch response.result {
      case .success(let value):
        self.delegate?.didReciveUsers(users: value)
      case .failure(let error):
        self.delegate?.didFaildWithError(error: error)
      }
      
    }
  }
}

