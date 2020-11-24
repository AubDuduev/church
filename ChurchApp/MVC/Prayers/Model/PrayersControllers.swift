//
//  PrayersControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class PrayersControllers: Controllers {
  
  let setup    : SetupPrayers!
  let server   : ServerPrayers!
  let present  : PresentPrayers!
  let logic    : LogicPrayers!
  let animation: AnimationPrayers!
  let router   : RouterPrayers!
  let vc       : PrayersViewController!
  
  init(viewController: PrayersViewController) {
    
    self.setup     = SetupPrayers(viewController: viewController)
    self.server    = ServerPrayers(viewController: viewController)
    self.present   = PresentPrayers(viewController: viewController)
    self.logic     = LogicPrayers(viewController: viewController)
    self.animation = AnimationPrayers(viewController: viewController)
    self.router    = RouterPrayers(viewController: viewController)
    self.vc        = viewController
  }
}
