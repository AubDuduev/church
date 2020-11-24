//
//  BakeryInfoControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class BakeryInfoControllers: Controllers {
  
  let setup    : SetupBakeryInfo!
  let server   : ServerBakeryInfo!
  let present  : PresentBakeryInfo!
  let logic    : LogicBakeryInfo!
  let animation: AnimationBakeryInfo!
  let router   : RouterBakeryInfo!
  let vc       : BakeryInfoViewController!
  
  init(viewController: BakeryInfoViewController) {
    
    self.setup     = SetupBakeryInfo(viewController: viewController)
    self.server    = ServerBakeryInfo(viewController: viewController)
    self.present   = PresentBakeryInfo(viewController: viewController)
    self.logic     = LogicBakeryInfo(viewController: viewController)
    self.animation = AnimationBakeryInfo(viewController: viewController)
    self.router    = RouterBakeryInfo(viewController: viewController)
    self.vc        = viewController
  }
}
