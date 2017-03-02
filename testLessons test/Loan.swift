//
//  Loan.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import Foundation
import ObjectMapper

class Loan: Mappable {
  var name: String?
  var country: String?
  var use: String?
  var cost: Int?
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map) {
    name <- map["name"]
    country <- map["location.country"]
    use <- map["use"]
    cost <- map["loan_amount"]
  }
}
