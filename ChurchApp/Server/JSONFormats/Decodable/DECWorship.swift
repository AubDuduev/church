//
//  DECService.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECWorship {
  
  let ID        : Int?
  let date      : Int?
  let event     : String?
  let program   : [DECProgram]?
  let createdAt : String?
  let updatedAt : String?
  let deletedAt : String?
  let stream    : String?
  let streamInfo: DECStreamInfo?
  
  enum CodingKeys: String, CodingKey {
    
    case id
    case date
    case event
    case program
    case createdAt  = "created_at"
    case updatedAt  = "updated_at"
    case deletedAt  = "deleted_at"
    case stream     = "stream"
    case streamInfo = "stream_info"
  }
}
extension DECWorship: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID         = try? values.decode(Int?.self          , forKey: .id)
    self.date       = try? values.decode(Int?.self          , forKey: .date)
    self.event      = try? values.decode(String?.self       , forKey: .event)
    self.program    = try? values.decode([DECProgram]?.self , forKey: .program)
    self.createdAt  = try? values.decode(String?.self       , forKey: .createdAt)
    self.updatedAt  = try? values.decode(String?.self       , forKey: .updatedAt)
    self.deletedAt  = try? values.decode(String?.self       , forKey: .deletedAt)
    self.stream     = try? values.decode(String?.self       , forKey: .stream)
    self.streamInfo = try? values.decode(DECStreamInfo?.self, forKey: .streamInfo)
  }
}

