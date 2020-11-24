//
//  ENCRegistration.swift
//  DgBetTrip
//
//  Created by Senior Developer on 20.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct ENCRegistration: Encodable {
  
  let type        = "ios"
  let external_id = UUID().uuidString
}

