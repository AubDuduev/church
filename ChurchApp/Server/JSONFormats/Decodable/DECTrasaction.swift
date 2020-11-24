//
//  DECTrasaction.swift
//  DgBetTrip
//
//  Created by Senior Developer on 12.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct DECTransaction {
  
  let errors   : String?
  let success  : Bool?
  let sussesPay: Bool?
  
  enum CodingKeys: String, CodingKey {
    
    case sussesPay = "Success"
    case errors    = "errors"
    case success   = "success"
  }
}

extension DECTransaction: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.errors    = try? values.decode(String?.self, forKey: .errors)
    self.success   = try? values.decode(Bool?.self  , forKey: .success)
    self.sussesPay = try? values.decode(Bool?.self  , forKey: .sussesPay)
  }
}

