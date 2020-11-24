//
//  MainTabBarControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class MainTabBarControllers: Controllers {
  
  let setup    : SetupMainTabBar!
  let server   : ServerMainTabBar!
  let present  : PresentMainTabBar!
  let logic    : LogicMainTabBar!
  let animation: AnimationMainTabBar!
  let router   : RouterMainTabBar!
  let vc       : MainTabBarViewController!
  
  init(viewController: MainTabBarViewController) {
    
    self.setup     = SetupMainTabBar(viewController: viewController)
    self.server    = ServerMainTabBar(viewController: viewController)
    self.present   = PresentMainTabBar(viewController: viewController)
    self.logic     = LogicMainTabBar(viewController: viewController)
    self.animation = AnimationMainTabBar(viewController: viewController)
    self.router    = RouterMainTabBar(viewController: viewController)
    self.vc        = viewController
  }
}
