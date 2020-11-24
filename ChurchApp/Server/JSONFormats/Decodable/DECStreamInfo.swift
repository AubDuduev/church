//
//  DECStreamInfo.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECStreamInfo {
  
  let id     : String?
  let image  : String?
  let title  : String?
  let status : StatusEfir?
  let viewers: String?
  
  enum CodingKeys: String, CodingKey {
    
    case id      = "id"
    case image   = "image"
    case title   = "title"
    case status  = "status"
    case viewers = "viewers"
  }
}
extension DECStreamInfo: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id       = try? values.decode(String?.self, forKey: .id     )
    self.image    = try? values.decode(String?.self, forKey: .image  )
    self.title    = try? values.decode(String?.self, forKey: .title  )
    self.viewers  = try? values.decode(String?.self, forKey: .viewers)
    let newStatus = try? values.decode(String?.self, forKey: .status) ?? "offline"
    self.status   = StatusEfir(rawValue: newStatus ?? "offline")
  }
}

enum StatusEfir: String {
  case OnLine  = "online"
  case OffLine = "offline"
}
