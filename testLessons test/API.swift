//
//  API.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import Foundation
import Alamofire


protocol APIMethodProtocol: URLRequestConvertible {
  var method: Alamofire.HTTPMethod { get }
  var path: String { get }
  var params: Alamofire.Parameters? { get }
}


enum API: APIMethodProtocol {
 
  case getLoans
  
  static let baseURLString = "https://api.kivaws.org/v1/"
  
  var method: HTTPMethod {
    switch self {
    case .getLoans:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .getLoans:
      return API.baseURLString + "loans/newest.json"
    }
  }
  
  var params: Parameters? {
    switch self {
    default:
      return nil
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = try path.asURL()
    
    var urlRequest = Alamofire.URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    
    switch method {
    case .get:
      return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
//    case .post:
//      return try Alamofire.JSONEncoding.default.encode(urlRequest, with: params)
    default:
      break
    }
    return urlRequest
  }
}
