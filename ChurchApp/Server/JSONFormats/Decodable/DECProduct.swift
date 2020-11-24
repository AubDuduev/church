//
//  DECProduct.swift
//  ChurchApp
//
//  Created by Senior Developer on 01.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECProduct {
  
  let id         : Int?
  let type       : String?
  let title      : String?
  let properties : String?
  let imageSmall : String?
  let imageFull  : String?
  let description: Any?
  let price      : Int?
  let createdAt  : String?
  let updatedAt  : String?
  let deletedAt  : Any?
  
  enum CodingKeys: String, CodingKey {
    
    case id          = "id"
    case type        = "type"
    case title       = "title"
    case properties  = "properties"
    case imageSmall  = "image_small"
    case imageFull   = "image_full"
    case description = "description"
    case price       = "price"
    case createdAt   = "created_at"
    case updatedAt   = "updated_at"
    case deletedAt   = "deleted_at"
  }
}
extension DECProduct: Decodable {
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id          = try? values.decode(Int?.self   , forKey: .id         )
    self.type        = try? values.decode(String?.self, forKey: .type       )
    self.title       = try? values.decode(String?.self, forKey: .title      )
    self.properties  = try? values.decode(String?.self, forKey: .properties )
    self.imageSmall  = try? values.decode(String?.self, forKey: .imageSmall )
    self.imageFull   = try? values.decode(String?.self, forKey: .imageFull  )
    self.description = try? values.decode(String?.self, forKey: .description)
    self.price       = try? values.decode(Int?.self   , forKey: .price      )
    self.createdAt   = try? values.decode(String?.self, forKey: .createdAt  )
    self.updatedAt   = try? values.decode(String?.self, forKey: .updatedAt  )
    self.deletedAt   = try? values.decode(String?.self, forKey: .deletedAt  )
  }
}
