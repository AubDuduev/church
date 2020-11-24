//
//  DECStart.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECStart {
  
  let facilities  : [DECService]?
  let startScreens: [DECStartScreen]?
  let donations   : DECDonations?
  let price       : DECPrice?
  
  enum CodingKeys: String, CodingKey {
    
    case facilities
    case startScreens = "start_screens"
    case donations
    case price        = "rates"
  }
}

extension DECStart: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.donations    = try? values.decode(DECDonations?.self    , forKey: .donations)
    self.facilities   = try? values.decode([DECService]?.self    , forKey: .facilities)
    self.startScreens = try? values.decode([DECStartScreen]?.self, forKey: .startScreens)
    self.price        = try? values.decode(DECPrice?.self        , forKey: .price)
  }
}
