//
//  DECPrice.swift
//  ChurchApp
//
//  Created by Senior Developer on 20.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECPrice {
  
  let healthNote   : Int?
  let restNote     : Int?
  let prayerService: Int?
  let proskomidiya : Int?
  let sorokoust    : Int?
  let psaltir      : Int?
  
  enum CodingKeys: String, CodingKey {
    
    case healthNote    = "health_note"
    case restNote      = "rest_note"
    case prayerService = "prayer_service"
    case proskomidiya  = "proskomidiya"
    case sorokoust     = "sorokoust"
    case psaltir
  }
}
extension DECPrice: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.healthNote    = try? values.decode(Int?.self, forKey: .healthNote)
    self.restNote      = try? values.decode(Int?.self, forKey: .restNote)
    self.prayerService = try? values.decode(Int?.self, forKey: .prayerService)
    self.proskomidiya  = try? values.decode(Int?.self, forKey: .proskomidiya)
    self.sorokoust     = try? values.decode(Int?.self, forKey: .sorokoust)
    self.psaltir       = try? values.decode(Int?.self, forKey: .psaltir)
  }
}
