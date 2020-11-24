//
//  GDPrayerText.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct GDPrayerText {
  
  public let text : String!
  public let title: String!
  
  init(prayer: DECPrayer) {
    self.text  = prayer.content
    self.title = prayer.title
  }
}
