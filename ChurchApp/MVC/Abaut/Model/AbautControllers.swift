//
//  AbautControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 28.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class AbautControllers: Controllers {
  
  let setup    : SetupAbaut!
  let server   : ServerAbaut!
  let present  : PresentAbaut!
  let logic    : LogicAbaut!
  let animation: AnimationAbaut!
  let router   : RouterAbaut!
  let vc       : AbautViewController!
  
  init(viewController: AbautViewController) {
    
    self.setup     = SetupAbaut(viewController: viewController)
    self.server    = ServerAbaut(viewController: viewController)
    self.present   = PresentAbaut(viewController: viewController)
    self.logic     = LogicAbaut(viewController: viewController)
    self.animation = AnimationAbaut(viewController: viewController)
    self.router    = RouterAbaut(viewController: viewController)
    self.vc        = viewController
  }
}
