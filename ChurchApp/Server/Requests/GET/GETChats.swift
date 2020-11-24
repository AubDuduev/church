//
//  GETChats.swift
//  DgBetTrip
//
//  Created by Senior Developer on 03.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class GETChats: Requestoble {
  
  var urls       = URLs()
  var parameters = URLParameters()
  var headers    = URLHeaders()
  var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
  
  public func type(data: Any?, completion: @escaping ClousureRequest) {
    
    let url    = urls.create(type: .chatList(.chats))?.URL
    let header = headers.create(type: .autorization_appJson)
    //Request
    self.jsonDecode.decode(jsonType: [DECChat].self, url: url, header: header, httpMethod: .get) { (decodeResult) in
      //Responce
      switch decodeResult {
        //Error
        case .error(let error):
          completion(.error(error))
        //Susses
        case .json(let object):
          if let chatList = object as?  [DECChat]{
            completion(.object(chatList))
        }
      }
    }
  }
}
