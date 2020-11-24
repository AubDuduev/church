//
//  DECService.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECService {
  
  let buttonFon    : String?
  let backgraundfon: String?
  let alias        : String?
  let title        : String?
  let description  : String?
  let maxPeople    : Int?
  let buttonIcon   : String?
  let subtitle     : String?
  
  enum CodingKeys: String, CodingKey {
    
    case buttonFon     = "button"
    case backgraundfon = "background"
    case alias
    case title
    case description
    case maxPeople     = "max"
    case buttonIcon    = "icon"
    case subtitle
  }
}

extension DECService: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.buttonFon     = try? values.decode(String?.self, forKey: .buttonFon  )
    self.backgraundfon = try? values.decode(String?.self, forKey: .backgraundfon)
    self.alias         = try? values.decode(String?.self, forKey: .alias)
    self.title         = try? values.decode(String?.self, forKey: .title)
    self.description   = try? values.decode(String?.self, forKey: .description)
    self.maxPeople     = try? values.decode(Int?.self   , forKey: .maxPeople)
    self.buttonIcon    = try? values.decode(String?.self, forKey: .buttonIcon)
    self.subtitle      = try? values.decode(String?.self, forKey: .subtitle)
  }
}
