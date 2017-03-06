//
//  User.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 03.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
  var name: String!
  var id: Int!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
  }
}
