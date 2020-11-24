//
//  DECStartScreen.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECStartScreen {
  
  let id   : Int?
  let image: String?
  let title: String?
  let text : String?
  
  enum CodingKeys: String, CodingKey {
    
    case id    = "id"
    case image = "image"
    case title = "title"
    case text  = "description"
  }
}
extension DECStartScreen: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)

    self.id    = try? values.decode(Int?.self   , forKey: .id)
    self.image = try? values.decode(String?.self, forKey: .image)
    self.title = try? values.decode(String?.self, forKey: .title)
    self.text  = try? values.decode(String?.self, forKey: .text)
  }
}
