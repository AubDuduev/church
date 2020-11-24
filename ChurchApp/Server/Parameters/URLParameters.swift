//
//  URLParameters.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLParameters: NSObject {
  
  private var queryKeyQueryValue  : [QueryKey: QueryValue]!
  private var queryKeyStringValue : [QueryKey: String]!
  private var stringKeyStringValue: [String: String]!
  
  enum QueryItemsType {
    case some
    case socket(token: String, chatID: String, fromMessageID: String)
  }
  
  enum QueryKey: String {
    
    case some
    case currency
    case source
    case amount
    case userID        = "user_id"
    case webID         = "app_campaign_web_id"
    case event         = "event_name"
    case uid
    case token
    case chatID        = "chat_id"
    case fromMessageID = "from_message_id"
    case earlyMessage  = "created_at_less_than"
  }
  enum QueryValue: String {
    
    case some
  }
  enum QueryValueString {
    
    case non
  }
  enum QueryKeyStringValueString {
    
    case non
  }
  enum DictionaryType {
    
    case QueryKeyQueryValue([QueryKey: QueryValue])
    case QueryKeyStringValue([QueryKey: String])
    case StringKeyStringValue([String: String])
  }
  public func cretae(queryItems: QueryItemsType, _ valueString: QueryValueString = .non, _ queryKeyStringValueString: QueryKeyStringValueString = .non) -> [URLQueryItem]? {
    switch queryItems {
      //MARK: -
      case .some:
        print("some")
      return nil
      //Return socket
      case .socket(let token, let chatID, let fromMessageID):
        self.queryKeyStringValue = [.token: token,
                                    .chatID: chatID,
                                    .fromMessageID: fromMessageID]
        return self.createQueryItems(dictionaryType: .QueryKeyStringValue(self.queryKeyStringValue))
     
    }
  }
  //MARK: - Create Query parameters for url
  private func createQueryItems(dictionaryType: DictionaryType) -> [URLQueryItem] {
    switch dictionaryType {
      case .QueryKeyQueryValue(let dictionary):
        return dictionary.map{ URLQueryItem(name: $0.rawValue, value: $1.rawValue) }
      case .QueryKeyStringValue(let dictionary):
        return dictionary.map{ URLQueryItem(name: $0.rawValue, value: $1) }
      case .StringKeyStringValue(let dictionary):
        return dictionary.map{ URLQueryItem(name: $0, value: $1) }
    }
  }
}


