//
//  DECCommand.swift
//  DgBetTrip
//
//  Created by Developer on 26.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct CODCommand {
  
  let action   : String?
  let messageID: Int?
  let value    : Int?
  
  enum CodingKeys: String, CodingKey {
    case action
    case messageID = "message_id"
    case value
  }
}
extension CODCommand: Codable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.action    = try? values.decode(String?.self, forKey: .action)
    self.messageID = try? values.decode(Int?.self   , forKey: .messageID)
    self.value     = try? values.decode(Int?.self   , forKey: .value)
  }
}
