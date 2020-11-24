//
//  DECSocket.swift
//  DgBetTrip
//
//  Created by Senior Developer on 14.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct DECSocket {
  
  let error   : String?
  let command : CODCommand?
  let schedule: [String]?
  let messages: [CODMessage]?
  
  enum CodingKeys: String, CodingKey {
    
    case error    = "error"
    case schedule = "schedule"
    case messages = "messages"
    case command  = "command"
  }
}
extension DECSocket: Codable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
  
    self.error    = try? values.decode(String?.self      , forKey: .error)
    self.schedule = try? values.decode([String]?.self    , forKey: .schedule)
    self.messages = try? values.decode([CODMessage]?.self, forKey: .messages)
    self.command  = try? values.decode(CODCommand?.self  , forKey: .messages)
  }
}


