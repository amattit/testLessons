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

protocol LoanServiceDelegate {
  func didReciveLoans(loans: [Loan])
  func didFaildWithError(error: Error)
}

class LoanService: NSObject {
  var delegate: LoanServiceDelegate?
  
  func getLoans() {
    Alamofire.request(API.getLoans).responseArray(queue: DispatchQueue.main, keyPath: "loans") { (response: DataResponse<[Loan]>) in
      switch response.result {
      case .success(let value):
        self.delegate?.didReciveLoans(loans: value)
      case .failure(let error):
        self.delegate?.didFaildWithError(error: error)
      }
      
    }
  }
}

