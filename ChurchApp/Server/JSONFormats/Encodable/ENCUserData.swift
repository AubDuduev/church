//
//  ENCUserData.swift
//  DgBetTrip
//
//  Created by Developer on 27.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct ENCUserData: Encodable {
  
  var lastName : String? = ""
  var firstName: String? = ""
  var phone    : String? = ""
  var avatar   : String? = ""
  
  enum CodingKeys: String, CodingKey {
    
      case lastName  = "last_name"
      case firstName = "first_name"
      case phone     = "phone"
      case avatar    = "avatar"
  }
}
