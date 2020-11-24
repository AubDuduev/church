//
//  DECProgram.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECProgram {
  
  let date : Int?
  let title: String?
  
  enum CodingKeys: String, CodingKey {
    case date
    case title
  }
}
extension DECProgram: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.date  = try? values.decode(Int?.self, forKey: .date)
    self.title = try? values.decode(String?.self, forKey: .title)
  }
}
