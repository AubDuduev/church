//
//  GETServerUrl.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class GETEarlyMessages: Requestoble {
  
  var urls       = URLs()
  var parameters = URLParameters()
  var headers    = URLHeaders()
  var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
  
  public func type(data: Any?, completion: @escaping ClousureRequest) {
    
    let typles = data as! (time: String, chatID: String)
    let url    = self.urls.create(type: .earlyMessage(.lessThanMessages(.chats, typles.chatID, .messages), time: typles.time))?.URL
    let header = self.headers.create(type: .autorization_appJson)
    //Request
    self.jsonDecode.decode(jsonType: [CODMessage].self, url: url, header: header, httpMethod: .get) { (decodeResult) in
      //Responce
      switch decodeResult {
        //Error
        case .error(let error):
          completion(.error(error))
        //Susses
        case .json(let object):
          if let messages = object as?  [CODMessage]{
            completion(.object(messages))
        }
      }
    }
  }
}
