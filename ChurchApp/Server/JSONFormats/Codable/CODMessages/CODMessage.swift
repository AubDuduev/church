//
//  DECMessage.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct CODMessage {
  
  let text    : String?
  let time    : Double?
  var image   : String? = ""
  var ID      : Int?    = 0
  let userData: CODUserData?
  var video   : String? = ""
  var type    : String? = ""
  
  enum CodingKeys: String, CodingKey {
    
    case text     = "text"
    case time     = "time"
    case image    = "image"
    case ID       = "id"
    case userData = "user"
    case video    = "video"
    case type     = "type"
  }
}

extension CODMessage: Codable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.text     = try? values.decode(String?.self     , forKey: .text    )
    self.time     = try? values.decode(Double?.self     , forKey: .time    )
    self.image    = try? values.decode(String?.self     , forKey: .image   )
    self.ID       = try? values.decode(Int?.self        , forKey: .ID      )
    self.userData = try? values.decode(CODUserData?.self, forKey: .userData)
    self.video    = try? values.decode(String?.self     , forKey: .video   )
    self.type     = try? values.decode(String?.self     , forKey: .type    )
  }
}
