//
//  DECAction.swift
//  DgBetTrip
//
//  Created by Senior Developer on 11.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct DECAction {
  
  let type  : String?
  let icon  : String?
  let text  : String?
  let data  : DECData?
  
  enum CodingKeys: String, CodingKey {
  
    case type = "type"
    case icon = "icon"
    case text = "text"
    case data = "data"
  }
}

extension DECAction: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try? values.decode(String?.self, forKey: .type)
    self.icon = try? values.decode(String?.self, forKey: .icon)
    self.text = try? values.decode(String?.self, forKey: .text)
    self.data = try? values.decode(DECData?.self, forKey: .data)
  }
}

