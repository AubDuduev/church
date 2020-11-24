//
//  PATCHPushToken.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class PATCHPushToken: Requestoble {
  
  var urls       = URLs()
  var parameters = URLParameters()
  var headers    = URLHeaders()
  var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
  
  func type(data: Any?, completion: @escaping ClousureRequest) {
    
    let encode = data as? URLBody.BodyType
    let url    = urls.create(type: .pushToken(.users, .userID, .pushToken))?.URL
    let header = headers.create(type: .autorization_appJson)
    let body   = urlBody.createEncoding(type: encode)
    //Request
    self.jsonDecode.decode(jsonType: DECPushToken.self, url: url, header: header, body: body, httpMethod: .patch) { (decodeResult) in
      //Responce
      switch decodeResult {
        //Error
        case .error(let error):
          completion(.error(error))
        //Susses
        case .json(let object):
          if let pushToken = object as?  DECPushToken{
          completion(.object(pushToken))
          }
      }
    }
  }
}
