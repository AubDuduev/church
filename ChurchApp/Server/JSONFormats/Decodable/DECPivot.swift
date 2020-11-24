//
//  DECPivot.swift
//  DgBetTrip
//
//  Created by Senior Developer on 10.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct DECPivot {

  let userID    : Int?
  let offerID   : Int?
  let parameters: String?
  let startTime : String?
  let cretaeTime: String?
  
  enum CodingKeys: String, CodingKey {
    
    case userID     = "user_id"
    case offerID    = "special_offer_id"
    case parameters = "params"
    case startTime  = "started_at"
    case cretaeTime = "created_at"
  }
  
}
extension DECPivot: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.userID     = try? values.decode(Int?.self   , forKey: .userID)
    self.offerID    = try? values.decode(Int?.self   , forKey: .offerID)
    self.parameters = try? values.decode(String?.self, forKey: .parameters)
    self.startTime  = try? values.decode(String?.self, forKey: .startTime)
    self.cretaeTime = try? values.decode(String?.self, forKey: .cretaeTime)
  }
}

