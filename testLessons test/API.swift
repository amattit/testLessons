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
 
  case getUsers
  case getUsersPets(userId: String)
  case postNewPet(userId: String, name: String, birthday: String, descriptions: String)
  
  static let baseURLString = "http://localhost:8080/"
  
  var method: HTTPMethod {
    switch self {
    case .getUsers:
      return .get
    case .getUsersPets:
      return .get
    case .postNewPet:
      return .post
    }
  }
  
  var path: String {
    switch self {
    case .getUsers:
      return API.baseURLString + "users"
    case .getUsersPets(let userId):
      return API.baseURLString + "users" + "/\(userId)" + "/pets"
    case .postNewPet(userId: _, name: _, birthday: _, descriptions: _):
      return API.baseURLString + "pets"
    }
  }
  
  var params: Parameters? {
    switch self {
    case .postNewPet(userId: let userId, name: let name, birthday: let birthday, descriptions: let descriptions):
      return [
      "userId": "\(userId)",
      "name": "\(name)",
      "birthday": "\(birthday)",
      "descriptions": "\(descriptions)"
      ]
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
    case .post:
      return try Alamofire.JSONEncoding.default.encode(urlRequest, with: params)
    default:
      break
    }
    return urlRequest
  }
}
