//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLType {
  
  var creatoble: URLCreatoble!
  
  public func set(_ type: Types) -> URLCreatoble {
    switch type {
      case .userData:
        return URLUserData()
      case .registration:
        return URLRegistration()
      case .deeplinks:
        return URLDeeplinks()
      case .params:
        return URLParams()
      case .pushToken:
        return URLPushToken()
      case .messages:
        return URLMessages()
      case .earlyMessage:
        return URLEarlyMessage()
      case .bookmakersOpenURL:
        return URLBookmakersOpenURL()
      case .socket:
        return URLWebSocket()
      case .photoURL:
        return URLPhotoUrl()
      case .serverUrls:
        return URLServerUrls()
      case .worshipList:
        return URLWorship()
      case .chatList:
        return URLChatList()
      case .products:
        return URLProducts()
      case .start:
        return URLStart()
      case .orders:
        return URLOrders()
      case .transaction:
        return URLTransaction()
      case .getBible:
        return URLGetBible()
      case .bibleText:
        return URLBibleText()
      case .getPrays:
        return URLGetPrays()
      case .getPrayID:
        return URLGetPrayID()
    }
  }
  enum Types {
    
    case worshipList(URLPath.Path)
    case serverUrls
    case chatList(URLPath.Path)
    case userData(URLPath.Path, URLPath.ChangePath)
    case registration(URLPath.Path)
    case deeplinks(URLPath.Path, URLPath.ChangePath, URLPath.Path)
    case params(URLPath.Path, URLPath.ChangePath, URLPath.Path)
    case pushToken(URLPath.Path, URLPath.ChangePath, URLPath.Path)
    case messages(URLPath.Path, URLPath.ChangePath, URLPath.Path)
    case socket(token: String, chatID: String, fromMessageID: String)
    case photoURL(URLPath.Path)
    case earlyMessage(URLPath.ChangePath, time: String)
    case bookmakersOpenURL(URLPath.Path)
    case products(URLPath.Path)
    case start(URLPath.Path)
    case orders(URLPath.Path)
    case transaction(URLPath.Path)
    case getBible(URLPath.Path, URLPath.Path)
    case bibleText(URLPath.Path, URLPath.Path, URLPath.ChangePath)
    case getPrays(URLPath.Path)
    case getPrayID(URLPath.Path, String)
  }
}

