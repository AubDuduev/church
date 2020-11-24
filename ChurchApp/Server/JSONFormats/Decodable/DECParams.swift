//
//  DECParams.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct DECParams {
  
  let appID       : String?
  let appsFalyerID: String?
  let appMetricaID: String?
  
  enum CodingKeys: String, CodingKey {
    
    case appID        = "app_id"
    case appsFalyerID = "appsflyer_id"
    case appMetricaID = "appmetrica_id"
  }
}

extension DECParams: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.appID        = try? values.decode(String?.self, forKey: .appID)
    self.appsFalyerID = try? values.decode(String?.self, forKey: .appsFalyerID)
    self.appMetricaID = try? values.decode(String?.self, forKey: .appMetricaID)
  }
}
