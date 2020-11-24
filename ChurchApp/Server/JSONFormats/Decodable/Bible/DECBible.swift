//
//  DECBible.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECBible {
  
  let ID      : Int!
  let name    : String!
  let storages: [DECBibleStorage]!
  
  enum CodingKeys: String, CodingKey {
    
      case ID       = "id"
      case name     = "name"
      case storages = "storages"
  }
}
extension DECBible: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID       = try? values.decode(Int?.self              , forKey: .ID)
    self.name     = try? values.decode(String?.self           , forKey: .name)
    self.storages = try? values.decode([DECBibleStorage]?.self, forKey: .storages)
  }
}
