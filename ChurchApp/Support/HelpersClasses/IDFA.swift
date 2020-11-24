//
//  IDFA.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import AdSupport

class IDFA {
  // MARK: - Stored Type Properties
  static let shared = IDFA()
  
  var limited: Bool {
    return !ASIdentifierManager.shared().isAdvertisingTrackingEnabled
  }
  
  var identifier: String? {
    guard !limited else { return nil }
    return ASIdentifierManager.shared().advertisingIdentifier.uuidString
  }
  var feikIdentifier: String? {
    return "00000000-0000-0000-0000-0000000000" + String(Int.random(in: 100...999))
  }
}
