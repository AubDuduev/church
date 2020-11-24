//
//  ENCOrder.swift
//  ChurchApp
//
//  Created by Senior Developer on 18.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct ENCOrder: Encodable {
  
  var type            : String?
  var data            : [ENCKeyValue]?
  var recurring_period: String? = nil
  var amount          : Float?
  
  init(type: OrderType, data: [ENCKeyValue]? = nil, period: RecurrentType? = nil, amount: Float? = nil) {
    self.type             = type.rawValue
    self.data             = data
    self.amount           = amount
    self.recurring_period = period?.rawValue
  }
}

