//
//  PetService.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 05.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol PetServiceDelegate {
  func didRecivePets(pets: [Dog])
  func didFaildWithError(error: Error)
}

class PetService: NSObject {
  var delegate: PetServiceDelegate?
  
  func getPets(userId: String) {
    Alamofire.request(API.getUsersPets(userId: userId)).responseArray(queue: DispatchQueue.main, keyPath: "") { (response: DataResponse<[Dog]>) in
      switch response.result {
      case .success(let value):
        self.delegate?.didRecivePets(pets: value)
      case .failure(let error):
        self.delegate?.didFaildWithError(error: error)
      }
    }
  }
}

