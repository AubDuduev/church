//
//  DECDonations.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECDonations {
  
  let purpose    : String?
  let description: String?
  let currentSum : String?
  let targetSum  : String?
  
  enum CodingKeys: String, CodingKey {
    
    case purpose     = "donation_purpose"
    case description = "donation_description"
    case currentSum  = "donation_sum"
    case targetSum   = "donation_target"
  }
}
extension DECDonations: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.purpose     = try? values.decode(String?.self, forKey: .purpose)
    self.description = try? values.decode(String?.self, forKey: .description)
    self.currentSum  = try? values.decode(String?.self, forKey: .currentSum)
    self.targetSum   = try? values.decode(String?.self, forKey: .targetSum)
  }
}
