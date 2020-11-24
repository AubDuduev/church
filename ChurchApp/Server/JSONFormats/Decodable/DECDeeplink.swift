//
//  DECDeeplink.swift
//  DgBetTrip
//
//  Created by Senior Developer on 20.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

struct DECDeeplink {
  
  let ip          : String?
  let IOS         : String?
  let vrt         : String?
  let lang        : String?
  let model       : String?
  let width       : String?
  let timezone    : String?
  let af_status   : String?
  let af_message  : String?
  let install_time: String?
  let IDFA        : String?
  let id          : String?
  
  enum CodingKeys: String, CodingKey {
    
    case ip           = "ip"
    case IOS          = "IOS"
    case vrt          = "vrt"
    case lang         = "lang"
    case model        = "model"
    case width        = "width"
    case timezone     = "timezone"
    case af_status    = "af_status"
    case af_message   = "af_message"
    case install_time = "install_time"
    case IDFA         = "advertising_device_id"
    case id           = "id"
  }
}

extension DECDeeplink: Decodable {
  
  init(from decoder: Decoder) throws {
    
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    self.ip           = try? values.decode(String?.self, forKey: .ip          )
    self.IOS          = try? values.decode(String?.self, forKey: .IOS         )
    self.vrt          = try? values.decode(String?.self, forKey: .vrt         )
    self.lang         = try? values.decode(String?.self, forKey: .lang        )
    self.model        = try? values.decode(String?.self, forKey: .model       )
    self.width        = try? values.decode(String?.self, forKey: .width       )
    self.timezone     = try? values.decode(String?.self, forKey: .timezone    )
    self.af_status    = try? values.decode(String?.self, forKey: .af_status   )
    self.af_message   = try? values.decode(String?.self, forKey: .af_message  )
    self.install_time = try? values.decode(String?.self, forKey: .install_time)
    self.IDFA         = try? values.decode(String?.self, forKey: .IDFA        )
    self.id           = try? values.decode(String?.self, forKey: .id          )
  }
}
