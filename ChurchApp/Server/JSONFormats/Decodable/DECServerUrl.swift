//
//  DECServerUrl.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

struct DECServerUrl {
  
  let apiURL     : String?
  let staticURL  : String?
  let webSocetURL: String?
  let tgBotURL   : String?
  let mode       : Int?
  let policyURL  : String?
  let videoURL   : String?
  let away       : String?
  var awayURL    : String? {
    get {
      guard away != nil else { return away}
      return (away! + "?url=")
    }
  }
  
  
  enum CodingKeys: String, CodingKey {
    
    case apiURL        = "api"
    case staticURL     = "static"
    case webSocetURL   = "ws"
    case tgBotURL      = "tg_bot"
    case mode          = "mode"
    case away          = "away"
    case policyURL     = "policy"
    case videoURL      = "main_video"
  }
}

extension DECServerUrl: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.apiURL      = try? values.decode(String?.self, forKey: .apiURL)
    self.staticURL   = try? values.decode(String?.self, forKey: .staticURL)
    self.webSocetURL = try? values.decode(String?.self, forKey: .webSocetURL)
    self.tgBotURL    = try? values.decode(String?.self, forKey: .tgBotURL)
    self.mode        = try? values.decode(Int?.self   , forKey: .mode)
    self.away        = try? values.decode(String?.self, forKey: .away)
    self.policyURL   = try? values.decode(String?.self, forKey: .policyURL)
    self.videoURL    = try? values.decode(String?.self, forKey: .videoURL)
  }
}
