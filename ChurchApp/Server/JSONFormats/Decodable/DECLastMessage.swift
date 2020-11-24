//
//  DECLastMessage.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct DECLastMessage {
  
   let id   : Int?
   let text : String?
   let time : Double?
   let image: String?
   let video: String?
  
  enum CodingKeys: String, CodingKey {
    
    case id    = "id"
    case text  = "text"
    case time  = "time"
    case image = "image"
    case video = "video"
  }
}

extension DECLastMessage: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id    = try? values.decode(Int?.self   , forKey: .id)
    self.text  = try? values.decode(String?.self, forKey: .text)
    self.time  = try? values.decode(Double?.self, forKey: .time)
    self.image = try? values.decode(String?.self, forKey: .image)
    self.video = try? values.decode(String?.self, forKey: .video)
  }
}
