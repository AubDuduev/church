//
//  WorshipControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class WorshipControllers: Controllers {
  
  let setup    : SetupWorship!
  let server   : ServerWorship!
  let present  : PresentWorship!
  let logic    : LogicWorship!
  let animation: AnimationWorship!
  let router   : RouterWorship!
  let vc       : WorshipViewController!
  let tbvc     : MainTabBarViewController!
  
  init(viewController: WorshipViewController) {
    
    self.setup     = SetupWorship(viewController: viewController)
    self.server    = ServerWorship(viewController: viewController)
    self.present   = PresentWorship(viewController: viewController)
    self.logic     = LogicWorship(viewController: viewController)
    self.animation = AnimationWorship(viewController: viewController)
    self.router    = RouterWorship(viewController: viewController)
    self.vc        = viewController
    self.tbvc      = viewController.tabBarController as? MainTabBarViewController
  }
}
