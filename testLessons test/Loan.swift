//
//  Loan.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import Foundation

class Loan {
  var name: String
  var country: String
  var use: String
  var cost: Int
  
  init(name: String, country: String, use:String, cost: Int) {
    self.cost = cost
    self.country = country
    self.name = name
    self.use = use
  }
}
