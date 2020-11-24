//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class GETChatList: Requestoble {
  
  private let urls       = URLs()
  private let parameters = URLParameters()
  private let headers    = URLHeaders()
  private let jsonDecode = JSONDecode()
  private let urlBody    = URLBody()
  
  public func type(data: Any?, completion: @escaping ClousureRequest) {
    
    let url    = urls.create(type: .chatList(.allChats))?.URL
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
