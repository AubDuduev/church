//
//  DECAwayHits.swift
//  DG.BET
//
//  Created by Aleksandr on 26.02.2020.
//  Copyright © 2020 -=ALEKSANDR=-. All rights reserved.
//
import UIKit

struct DECAwayHits {
  
  let fullUrl     : String?
  let requestedUrl: String?
  let source      : String?
  let createdDate : Int?
  let preClick    : Bool?
  let updatedDate : String?
  let createdData : String?
  let id          : Int?
  
  
  enum CodingKeys: String, CodingKey {
    
    case fullUrl      = "full_url"
    case requestedUrl = "requested_url"
    case source       = "source"
    case createdDate  = "created_by"
    case preClick     = "pre_click"
    case updatedDate  = "updated_at"
    case createdData  = "created_at"
    case id           = "id"
  }
  
}
extension DECAwayHits: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fullUrl      = try? values.decode(String?.self, forKey: .fullUrl)
    self.requestedUrl = try? values.decode(String?.self, forKey: .requestedUrl)
    self.source       = try? values.decode(String?.self, forKey: .source)
    self.createdDate  = try? values.decode(Int?.self,    forKey: .createdDate)
    self.preClick     = try? values.decode(Bool?.self,   forKey: .preClick)
    self.updatedDate  = try? values.decode(String?.self, forKey: .updatedDate)
    self.createdData  = try? values.decode(String?.self, forKey: .createdData)
    self.id           = try? values.decode(Int?.self,    forKey: .id)
  }
}
