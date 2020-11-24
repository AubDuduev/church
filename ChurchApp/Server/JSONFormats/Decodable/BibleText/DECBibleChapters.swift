//
//  chapters.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECBibleChapters {
  
  let name  : String?
  let number: Int?
  
  enum CodingKeys: String, CodingKey {
    
    case name
    case number
  }
}
extension DECBibleChapters: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name   = try? values.decode(String?.self, forKey: .name)
    self.number = try? values.decode(Int?.self   , forKey: .number)
  }
}
