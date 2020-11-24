//
//  ENCTransaction.swift
//  DgBetTrip
//
//  Created by Senior Developer on 12.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct ENCTransaction: Encodable {
  
  var EventName: String! = nil
  var Amount   : Int!    = nil
  var order_id : Int!    = nil
  
  init(index: Int) {
    self.EventName = EventNameType.allCases[index].rawValue
    self.Amount    = AmountInt.allCases[index].rawValue
  }
  
  init(amount: Int?, event: String?) {
    self.EventName = event
    self.Amount    = amount
  }
  
  init(amount: String?, event: String?) {
    self.EventName = event
    self.Amount    = Int(amount ?? "0")
  }
  init(data: DECData?) {
    self.EventName = data?.eventName
    self.Amount    = data?.amount ?? 0
  }
  
  init(orderID: Int?) {
    self.order_id = orderID
  }
}
