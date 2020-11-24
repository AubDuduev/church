//
//  ENCUserData.swift
//  DgBetTrip
//
//  Created by Senior Developer on 20.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import UIKit

struct ENCDeviceData: Encodable {
  
  
  let vrt      = "false"
  let timezone = TimeZone.current.identifier
  let width    = "\(Int(UIScreen.main.bounds.width))"
  let IOS      = UIDevice.current.systemVersion
  var model    = UIDevice().modelName
  var lang     : String!
  let advertising_device_id = IDFA.shared.feikIdentifier//feikIdentifier/identifier
 

  private func languageSystem() -> String {
    let languageSystem = (NSLocale.preferredLanguages.first ?? "") as String
    if let firstIndex = languageSystem.firstIndex(of: "-"){
      return String(languageSystem[..<firstIndex])
    }
  return languageSystem
  }
  init(){
    self.lang = self.languageSystem()
  }
}
