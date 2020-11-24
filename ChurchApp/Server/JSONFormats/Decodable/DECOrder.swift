//
//  DECOrder.swift
//  ChurchApp
//
//  Created by Senior Developer on 18.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECOrder {

  let ID            : Int?
  let status        : String?
  let link          : String?
  let errors        : String?
  let amount        : String?
  let date          : String?
  let statusPay     : String?
  let title         : String?
  let requrentPeriod: String?
  let data          : DECOrderData?
  
  enum CodingKeys: String, CodingKey {
    
    case amount
    case ID       = "id"
    case status
    case link
    case errors
    case data      = "order"
    case date      = "created_at"
    case statusPay = "status_name"
    case title     = "type_name"
    case requrentPeriod = "recurring_period"
  }
}
extension DECOrder: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID             = try? values.decode(Int?.self         , forKey: .ID)
    self.status         = try? values.decode(String?.self      , forKey: .status)
    self.link           = try? values.decode(String?.self      , forKey: .link)
    self.errors         = try? values.decode(String?.self      , forKey: .errors)
    self.amount         = try? values.decode(String?.self      , forKey: .amount)
    self.date           = try? values.decode(String?.self      , forKey: .date)
    self.statusPay      = try? values.decode(String?.self      , forKey: .statusPay)
    self.title          = try? values.decode(String?.self      , forKey: .title)
    self.data           = try? values.decode(DECOrderData?.self, forKey: .data)
    self.requrentPeriod = try? values.decode(String?.self      , forKey: .requrentPeriod)
  }
}


