//
//  BakeryControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class BakeryControllers: Controllers {
  
  let setup    : SetupBakery!
  let server   : ServerBakery!
  let present  : PresentBakery!
  let logic    : LogicBakery!
  let animation: AnimationBakery!
  let router   : RouterBakery!
  let vc       : BakeryViewController!
  
  init(viewController: BakeryViewController) {
    
    self.setup     = SetupBakery(viewController: viewController)
    self.server    = ServerBakery(viewController: viewController)
    self.present   = PresentBakery(viewController: viewController)
    self.logic     = LogicBakery(viewController: viewController)
    self.animation = AnimationBakery(viewController: viewController)
    self.router    = RouterBakery(viewController: viewController)
    self.vc        = viewController
  }
}
