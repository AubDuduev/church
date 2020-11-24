//
//  DECPhotoURL.swift
//  DgBetTrip
//
//  Created by Developer on 27.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct DECPhotoURL {
  
  let file: String?
  
  enum CodingKeys: String, CodingKey {
    
    case file
  }
}

extension DECPhotoURL: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.file = try? values.decode(String?.self, forKey: .file)
  }
}

