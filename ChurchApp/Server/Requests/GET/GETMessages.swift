//
//  GETMessages.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class GETMessages: Requestoble {
  
  var urls       = URLs()
  var parameters = URLParameters()
  var headers    = URLHeaders()
  var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
  
  public func type(data: Any?, completion: @escaping ClousureRequest) {
    
    let chatID = data as! String
    let url    = urls.create(type: .messages(.chats, .chatID(id: chatID), .messages))?.URL
    let header = headers.create(type: .autorization_appJson)
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
