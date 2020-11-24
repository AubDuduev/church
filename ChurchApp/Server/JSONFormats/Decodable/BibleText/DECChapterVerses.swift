//
//  DECChapterVerses.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECChapterVerses {
  
  let number  : Int?
  let content : String?
  let contentC: String?
  let contentG: String?
  let contentI: String?
  let contentL: String?
  
  enum CodingKeys: String, CodingKey {
    
    case number   = "number"
    case content  = "content"
    case contentC = "content_c"
    case contentG = "content_g"
    case contentI = "content_i"
    case contentL = "content_l"
  }
}
extension DECChapterVerses: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.number   = try? values.decode(Int?.self   , forKey: .number)
    self.content  = try? values.decode(String?.self, forKey: .content)
    self.contentC = try? values.decode(String?.self, forKey: .contentC)
    self.contentG = try? values.decode(String?.self, forKey: .contentG)
    self.contentI = try? values.decode(String?.self, forKey: .contentI)
    self.contentL = try? values.decode(String?.self, forKey: .contentL)
  }
}
