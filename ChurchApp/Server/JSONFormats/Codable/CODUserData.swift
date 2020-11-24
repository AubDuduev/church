//
//  CODUserData.swift
//  DgBetTrip
//
//  Created by Senior Developer on 20.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

struct CODUserData {
  
  var ID        : Int?    = Int(GVuserData?.userID ?? "0")
  var typeApp   : String? = ""
  var externalID: String? = ""
  var firstName : String? = ""
  var lastName  : String? = ""
  var username  : String? = ""
  var phone     : String? = ""
  var avatar    : String? = ""
  var token     : String? = ""
  var userLink  : String? = ""
  var mode      : Int?    = 0
  var tokenCP   : String? = ""
  var isBlock   : Bool {
    return ((mode ?? 0) > 0) ? false : true
  }
  
  enum CodingKeys: String, CodingKey {
    
      case ID         = "id"
      case typeApp    = "type"
      case externalID = "external_id"
      case firstName  = "first_name"
      case lastName   = "last_name"
      case username   = "username"
      case phone      = "phone"
      case avatar     = "avatar"
      case token      = "token"
      case userLink   = "user_link"
      case mode       = "mode"
      case tokenCP    = "cp_token"
  }
}


extension CODUserData: Codable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ID         = try? values.decode(Int?.self   , forKey: .ID)
    self.typeApp    = try? values.decode(String?.self, forKey: .typeApp)
    self.externalID = try? values.decode(String?.self, forKey: .externalID)
    self.firstName  = try? values.decode(String?.self, forKey: .firstName)
    self.lastName   = try? values.decode(String?.self, forKey: .lastName)
    self.username   = try? values.decode(String?.self, forKey: .username)
    self.phone      = try? values.decode(String?.self, forKey: .phone)
    self.avatar     = try? values.decode(String?.self, forKey: .avatar)
    self.token      = try? values.decode(String?.self, forKey: .token)
    self.userLink   = try? values.decode(String?.self, forKey: .userLink)
    self.mode       = try? values.decode(Int?.self   , forKey: .mode)
    self.tokenCP    = try? values.decode(String?.self, forKey: .tokenCP)
  }
}


