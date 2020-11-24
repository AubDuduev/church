//
//  URLWebSocket.swift
//  DgBetTrip
//
//  Created by Senior Developer on 14.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation
//wss://dev.chat.roimaster.site/%3F?from_message_id=&chat_id=1&token=760e5ceaaf354bd7009220164017fa1118d0b7e4"
//wss://dev.chat.roimaster.site/%3F?from_message_id=&chat_id=1&token=760e5ceaaf354bd7009220164017fa1118d0b7e4"
class URLWebSocket: URLCreatoble {
  
  let urlCustom = URLCustom()
  let parameter = URLParameters()
  
  func url(_ type: URLType.Types) -> ReturnURL? {
    switch type {
      case .socket(token: let token, chatID: let chatID, fromMessageID: let messageID):
        let query  = parameter.cretae(queryItems: .socket(token: token, chatID: chatID, fromMessageID: messageID))
        let custom = URLCustom.Custom(scheme: .wss,
                                      host: .Socket,
                                      path: .question,
                                      queryItems: query)
        return urlCustom.create(type: custom)
      default:
        return nil
    }
    
  }
}
