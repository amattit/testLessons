//
//  Dog.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 03.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import Foundation
import ObjectMapper

class Dog: Mappable {
  var id: Int?
  var userId: Int?
  var name: String?
  var birthday: String?
  var descriptions: String?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    userId <- map["user_Id"]
    name <- map["name"]
    birthday <- map["birthday"]
    descriptions <- map["descriptions"]
  }
}
