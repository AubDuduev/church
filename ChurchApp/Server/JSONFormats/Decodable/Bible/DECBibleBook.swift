//
//  DECBibleBook.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECBibleBook {
  
  let ID       : Int!
  let name     : String!
  let number   : Int!
  let canonical: Int!
  
  enum CodingKeys: String, CodingKey {
    
    case ID        = "id"
    case name      = "name"
    case number    = "number"
    case canonical = "canonical"
    
  }
}
extension DECBibleBook: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID        = try? values.decode(Int?.self   , forKey: .ID)
    self.name      = try? values.decode(String?.self, forKey: .name)
    self.number    = try? values.decode(Int?.self   , forKey: .number)
    self.canonical = try? values.decode(Int?.self   , forKey: .canonical)
  }
}
