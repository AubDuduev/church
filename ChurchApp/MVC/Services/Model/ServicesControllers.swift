//
//  ServicesControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class ServicesControllers: Controllers {
  
  let setup    : SetupServices!
  let server   : ServerServices!
  let present  : PresentServices!
  let logic    : LogicServices!
  let animation: AnimationServices!
  let router   : RouterServices!
  let vc       : ServicesViewController!
  let tbvc     : MainTabBarViewController!
  
  init(viewController: ServicesViewController) {
    
    self.setup     = SetupServices(viewController: viewController)
    self.server    = ServerServices(viewController: viewController)
    self.present   = PresentServices(viewController: viewController)
    self.logic     = LogicServices(viewController: viewController)
    self.animation = AnimationServices(viewController: viewController)
    self.router    = RouterServices(viewController: viewController)
    self.vc        = viewController
    self.tbvc      = viewController.tabBarController as? MainTabBarViewController
  }
}
