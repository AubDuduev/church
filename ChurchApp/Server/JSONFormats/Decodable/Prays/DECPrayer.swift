//
//  DECPrays.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECPrayer {
  
  let ID      : Int!
  let title   : String!
  let parentID: Int!
  let content : String?
  let subPrays: [DECPrayer]?
  let prays   : [DECPrayer]?
  
  enum CodingKeys: String, CodingKey {
    
    case ID       = "id"
    case title    = "title"
    case parentID = "parent_id"
    case subPrays = "subcategories"
    case content
    case prays
  }
}
extension DECPrayer: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID       = try? values.decode(Int?.self        , forKey: .ID)
    self.title    = try? values.decode(String?.self     , forKey: .title)
    self.content  = try? values.decode(String?.self     , forKey: .content)
    self.parentID = try? values.decode(Int?.self        , forKey: .parentID)
    self.subPrays = try? values.decode([DECPrayer]?.self, forKey: .subPrays)
    self.prays    = try? values.decode([DECPrayer]?.self, forKey: .prays)
  }
}
