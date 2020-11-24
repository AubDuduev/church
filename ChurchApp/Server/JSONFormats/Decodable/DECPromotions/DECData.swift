//
//  DECPromotionButton.swift
//  DgBetTrip
//
//  Created by Senior Developer on 11.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct DECData {
  
  let type     : String?
  let url      : String?
  let amount   : Int?
  let methods  : String?
  let currency : String?
  let eventName: String?
  
  enum CodingKeys: String, CodingKey {
  
    case type      = "type"
    case url       = "url"
    case amount    = "amount"
    case methods   = "methods"
    case currency  = "currency"
    case eventName = "event_name"
  }
}

extension DECData: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type      = try? values.decode(String?.self, forKey: .type     )
    self.url       = try? values.decode(String?.self, forKey: .url      )
    self.amount    = try? values.decode(Int?.self   , forKey: .amount   )
    self.currency  = try? values.decode(String?.self, forKey: .currency )
    self.methods   = try? values.decode(String?.self, forKey: .methods )
    self.eventName = try? values.decode(String?.self, forKey: .eventName)
  }
}

