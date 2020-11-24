//
//  PrayerTextControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class PrayerTextControllers: Controllers {
  
  let setup    : SetupPrayerText!
  let server   : ServerPrayerText!
  let present  : PresentPrayerText!
  let logic    : LogicPrayerText!
  let animation: AnimationPrayerText!
  let router   : RouterPrayerText!
  let vc       : PrayerTextViewController!
  
  init(viewController: PrayerTextViewController) {
    
    self.setup     = SetupPrayerText(viewController: viewController)
    self.server    = ServerPrayerText(viewController: viewController)
    self.present   = PresentPrayerText(viewController: viewController)
    self.logic     = LogicPrayerText(viewController: viewController)
    self.animation = AnimationPrayerText(viewController: viewController)
    self.router    = RouterPrayerText(viewController: viewController)
    self.vc        = viewController
  }
}
