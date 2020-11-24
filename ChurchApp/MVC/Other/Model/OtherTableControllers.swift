//
//  OtherTableControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 27.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class OtherTableControllers: Controllers {
  
  let setup    : SetupOtherTable!
  let server   : ServerOtherTable!
  let present  : PresentOtherTable!
  let logic    : LogicOtherTable!
  let animation: AnimationOtherTable!
  let router   : RouterOtherTable!
  let vc       : OtherTableViewController!
  let tbvc     : MainTabBarViewController!
  
  init(viewController: OtherTableViewController) {
    
    self.setup     = SetupOtherTable(viewController: viewController)
    self.server    = ServerOtherTable(viewController: viewController)
    self.present   = PresentOtherTable(viewController: viewController)
    self.logic     = LogicOtherTable(viewController: viewController)
    self.animation = AnimationOtherTable(viewController: viewController)
    self.router    = RouterOtherTable(viewController: viewController)
    self.vc        = viewController
    self.tbvc      = viewController.tabBarController as? MainTabBarViewController
  }
}
