//
//  DECOrderData.swift
//  ChurchApp
//
//  Created by Senior Developer on 21.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECOrderData {
  
  let status    : String?
  let type      : String?
  let data      : String?
  let amount    : Int?
  let updatedAt : String?
  let createdAt : String?
  let id        : Int?
  let statusName: String?
  let typeName  : String?
  
  
  enum CodingKeys: String, CodingKey {
    
    case status     = "status"
    case type       = "type"
    case data       = "data"
    case amount     = "amount"
    case updatedAt  = "updated_at"
    case createdAt  = "created_at"
    case id         = "id"
    case statusName = "status_name"
    case typeName   = "type_name"
  }
}
extension DECOrderData: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.status     = try? values.decode(String?.self, forKey: .status)
    self.type       = try? values.decode(String?.self, forKey: .type)
    self.data       = try? values.decode(String?.self, forKey: .data)
    self.amount     = try? values.decode(Int?.self   , forKey: .amount)
    self.updatedAt  = try? values.decode(String?.self, forKey: .updatedAt)
    self.createdAt  = try? values.decode(String?.self, forKey: .createdAt)
    self.id         = try? values.decode(Int?.self   , forKey: .id)
    self.statusName = try? values.decode(String?.self, forKey: .statusName)
    self.typeName   = try? values.decode(String?.self, forKey: .typeName)
  }
}
