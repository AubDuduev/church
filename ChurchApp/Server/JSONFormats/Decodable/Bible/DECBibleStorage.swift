//
//  DECBibleStorage.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECBibleStorage {
  
  let name      : String!
  let covenantID: Int!
  let content   : Int!
  let books     : [DECBibleBook]!
  
  enum CodingKeys: String, CodingKey {
    
    case name       = "name"
    case covenantID = "covenant_id"
    case content    = "show_in_content"
    case books      = "books"
  }
}
extension DECBibleStorage: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
   
    self.name       = try? values.decode(String?.self        , forKey: .name)
    self.covenantID = try? values.decode(Int?.self           , forKey: .covenantID)
    self.content    = try? values.decode(Int?.self           , forKey: .content)
    self.books      = try? values.decode([DECBibleBook]?.self, forKey: .books)
  }
}
