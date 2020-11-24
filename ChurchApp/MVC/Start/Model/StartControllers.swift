//
//  StartControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class StartControllers: Controllers {
  
  let setup    : SetupStart!
  let server   : ServerStart!
  let present  : PresentStart!
  let logic    : LogicStart!
  let animation: AnimationStart!
  let router   : RouterStart!
  let vc       : StartViewController!
  
  init(viewController: StartViewController) {
    
    self.setup     = SetupStart(viewController: viewController)
    self.server    = ServerStart(viewController: viewController)
    self.present   = PresentStart(viewController: viewController)
    self.logic     = LogicStart(viewController: viewController)
    self.animation = AnimationStart(viewController: viewController)
    self.router    = RouterStart(viewController: viewController)
    self.vc        = viewController
  }
}
