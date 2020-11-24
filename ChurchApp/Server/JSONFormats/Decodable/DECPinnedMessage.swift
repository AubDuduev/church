//
//  DECFixedMessage.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct DECPinnedMessage {
  
  let id      : Int?
  let text    : String?
  let time    : Double?
  let userData: CODUserData?
  let image   : String?
  
  enum CodingKeys: String, CodingKey {
    
    case id       = "id"
    case text     = "text"
    case time     = "time"
    case userData = "user"
    case image    = "image"
  }
}

extension DECPinnedMessage: Codable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id       = try? values.decode(Int?.self, forKey: .id)
    self.text     = try? values.decode(String?.self, forKey: .text)
    self.time     = try? values.decode(Double?.self, forKey: .time)
    self.userData = try? values.decode(CODUserData?.self, forKey: .userData)
    self.image    = try? values.decode(String?.self, forKey: .image)
  }
}
