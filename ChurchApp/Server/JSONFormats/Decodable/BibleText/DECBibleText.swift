//
//  DECBibleText.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECBibleText {
  
  let ID       : Int?
  let name     : String?
  let number   : Int?
  let canonical: Int?
  let chapters : [DECBibleChapters]?
  let verses   : [DECChapterVerses]?
  
  enum CodingKeys: String, CodingKey {
    
    case ID        = "id"
    case name      = "name"
    case number    = "number"
    case canonical = "canonical"
    case chapters
    case verses    = "chapter_verses"
  }
}
extension DECBibleText: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID        = try? values.decode(Int?.self               , forKey: .ID)
    self.name      = try? values.decode(String?.self            , forKey: .name)
    self.number    = try? values.decode(Int?.self               , forKey: .number)
    self.canonical = try? values.decode(Int?.self               , forKey: .canonical)
    self.chapters  = try? values.decode([DECBibleChapters]?.self, forKey: .chapters)
    self.verses    = try? values.decode([DECChapterVerses]?.self, forKey: .verses)
  }
}
