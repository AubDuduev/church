//
//  DECPushToken.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct DECPushToken {
  
  let appmetrica: String?
  
  enum CodingKeys: String, CodingKey {
    
    case appmetrica = "appmetrica"
  }
}

extension DECPushToken: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.appmetrica = try? values.decode(String?.self, forKey: .appmetrica)
  }
}
