//
//  DECPromotion.swift
//  DgBetTrip
//
//  Created by Senior Developer on 10.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct DECPromotion {
  
  let ID        : Int?
  let title     : String?
  let subtitle  : String?
  let message   : String?
  let price     : String?
  let discount  : String?
  let duration  : Int?
  let videoURL  : String?
  let imageURL  : String?
  let status    : String?
  let createDate: String?
  let updateDate: String?
  let deleteDate: String?
  let aliase    : String?
  let pivot     : DECPivot?
  let actions   : [DECAction]?
  
  enum CodingKeys: String, CodingKey {
    
    case ID         = "id"
    case title      = "title"
    case subtitle   = "subtitle"
    case message    = "text"
    case price      = "price"
    case discount   = "discounted_price"
    case duration   = "duration"
    case videoURL   = "video"
    case imageURL   = "image"
    case status     = "status"
    case createDate = "created_at"
    case updateDate = "updated_at"
    case deleteDate = "deleted_at"
    case aliase     = "alias"
    case pivot      = "pivot"
    case actions    = "actions"
  }
  
}
extension DECPromotion: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID         = try? values.decode(Int?.self        , forKey: .ID)
    self.title      = try? values.decode(String?.self     , forKey: .title)
    self.subtitle   = try? values.decode(String?.self     , forKey: .subtitle)
    self.message    = try? values.decode(String?.self     , forKey: .message)
    self.price      = try? values.decode(String?.self     , forKey: .price)
    self.discount   = try? values.decode(String?.self     , forKey: .discount)
    self.duration   = try? values.decode(Int?.self        , forKey: .duration)
    self.videoURL   = try? values.decode(String?.self     , forKey: .videoURL)
    self.imageURL   = try? values.decode(String?.self     , forKey: .imageURL)
    self.status     = try? values.decode(String?.self     , forKey: .status)
    self.createDate = try? values.decode(String?.self     , forKey: .createDate)
    self.updateDate = try? values.decode(String?.self     , forKey: .updateDate)
    self.deleteDate = try? values.decode(String?.self     , forKey: .deleteDate)
    self.aliase     = try? values.decode(String.self      , forKey: .aliase)
    self.pivot      = try? values.decode(DECPivot?.self   , forKey: .pivot)
    self.actions    = try? values.decode([DECAction]?.self, forKey: .actions)
  }
}



